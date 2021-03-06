//
//  HomeNavigationRoutes.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation
import UIKit

enum HomeNavigationRoutes: Route {
    
    case Details(CityDayWeather, HomeDetailsDelegate)
    case Search([CityDayWeather], HomeDetailsDelegate)
    
    var destination: UIViewController{
        switch self {
        case .Details (let city, let homePresenter):
            guard let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "\(DetailsViewController.self)") as? DetailsViewController else{
                fatalError("Couldn't find VC with the identifier \(DetailsViewController.self)")
            }
    let interactor = DetailsInteractor()
            let persenter = DetailsPresenter(view: detailsVC, city: city, homePresenter: homePresenter, interactor: interactor)
            interactor.presenter = persenter
            detailsVC.presenter = persenter
            
            return detailsVC
            
        case .Search(let cities, let homePresenter):
            guard let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchViewController") as? SearchViewController else{
                fatalError("Couldn't find VC with the identifier \(SearchViewController.self)")
            }
            searchVC.searchPresenter = SearchPresenter(view: searchVC, cities: cities, homePresenter: homePresenter)

            return searchVC
            
        }
    }
    
    var style: NavigationStyle{
        switch self {
        case .Details:
            return .push
        case .Search:
            return .push
        }
    }
    
}
