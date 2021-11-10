//
//  HomePageModel.swift
//  MovieViper
//
//  Created by Rizqi Imam Gilang Widianto on 10/11/21.
//

import Foundation
import ObjectMapper


private let RESULTS = "results"
private let POSTER = "poster_path"
private let TITLE = "title"

class ListModel: Mappable{
    internal var results: ResultModel?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        results <- map[RESULTS]
    }
    
}

class ResultModel: Mappable{
    internal var posterImage: String?
    internal var title: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        posterImage <- map[POSTER]
        title <- map[TITLE]
    }
    
    
}




