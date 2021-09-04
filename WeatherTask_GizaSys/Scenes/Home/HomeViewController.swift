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
    func presentData()
    
}

//MARK: HomeViewController

class HomeViewController: UIViewController, HomeViewProtocol {
   
    var presenter: HomePresenterProtocol?
    var temp = 5
   

    @IBOutlet weak var homeSearchBar: UISearchBar!
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeSearchBar.delegate = self
        presenter?.presenterDidLoad()
        registerCell()
            }
    
    func presentData() {
        homeTableView.reloadData()
    }
    
}

// MARK: - Private functions
extension HomeViewController{
    private func registerCell(){
        let cityCell = UINib(nibName: "CityCell", bundle: nil)
        homeTableView.register(cityCell, forCellReuseIdentifier: "CityCell")
    }
   
    
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
        self.presenter?.selectCty(at: indexPath)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            temp -= 1
            homeTableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        temp
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "CityCell") as! CityCell
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



