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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let searchController = UISearchController()
    
    var searchTimer: Timer?
    
    private var movies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        self.searchController.searchResultsUpdater = self

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.contentInset = UIEdgeInsets(top: 59, left: 24, bottom: 0, right: 24)
        
        setTitle()
        setSearchBarStyle()
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        self.searchTimer?.invalidate()
        
        guard let text = searchController.searchBar.text else {
            return
        }
        
        searchTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            self.fetchData(input: text)
        }
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

extension PopularMovieViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Hello")
    }
}

extension PopularMovieViewController: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("TEST21 \(movies.count)")
        return movies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMovieCell", for: indexPath) as? PopularMovieCell {
            cell.configure(movie: movies[indexPath.row])
            print("AXAX return PopularMovieCell \(movies[indexPath.row])")
            return cell
        }
        print("AXAX return default")
       return UICollectionViewCell()
    }
    
    
}


extension PopularMovieViewController {
    
    func fetchData(input: String) {
        AF.request("https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&language=en-US&query=\(input)", method: .get,  encoding: JSONEncoding.default)
            .responseDecodable(of: ResponseData.self) { (response) in
                guard let dataFromApi = response.value else { return }
                
                self.movies = dataFromApi.results ?? []
                self.collectionView?.reloadData()
            }
        
    }
}


