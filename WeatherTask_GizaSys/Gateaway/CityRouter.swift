//
//  CityRouter.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation
import Alamofire

enum CityRouter: URLRequestConvertible{
    
    static let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
    
    case city(String)
    
    var httpMethod: HTTPMethod?{
        switch self {
        case .city(_):
            return .get
        }
    }
    var path:String{
        switch self {
        case .city(let cityString):
            return cityString
        
        }
    }
    
    var APIKey: String {
        switch self {
        case .city(_):
            return "&appid=9a190dbacbbadc0a62ed88b79031bbeb"
        
        }
    }
    
    var parameters:  [String: Any]?{
        switch self {
        case .city(_):
            return nil
        }
        
    }
        
        var headers: [String: String]{
            switch self {
            case .city(_):
                return [:]
            }
        }
        var encoding: ParameterEncoding{
            switch self {
            case .city(_):
                return JSONEncoding.default
            }
        }
    func asURLRequest() throws -> URLRequest {
        let urlString = CityRouter.baseUrl + self.path + self.APIKey
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.method = self.httpMethod
        request.headers = HTTPHeaders(headers)
        return try! encoding.encode(request, with: self.parameters)
    }
    
    
}
