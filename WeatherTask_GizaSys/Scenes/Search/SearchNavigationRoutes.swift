//
//  SearchNavigationRoutes.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 04/09/2021.
//

import Foundation
import UIKit

enum SearchNavigationRoutes: Route {
    
    case Details(String)
    var destination: UIViewController{
        switch self {
        case .Details (let cityName):
            let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            
            return detailsVC
            
        }
        
    }
    
    var style: NavigationStyle{
        switch self {
        case .Details(_):
            return .push
        
    }
    
    }
    
}
