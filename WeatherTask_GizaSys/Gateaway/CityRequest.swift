//
//  CityRequest.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation
import Alamofire

class cityRequest{
func retrieveCityWeather(city: String, _ compeletionHandler: @escaping(Result<City, AFError>)-> Void){
    let route = CityRouter.city(city)
    AF.request(route).responseDecodable { (responce: DataResponse<City, AFError>) in
        switch responce.result{
        
        case .success(let city):
            compeletionHandler(.success(city))
        case .failure(let error):
            compeletionHandler(.failure(error))
        }
    }
    
}
    
}
