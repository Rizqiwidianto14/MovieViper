//
//  ViewController.swift
//  MovieViper
//
//  Created by Rizqi Imam Gilang Widianto on 10/11/21.
//

import UIKit
import SDWebImage

class HomePageVC: UIViewController {
    @IBOutlet weak var homePageCollectionView: UICollectionView!
    var presentor: ViewToPresenterHomePageProtocol?
    var movieList: Array<ListModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentor?.startFetchingMovies()
        
    }

    
}


extension HomePageVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("counted")
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        cell.homePageTitle.text = movieList[indexPath.row].title
        return cell
    }
    
    
}

extension HomePageVC: PresenterToViewHomePageProtocol{

    func onMovieResponseFailed(error: String) {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    func onMovieResponseSuccess(movieModelArrayList: Array<ListModel>) {
            self.movieList = movieModelArrayList
        self.homePageCollectionView.reloadData()


    }
    
 

    }


    
    


