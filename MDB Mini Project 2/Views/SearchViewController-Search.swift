//
//  SearchViewController-Search.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/12/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

extension MainViewController :  UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate  {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(pokeSearch.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return pokeSearch.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return pokeSearch.isActive && !searchBarIsEmpty()
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
//        if appliedFilters {
//            filteredPokemon = filteredPokemon.filter({(pokemon : Pokemon) -> Bool in
//                var idNumberMatches = false
//                if let pokemonId = pokemon.number {
//                    idNumberMatches = String(pokemonId).contains(searchText)
//                }
//                return pokemon.name.lowercased().contains(searchText.lowercased()) || idNumberMatches
//            })
//        } else {
            filteredPokemon = pokemonArray.filter({(pokemon : Pokemon) -> Bool in
                var idNumberMatches = false
                if let pokemonId = pokemon.number {
                    idNumberMatches = String(pokemonId).contains(searchText)
                }
                return pokemon.name.lowercased().contains(searchText.lowercased()) || idNumberMatches
            })
//        }
        
        pokeTableView.reloadData()
        pokeCollectionView.reloadData()
    }
    
    func filterFromFilters(minAtk: Int, minDef: Int, minHP: Int, typesArray: [String]) {
        appliedFilters = true
        print("success")
        filteredPokemon = pokemonArray.filter({(pokemon : Pokemon) -> Bool in
            let attack = pokemon.attack >= minAtk
            let defense = pokemon.defense >= minDef
            let hp = pokemon.health >= minHP
            var type = false
            if !typesArray.isEmpty {
                for str in pokemon.types {
                    if typesArray.contains(str) {
                        type = true
                    }
                }
            } else {
                type = true
            }
            return attack && defense && hp && type
        })
        pokeTableView.reloadData()
        pokeCollectionView.reloadData()
        
        
        
        
    }

}
