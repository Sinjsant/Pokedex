//
//  SearchViewController-UI.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/10/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func initUI() {
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = self.view.bounds
        gradientBackground.colors = [UIColor.cyan.cgColor, UIColor.green.cgColor]
        gradientBackground.locations = [0.0, 1.0]
        gradientBackground.opacity = 0.6
        view.layer.insertSublayer(gradientBackground, at: 0)
        
        let searchLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        searchLabel.center = CGPoint(x: view.frame.width/2, y: 100)
        searchLabel.text = "Pokédex Search"
        searchLabel.textColor = UIColor.black
        searchLabel.font = .boldSystemFont(ofSize: 28)
        searchLabel.textAlignment = .center
//        view.addSubview(searchLabel)
    }
}
