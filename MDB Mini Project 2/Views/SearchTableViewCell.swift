//
//  SearchTableViewCell.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/10/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    var nameLabel : UILabel!
    var pokeImage : UIImageView!
    var numLabel : UILabel!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    func initCellFrom(size: CGSize) {
        pokeImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        pokeImage.center = CGPoint(x: 40, y: size.height/2)
        pokeImage.contentMode = .scaleAspectFit
        contentView.addSubview(pokeImage)
        
        nameLabel = UILabel(frame: CGRect(x: pokeImage.frame.maxX + 20, y: 0, width: 2*size.width/3, height: size.height))
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.2
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont(name: "Menlo-Regular", size: 14.0)
        contentView.addSubview(nameLabel)
        
        numLabel = UILabel(frame: CGRect(x: size.width - 60, y: 0, width: 60, height: size.height))
        numLabel.textAlignment = .left
        numLabel.font = UIFont(name: "Menlo-Regular", size: 16.0)
        contentView.addSubview(numLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
