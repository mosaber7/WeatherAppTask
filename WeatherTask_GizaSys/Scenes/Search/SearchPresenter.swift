//
//  SearchPresenter.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 04/09/2021.
//

import Foundation

protocol SearchPresenterProtocol {
    var searchView: SearchViewProtocol?{get set}
    func textDidChange(searchText: String)
}

class SearchPresenter: SearchPresenterProtocol {
    func textDidChange(searchText: String) {
        
    }
    
    weak var searchView: SearchViewProtocol?
    
    
    init(view: SearchViewProtocol) {
        self.searchView = view
    }
}
