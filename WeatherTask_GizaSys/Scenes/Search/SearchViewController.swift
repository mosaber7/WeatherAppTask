//
//  SearchViewController.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 04/09/2021.
//

import UIKit

protocol SearchViewProtocol: AnyObject {
    var searchPresenter: SearchPresenterProtocol?{set get}
}

class SearchViewController: UIViewController, SearchViewProtocol {

    @IBOutlet weak var citiesSearchBar: UISearchBar!
    @IBOutlet weak var resultsTableView: UITableView!
    
    var searchPresenter: SearchPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
}
// MARK: - Search Bar TableView setup
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

//MARK: - Search Bar setup
extension SearchViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        resultsTableView.isHidden = false
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        citiesSearchBar.resignFirstResponder()
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchPresenter?.textDidChange(searchText: searchText)
    }
}

