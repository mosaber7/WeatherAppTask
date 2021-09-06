//
//  SearchNavigationRoutes.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 04/09/2021.
//

import Foundation
import UIKit

enum SearchNavigationRoutes: Route {
    
    case Details(CityDayWeather, HomeDetailsDelegate)
    var destination: UIViewController{
        switch self {
        case .Details (let city, let delegate):
            let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            let interactor = DetailsInteractor()
            let presenter = DetailsPresenter(view: detailsVC, city: city, homePresenter: delegate, interactor: interactor )
            detailsVC.presenter = presenter
            interactor.presenter = presenter
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
