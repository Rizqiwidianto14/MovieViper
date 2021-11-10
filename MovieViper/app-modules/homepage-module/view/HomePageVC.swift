//
//  ViewController.swift
//  MovieViper
//
//  Created by Rizqi Imam Gilang Widianto on 10/11/21.
//

import UIKit

class HomePageVC: UIViewController {
    @IBOutlet weak var homePageCollectionView: UICollectionView!
    var presentor: ViewToPresenterHomePageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentor?.startFetchingMovies()
        // Do any additional setup after loading the view.
    }


}


extension HomePageVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        return cell
    }
    
    
}

extension HomePageVC: PresenterToViewHomePageProtocol{
    func onMovieResponseSuccess(movieModelArrayList: Array<ListModel>) {
        print("test")
    }
    
    func onMovieResponseFailed(error: String) {
        print("test")
    }
    
    
}

