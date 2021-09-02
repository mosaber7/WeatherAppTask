//
//  ViewController.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 01/09/2021.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    func presentData() {
        homeTableView.reloadData()
    }
    
     var presenter: HomePresenterProtocol?
    
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.presenterDidLoad()
        registerCell()
        
        
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
        
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityCell
        cell?.configCell(cityName: "Cairo", temp: self.presenter?.city?.main.temp ?? 0, windSpeed: self.presenter?.city?.wind.speed ?? 0, weather: self.presenter?.city?.weather[0].weatherDescription ?? "")
        return cell ?? UITableViewCell()
    }
}

