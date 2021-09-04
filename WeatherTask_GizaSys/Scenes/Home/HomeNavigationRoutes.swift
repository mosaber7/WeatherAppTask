//
//  HomeNavigationRoutes.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation
import UIKit

enum HomeNavigationRoutes: Route {
    
    case Details(City)
    case Search([City])
    
    var destination: UIViewController{
        switch self {
        case .Details (let city):
            let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            
            return detailsVC
            
        case .Search(let cities):
            let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchViewController") as! SearchViewController
            searchVC.searchPresenter = SearchPresenter(view: searchVC, cities: cities)
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
