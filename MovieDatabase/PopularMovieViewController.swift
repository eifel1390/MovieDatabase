//
//  PopularMovieViewController.swift
//  MovieDatabase
//
//  Created by Maksim Turkin on 22.07.2022.
//
 
import UIKit

class PopularMovieViewController: UIViewController, UISearchResultsUpdating {
    
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
        print(text)
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


