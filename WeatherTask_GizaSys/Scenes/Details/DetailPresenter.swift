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
    var numberOfRows: Int{get}
    var title: String {get}
    func addToFavorite()
    func viewDidLoad()
    func configureCell(cell: DayCellViewProtocol ,at index: IndexPath)
}

protocol DetailsPresenterInteractorProtocol: AnyObject {
    func cityWeekDataFetchedSuccessfully(weekWeather: [CityWeekWeather])
    func dataFetchingFailed(with error: Error)
}

class DetailsPresenter{
    
    private var city: CityDayWeather
    private (set) var cityWeekWeather = [CityWeekWeather]()
    weak var view: DetailsViewProtocol?
    weak var homePresenter: HomeDetailsDelegate?
    private let interactor: DetailsInteractorProtocol
    
    init(view: DetailsViewProtocol, city: CityDayWeather, homePresenter: HomeDetailsDelegate, interactor: DetailsInteractorProtocol) {
        self.view = view
        self.city = city
        self.interactor = interactor
        self.homePresenter = homePresenter
        
    }
   
}

//MARK: - confirmin to DetailPresenterProtocol protocol
extension DetailsPresenter: DetailPresenterProtocol, DetailsPresenterInteractorProtocol{
    
    
    var numberOfRows: Int{
        return 5
    }
    var title: String{
        return self.city.name
    }
    
    func viewDidLoad(){
        hideAddbutton()
        self.interactor.getCityWeekWeather(cityName: self.city.name)
        self.view?.reloadData()
    }
    func addToFavorite() {
        OperationQueue.main.addOperation {
            self.hideAddbutton()
        }
        homePresenter?.addToFavorite(city: city)
    }
    func hideAddbutton(){
        if homePresenter!.hasCityInMainActivty(city: self.city){
            self.view?.hideAddButton()
        }
    }
    
    func cityWeekDataFetchedSuccessfully(weekWeather: [CityWeekWeather]) {
        self.cityWeekWeather.append(contentsOf: weekWeather)
        self.view?.reloadData()
    }
    
    func dataFetchingFailed(with error: Error) {
        fatalError("Failed to fetch Data")
    }
    
    func configureCell(cell: DayCellViewProtocol, at index: IndexPath) {
        guard cityWeekWeather.count > 0 else {
            return
        }
        let dayWeather = cityWeekWeather[index.row]
        cell.configCell(cityDayWeather: dayWeather)
    }
    

}
