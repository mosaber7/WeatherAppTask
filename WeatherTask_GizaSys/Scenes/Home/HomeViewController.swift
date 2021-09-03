//
//  ViewController.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 01/09/2021.
//

import UIKit
import CoreLocation

//MARK:- View Protocol
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol?{get set}
    func presentData()
    
}

//MARK: HomeViewController

class HomeViewController: UIViewController, HomeViewProtocol {
   
    var presenter: HomePresenterProtocol?
    var temp = 5
    var locationManager: CLLocationManager{
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }

    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
    private func locationManagerSetup(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        presenter?.ConfigureCell(cell: cell)
        return cell 
    }
    
}

//MARK: - Location Managing

extension HomeViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

