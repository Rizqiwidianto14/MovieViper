//
//  HomePageProtocol.swift
//  MovieViper
//
//  Created by Rizqi Imam Gilang Widianto on 10/11/21.
//

import UIKit

protocol ViewToPresenterHomePageProtocol: AnyObject {
    var view: PresenterToViewHomePageProtocol? {get set}
    var interactor: PresenterToInteractorHomePageProtocol? {get set}
    var router: PresenterToRouterHomePageProtocol? {get set}
    func startFetchingMovies()
}

protocol PresenterToViewHomePageProtocol: AnyObject{
    func onMovieResponseSuccess(movieModelArrayList: Array<ListModel>)
    func onMovieResponseFailed(error: String)
}

protocol PresenterToInteractorHomePageProtocol: AnyObject{
    var presenter: InteractorToPresenterHomePageProtocol? {get set}
    func fetchMovie(page: Int, completion: @escaping([ListModel]) -> (), onFailed:((String) -> Void)?)
}

protocol PresenterToRouterHomePageProtocol: AnyObject{
    static func createHomePageModule() -> HomePageVC
    func pushToDetailScreen(navigationConroller:UINavigationController)

}

protocol InteractorToPresenterHomePageProtocol:AnyObject {
    func movieFetchSuccess(movieList:Array<ListModel>)
    func movieFetchFailed()
}
