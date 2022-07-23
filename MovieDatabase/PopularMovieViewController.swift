//
//  PopularMovieViewController.swift
//  MovieDatabase
//
//  Created by Maksim Turkin on 22.07.2022.
//
 
import UIKit
import Alamofire

class PopularMovieViewController: UIViewController, UISearchResultsUpdating {
    
    private let apiKey = "b33de6c7d654c036b3ecdaa4d0330403"
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        self.searchController.searchResultsUpdater = self
        setTitle()
        setSearchBarStyle()
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        fetchData(input: text)
        //print(text)
    }
    
    private func setSearchBarStyle() {
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.white
            textfield.placeholder = "Please enter movie name"
        }
    }
    
    private func setTitle() {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Search movie".uppercased()
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
}


extension PopularMovieViewController {
    
    func fetchData(input: String) {
        print("fetch data")
        
        AF.request("https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&language=en-US&query=\(input)", method: .get,  encoding: JSONEncoding.default)
            .responseDecodable(of: ResponseData.self) { (response) in
                print("result \(response.value)")
                //guard let dataFromApi = response.value else { return }
                //print("result count \(dataFromApi.results.count)")
//                self.movies = dataFromApi.results
//
//                self.collectionView?.reloadData()
            }
        
    }
}


