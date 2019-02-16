//
//  SearchViewController-Table.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/10/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

extension MainViewController : UITableViewDataSource, UITableViewDelegate {

    func height(for index: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() || appliedFilters {
            return filteredPokemon.count
        } else if randomMode {
            return 20
        } else if favoritesMode {
            let favorites = UserDefaults.standard.array(forKey: "pokemon") as! [Int]
            return favorites.count
        }
        return pokemonArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokeTableView.dequeueReusableCell(withIdentifier: "mainCell") as! SearchTableViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        let size = CGSize(width: pokeTableView.frame.width, height: height(for: indexPath))
        cell.initCellFrom(size: size)
        let pokemon : Pokemon
        
        if isFiltering() || appliedFilters{
            pokemon = filteredPokemon[indexPath.row]
        } else if randomMode {
            pokemon = pokemonArray.shuffled()[indexPath.row]
        } else if favoritesMode {
            let favorites = UserDefaults.standard.array(forKey: "pokemon") as! [Int]
            pokemon = pokemonArray[favorites[indexPath.row]-1]
        } else {
            pokemon = pokemonArray[indexPath.row]
        }
        
        cell.nameLabel.text = "\(pokemon.name!)"
        cell.numLabel.text = "#\(pokemon.number!)"
        let imageString = pokemon.imageUrl
        if let url = URL(string: imageString!) {
            do {
                let data = try Data(contentsOf: url)
                cell.pokeImage.image = UIImage(data: data)
            } catch let err {
                print("Error : \(err.localizedDescription)")
                cell.pokeImage.image = UIImage(named: "Pokeball")
            }
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon : Pokemon
        
        if isFiltering() || appliedFilters{
            pokemon = filteredPokemon[indexPath.row]
        } else if randomMode {
            pokemon = pokemonArray.shuffled()[indexPath.row]
        } else {
            pokemon = pokemonArray[indexPath.row]
        }
        selectedPokemon = pokemon
        openProfile()
    }
    
    
    
}
