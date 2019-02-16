//
//  File.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/12/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pokeCollectionView.frame.width/4, height: pokeCollectionView.frame.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInsets = UIEdgeInsets(top:0.0, left: 20.0, bottom: 0.0, right: 20.0)
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pokeCollectionView.dequeueReusableCell(withReuseIdentifier: "subCell", for: indexPath as IndexPath) as! SearchCollectionViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        let size = CGSize(width: pokeCollectionView.frame.width/4, height: pokeCollectionView.frame.height/3)
        cell.initCellFrom(size: size)
        let pokemon : Pokemon
        if isFiltering() || appliedFilters {
            pokemon = filteredPokemon[indexPath.row]
        } else if randomMode {
            pokemon = pokemonArray.shuffled()[indexPath.row]
        } else if favoritesMode {
            let favorites = UserDefaults.standard.array(forKey: "pokemon") as! [Int]
            pokemon = pokemonArray[favorites[indexPath.row] - 1]
        }  else {
            pokemon = pokemonArray[indexPath.row]
        }
        cell.nameLabel.text = "\(pokemon.name!)"
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
