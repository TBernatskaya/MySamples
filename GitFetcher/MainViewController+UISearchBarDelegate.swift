//
//  MainViewController+UISearchBarDelegate.swift
//  GitFetcher
//
//  Created by Tatiana Bernatskaya on 2018-09-19.
//  Copyright © 2018 Tatiana Bernatskaya. All rights reserved.
//

import UIKit

extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        ApiService().repositories(for: searchText, completion: { repositories, error in
            if let repositories = repositories {
                self.repositoriesList = repositories
            } else if let error = error {
                self.searchResultsTableView.isHidden = true
                self.errorLabel.text = error.localizedDescription
                self.errorLabel.isHidden = false
            }
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            clearView()
        }
    }
    
    func searchBarCancelButtonClicked(_ seachBar: UISearchBar) {
        clearView()
    }
}
