//
//  HomePagePresenter.swift
//  MovieViper
//
//  Created by Rizqi Imam Gilang Widianto on 10/11/21.
//

import Foundation

class HomePagePresenter: ViewToPresenterHomePageProtocol{
  

    var view: PresenterToViewHomePageProtocol?
    
    var interactor: PresenterToInteractorHomePageProtocol?
    
    var router: PresenterToRouterHomePageProtocol?
    
    func startFetchingMovies() {
        
        interactor?.fetchMovie(page: 1, completion: { (result) in
            if result.count > 0{
                print(result)
            }
        }, onFailed: { (error) in
            print(error)
        })
    }
    
}

extension HomePagePresenter: InteractorToPresenterHomePageProtocol{
    func movieFetchSuccess(movieList: Array<ListModel>) {
        view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Fetching Error")
    }
    
    
}
