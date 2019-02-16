//
//  SearchCollectionViewCell.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/12/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    var nameLabel : UILabel!
    var pokeImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    func initCellFrom(size: CGSize) {
        pokeImage = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height-20))
        pokeImage.contentMode = .scaleAspectFit
        contentView.addSubview(pokeImage)
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: size.height - 30, width: size.width, height: 40))
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.2
        nameLabel.font = UIFont(name: "Menlo-Regular", size: 14.0)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        contentView.addSubview(nameLabel)
        
    }
}
