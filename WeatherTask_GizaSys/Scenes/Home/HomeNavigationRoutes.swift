//
//  HomeNavigationRoutes.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation
import UIKit

enum HomeNavigationRoutes: Route {
    
    case Details(City, HomeDetailsDelegate)
    case Search([City], HomeDetailsDelegate)
    
    var destination: UIViewController{
        switch self {
        case .Details (let city, let homePresenter):
            let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            detailsVC.presenter = DetailsPresenter(view: detailsVC, city: city, homePresenter: homePresenter)
  
            return detailsVC
            
        case .Search(let cities, let homePresenter):
            let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchViewController") as! SearchViewController
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
