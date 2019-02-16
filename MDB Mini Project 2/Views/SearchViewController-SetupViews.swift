//
//  SearchViewController-SetupViews.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/12/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

extension MainViewController {
    func setupViews() {
        appliedFilters = false
        randomMode = false
        filteredPokemon = [Pokemon]()
        let modes = ["Table", "Grid"]
        let segmentedControl = UISegmentedControl(items: modes)
        segmentedControl.frame = CGRect(x: view.frame.width/2 - 150, y: 150, width: 300, height: 30)
        segmentedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        let attr = NSDictionary(object: UIFont(name: "Menlo-Regular", size: 20.0)!, forKey: NSAttributedString.Key.font as NSCopying)
        segmentedControl.setTitleTextAttributes(attr as [NSObject : AnyObject] as? [NSAttributedString.Key : Any] , for: .normal)
        view.addSubview(segmentedControl)
        
        pokeTableView = UITableView(frame: CGRect(x: 0, y: segmentedControl.frame.maxY + 10, width: view.frame.width, height: 650))
        pokeTableView.dataSource = self
        pokeTableView.delegate = self
        pokeTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "mainCell")
        pokeTableView.backgroundView?.backgroundColor = nil
        pokeTableView.backgroundColor = UIColor(red: 112/255, green: 188/255, blue: 246/255, alpha: 0.3)
        pokeTableView.layer.cornerRadius = 30.0
        view.addSubview(pokeTableView)
        
        pokeCollectionView = UICollectionView(frame: CGRect(x: 0, y: segmentedControl.frame.maxY + 10, width: view.frame.width, height: 650), collectionViewLayout: UICollectionViewFlowLayout())
        pokeCollectionView.dataSource = self
        pokeCollectionView.delegate = self
        pokeCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "subCell")
        pokeCollectionView.layer.cornerRadius = 30.0
        pokeCollectionView.backgroundColor = .white
        
        
        pokeSearch = UISearchController(searchResultsController: nil)
        pokeSearch.searchResultsUpdater = self
        pokeSearch.delegate = self
        pokeSearch.searchBar.delegate = self
        pokeSearch.obscuresBackgroundDuringPresentation = false
        self.pokeSearch.hidesNavigationBarDuringPresentation = false
        pokeSearch.searchBar.placeholder = "Search for Pokémon"
        self.definesPresentationContext = true
        //        self.navigationItem.titleView = pokeSearch.searchBar
        let navLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 70))
        navLabel.center = CGPoint(x: view.frame.width/2, y: 35)
        navLabel.font = .boldSystemFont(ofSize: 28)
        navLabel.text = "Pokédex Search"
        navLabel.textAlignment = .center
        self.navigationItem.titleView = navLabel
        self.navigationItem.searchController = pokeSearch
        //        self.navigationItem.title = "Pokédex Search"
        //        self.navigationController?.navigationBar.prefersLargeTitles = true
        //        navigationItem.largeTitleDisplayMode = .always
        navigationItem.hidesSearchBarWhenScrolling = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .done, target: self, action: #selector(openFilters))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Favorites", style: .done, target: self, action: #selector(openFavorites))
        
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            pokeCollectionView.removeFromSuperview()
            view.addSubview(pokeTableView)
            break
        case 1:
            pokeTableView.removeFromSuperview()
            view.addSubview(pokeCollectionView)
            break
        default:
            break
        }
    }
    
    @objc func openFilters() {
        performSegue(withIdentifier: "toFilters", sender: self)
    }
    
    @objc func openFavorites() {
        favoritesMode = true
        pokeTableView.reloadData()
        pokeCollectionView.reloadData()
    }
    
    @objc func openProfile() {
        performSegue(withIdentifier: "toProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilters" {
            let resultVC = segue.destination as! FiltersViewController
            resultVC.svc = self
        } else if segue.identifier == "toProfile" {
            let resultVC = segue.destination as! ProfileViewController
            resultVC.name = selectedPokemon.name
            resultVC.imgURL = selectedPokemon.imageUrl
            resultVC.num = selectedPokemon.number
            resultVC.atk = "\(selectedPokemon.attack!)"
            resultVC.def = "\(selectedPokemon.defense!)"
            resultVC.hp = "\(selectedPokemon.health!)"

        }
    }
}
