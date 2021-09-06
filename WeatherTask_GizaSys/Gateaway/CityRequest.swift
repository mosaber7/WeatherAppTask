//
//  CityRequest.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation
import Alamofire

class cityRequest{
func retrieveCityDayWeather(cityName: String, _ compeletionHandler: @escaping(Result<CityDayWeather, AFError>)-> Void){
    let route = CityRouter.day(cityName)
    AF.request(route).responseDecodable { (responce: DataResponse<CityDayWeather, AFError>) in
        switch responce.result{
        
        case .success(let cityDayWeather):
            compeletionHandler(.success(cityDayWeather))
        case .failure(let error):
            compeletionHandler(.failure(error))
        }
    }
    
}
    
    //MARK: - Details screen API call
    func retrieveCityWeekWeather(cityName: String, _ compeltion: @escaping(Result<[CityWeekWeather], AFError>)-> Void){
        let route = CityRouter.week(cityName)
        AF.request(route).responseDecodable { (responce: DataResponse<CityWeekWeatherContainer, AFError>) in
            switch responce.result{
            
            case .success(let cityWeekWeather):
                print("data fetched 1")
                compeltion(.success(cityWeekWeather.CityWeekWeather))
            case .failure(let error):
                print(error)
                compeltion(.failure(error))
            }
        }
    }
    
}
