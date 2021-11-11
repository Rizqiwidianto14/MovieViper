//
//  HomePagePresenter.swift
//  MovieViper
//
//  Created by Rizqi Imam Gilang Widianto on 10/11/21.
//

import Foundation

class HomePagePresenter: ViewToPresenterHomePageProtocol{
  

    var view: PresenterToViewHomePageProtocol?
    
    var movieList: Array<ListModel> = Array()
    
    var interactor: PresenterToInteractorHomePageProtocol?
    
    var router: PresenterToRouterHomePageProtocol?
    
    func startFetchingMovies() {
        interactor?.fetchMovie(page: 1, completion: { (result) in
            DispatchQueue.main.async {
                self.movieList = result
            }
            
        }, onFailed: { (error) in
        })
        
    }
    
}

extension HomePagePresenter: InteractorToPresenterHomePageProtocol{
    func movieFetchSuccess(movieList: Array<ListModel>) {
        self.view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Fetching Error")
    }
    
    
}
