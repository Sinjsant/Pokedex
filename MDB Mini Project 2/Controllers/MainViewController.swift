//
//  SearchViewController.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/10/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var pokeTableView : UITableView!
    var pokeCollectionView : UICollectionView!
    var pokeSearch : UISearchController!
    var filteredPokemon : [Pokemon]!
    var appliedFilters: Bool!
    var randomMode : Bool!
    var favoritesMode = false
    var selectedPokemon : Pokemon!
    let pokemonArray = PokemonGenerator.getPokemonArray().sorted(by: {$0.number < $1.number})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initUI()
        setupViews()
        UserDefaults.standard.set([Int](), forKey: "pokemon")
//        SearchViewController.printFontFamilies()
    
       
    }
//    public static func printFontFamilies() {
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
//
//    }
    
    
    


}



