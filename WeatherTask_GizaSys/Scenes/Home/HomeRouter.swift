//
//  HomeRouter.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    
}


class HomeRouter: HomeRouterProtocol{
   
    weak var vc : UIViewController?
    
    
    static func createHomeModule() -> UIViewController{
        guard  let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "\(HomeViewController.self)") as? HomeViewController else{
            
            fatalError("Couldn't find VC with the identifies \(HomeViewController.self)")
        }
        let router = HomeRouter()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        router.vc = view
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
        
    }
    
}
