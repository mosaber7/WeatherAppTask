//
//  ViewController.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 01/09/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = cityRequest()
        request.retrieveCityWeather(city: "Cairo") { (result) in
            switch result{
            
            case .success(let city):
                print(city.weather)
            case .failure(let error):
                print(error)
            }
        }
    }


}

