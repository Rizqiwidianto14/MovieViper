//
//  HomePageRouter.swift
//  MovieViper
//
//  Created by Rizqi Imam Gilang Widianto on 10/11/21.
//

import Foundation
import UIKit

class HomePageRouter: PresenterToRouterHomePageProtocol{
  
    
    static func createHomePageModule() -> HomePageVC {
        
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomePageVC") as! HomePageVC
        let presenter: ViewToPresenterHomePageProtocol & InteractorToPresenterHomePageProtocol = HomePagePresenter()
        let interactor: PresenterToInteractorHomePageProtocol = HomePageInteractor()
        let router: PresenterToRouterHomePageProtocol = HomePageRouter()
        
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToDetailScreen(navigationConroller: UINavigationController) {
        print("")
    }
    

}
