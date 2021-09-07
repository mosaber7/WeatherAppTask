//
//  SearchViewController.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 04/09/2021.
//

import UIKit

// MARK: - Search View Protocol
protocol SearchViewProtocol: AnyObject, NavigationRoute {
    var searchPresenter: SearchPresenterProtocol?{set get}
    func showTablView()
    func reloadData()
}


// MARK: - Search View VC
class SearchViewController: UIViewController  {
    
    @IBOutlet private weak var citiesSearchBar: UISearchBar!
    @IBOutlet private weak var resultsTableView: UITableView!
    
    var searchPresenter: SearchPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()

        // Do any additional setup after loading the view.
    }
    
   
      
}
// MARK: - Search View Protocol

extension SearchViewController: SearchViewProtocol{
    func showTablView() {
        resultsTableView.isHidden = false
    }
    func reloadData() {
        resultsTableView.reloadData()
    }
}

// MARK: - Search Bar TableView setup
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         self.searchPresenter?.rowsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView.dequeue() as SearchTableViewCell
        self.searchPresenter?.configureCell(cell: cell, indexPath: indexPath )
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchPresenter?.selectCity(at: indexPath)
    }
    
}

//MARK: - Search Bar setup
extension SearchViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        citiesSearchBar.resignFirstResponder()
    }
    
   
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchPresenter?.textDidChange(searchText: searchText)
    }
}

// MARK: - Private Helper Methods

extension SearchViewController{
    private func registerCell(){
        
        resultsTableView.registerNib(cell: SearchTableViewCell.self)
    }
    
}
