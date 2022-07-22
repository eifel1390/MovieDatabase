//
//  PopularMovieViewController.swift
//  MovieDatabase
//
//  Created by Maksim Turkin on 22.07.2022.
//

import UIKit

class PopularMovieViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchBarStyle()
        
    }
    
    private func setSearchBarStyle() {
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = UIColor(named: "BackgroundColor")
            textfield.textColor = UIColor.white
        }
    }
    

}


