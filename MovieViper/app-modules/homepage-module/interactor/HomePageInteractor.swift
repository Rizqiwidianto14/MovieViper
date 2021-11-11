//
//  HomePageInteractor.swift
//  MovieViper
//
//  Created by Rizqi Imam Gilang Widianto on 10/11/21.
//

import Foundation
import Moya_ObjectMapper
import Moya

protocol Network{
    associatedtype T: TargetType
    var provider: MoyaProvider<T> {get}
}

class HomePageInteractor: Network, PresenterToInteractorHomePageProtocol{
 

    var presenter: InteractorToPresenterHomePageProtocol?
    let provider = MoyaProvider<MoyaRepository>()
    static let MovieAPIKey = "40ddaf11b2dceca49d91ea17022d894c"
    
    func fetchMovie(page: Int, completion: @escaping ([ListModel]) -> (),onFailed: ((String) -> Void)?) {
        provider.request(.homePage(page: page)) { result in
            switch result{
                
            case let .success(response):
                do{
                  
                    let results = try response.mapArray(ListModel.self, atKeyPath: "results")
                    self.presenter?.movieFetchSuccess(movieList: results)
                    
                    
                    
 
                } catch let error {
                    let err = error as NSError
                    self.presenter?.movieFetchFailed()
                    onFailed?(err.domain)
                    
                }
            case let .failure(error):
                let err = error as NSError
                self.presenter?.movieFetchFailed()
                onFailed?(err.domain)

                
            }
            
        }
    }
    
    
        

    }

