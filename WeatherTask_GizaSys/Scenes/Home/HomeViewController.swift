//
//  ViewController.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 01/09/2021.
//

import UIKit
import CoreLocation

//MARK:- View Protocol
protocol HomeViewProtocol: AnyObject, NavigationRoute {
    var presenter: HomePresenterProtocol?{get set}
    func reloadData()
    
}

//MARK: HomeViewController

class HomeViewController: UIViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol?
    
    
    @IBOutlet private weak var homeSearchBar: UISearchBar!
    @IBOutlet private weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeSearchBar.delegate = self
        title = "Home"
        
        DispatchQueue.main.async {
            self.presenter?.presenterDidLoad()
        }
        
        registerCell()
    }
    
    func reloadData() {
        homeTableView.reloadData()
    }
    
}

// MARK: - Private functions
extension HomeViewController{
    private func registerCell(){
        homeTableView.registerNib(cell: CityCell.self)
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.selectedCity(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.presenter?.removeCity(at: indexPath)
            homeTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.numberOfRows ?? 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeue() as CityCell
        presenter?.ConfigureCell(cell: cell, at: indexPath)
        return cell 
    }
    
    
}

//MARK: - Search Bar Setup
extension HomeViewController: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        presenter?.searchBarClicked()
    }
    
}



