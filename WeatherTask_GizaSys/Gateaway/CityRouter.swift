//
//  CityRouter.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation
import Alamofire

enum CityRouter: URLRequestConvertible{
    
    static let baseUrl = "https://api.openweathermap.org/data/2.5/"
    
    case day(String)
    case week(String)
    
    
    var callType: String{
        switch self {
        case .day:
            return "weather?q="
        case .week:
            return "forecast?q="
        }
    }
    
        var httpMethod: HTTPMethod?{
            switch self {
            case .day ,.week:
                return .get
            }
        }
        var path:String{
            switch self {
            case .day(let cityNameString), .week(let cityNameString):
                return cityNameString
            }
        }
        
        var APIKey: String {
            switch self {
            case .day, .week:
                return "&appid=9a190dbacbbadc0a62ed88b79031bbeb"
            }
        }
        
        var parameters:  [String: Any]?{
            switch self {
            case .day, .week:
                return nil
            }
        }
        
        var headers: [String: String]{
            switch self {
            case .day, .week:
                return [:]
            }
        }
    
        var encoding: ParameterEncoding{
            switch self {
            case .day, .week:
                return JSONEncoding.default
            }
        }
    
        func asURLRequest() throws -> URLRequest {
            let urlString = CityRouter.baseUrl + self.callType + self.path + self.APIKey
            let url = URL(string: urlString)!
            var request = URLRequest(url: url)
            request.method = self.httpMethod
            request.headers = HTTPHeaders(headers)
            return try! encoding.encode(request, with: self.parameters)
        }
        
        
    }
