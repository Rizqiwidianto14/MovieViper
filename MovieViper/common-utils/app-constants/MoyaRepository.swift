//
//  HomePageApi.swift
//  MovieViper
//
//  Created by Rizqi Imam Gilang Widianto on 10/11/21.
//

import Foundation
import Moya

enum MoyaRepository{
    case homePage(page: Int)
    case detailPage(id: String)
}

extension MoyaRepository: TargetType{
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie") else {fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .homePage:
            return "/popular"
        case .detailPage:
            return ""
            
        }
    }
    
    var method: Moya.Method {
        return Moya.Method.get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .homePage(let page):
            return .requestParameters(parameters: ["page":page, "api_key": HomePageInteractor.MovieAPIKey], encoding: URLEncoding.queryString)
        case .detailPage(let id):
            return .requestParameters(parameters: ["id":id,"api_key": HomePageInteractor.MovieAPIKey], encoding: URLEncoding.queryString)
        }
    
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}


