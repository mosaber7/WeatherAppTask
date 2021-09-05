//
//  DetailPresenter.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation

protocol DetailPresenterProtocol {
    var view: DetailsViewProtocol? {set get}
    var homePresenter: HomeDetailsDelegate?{set get}
    func addToFavorite()
}

class DetailsPresenter: DetailPresenterProtocol{
    private var city: City?
    weak var view: DetailsViewProtocol?
    weak var homePresenter: HomeDetailsDelegate?
    
    init(view: DetailsViewProtocol, city: City, homePresenter: HomeDetailsDelegate) {
        self.view = view
        self.city = city
        self.homePresenter = homePresenter
        
    }
    
    func addToFavorite() {
        guard let city = city else {
            return
        }
        homePresenter?.addToFavorite(city: city)
    }
    
    
}
