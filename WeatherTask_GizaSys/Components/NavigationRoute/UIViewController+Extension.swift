//
//  UIViewController+Extension.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation
import UIKit

protocol NavigationRoute {
    func navigate(to route: Route)
}

extension UIViewController: NavigationRoute{
    func navigate(to route: Route) {
        switch route.style {
        
        case .push:
            self.navigationController?.pushViewController(route.destination, animated: true)
        case .modal:
            
            self.present(route.destination, animated: true, completion: nil)
        }
    }
    
    
}
