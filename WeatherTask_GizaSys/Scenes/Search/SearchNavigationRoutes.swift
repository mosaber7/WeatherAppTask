//
//  SearchNavigationRoutes.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 04/09/2021.
//

import Foundation
import UIKit

enum SearchNavigationRoutes: Route {
    
    case Details(City, HomeDetailsDelegate)
    var destination: UIViewController{
        switch self {
        case .Details (let city, let delegate):
            let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            detailsVC.presenter = DetailsPresenter(view: detailsVC, city: city, homePresenter: delegate )
            return detailsVC
            
        }
        
    }
    
    var style: NavigationStyle{
        switch self {
        case .Details:
            return .push
        
    }
    
    }
    
}
