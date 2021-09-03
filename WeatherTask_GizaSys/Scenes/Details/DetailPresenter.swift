//
//  DetailPresenter.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation

protocol DetailPresenterProtocol {
    var view: DetailsViewProtocol? {set get}
}

class DetailsPresenter: DetailPresenterProtocol{
    weak var view: DetailsViewProtocol?
    
    
}
