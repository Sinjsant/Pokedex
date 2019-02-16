//
//  ProfileViewController-SetupViews.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/15/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

extension ProfileViewController {
    func setupViews() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 300, width: view.frame.width, height: view.frame.height), cornerRadius: 50).cgPath
        layer.fillColor = UIColor.white.cgColor
        view.layer.addSublayer(layer)
        
        view.backgroundColor = UIColor(red: 122/255, green: 184/255, blue: 223/255, alpha: 1.0)
        profileImage = UIImageView(frame: CGRect(x: view.frame.width/2 - 100, y: 150, width: 200, height: 200))
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        if let url = URL(string: imgURL) {
            do {
                let data = try Data(contentsOf: url)
                profileImage.image = UIImage(data: data)
            } catch let err {
                print("Error : \(err.localizedDescription)")
                profileImage.image = UIImage(named: "Pokeball")
            }
        }
        view.addSubview(profileImage)
        
        nameLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 175, y: profileImage.frame.maxY + 20, width: 350, height: 50))
        nameLabel.font = .boldSystemFont(ofSize: 36)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.text = name
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.2
        view.addSubview(nameLabel)
        
        numLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 50, y: nameLabel.frame.maxY+5, width: 100, height: 40))
        numLabel.text = "#\(num)"
        numLabel.textColor = .black
        numLabel.textAlignment = .center
        numLabel.font = .boldSystemFont(ofSize: 30)
        view.addSubview(numLabel)
        
        atkLabel = UILabel(frame: CGRect(x: 40, y: 575, width: 150, height: 30))
        atkLabel.text = "Attack: \(atk)"
        atkLabel.textColor = .black
        atkLabel.font = .systemFont(ofSize: 26)
        view.addSubview(atkLabel)
        
        defLabel = UILabel(frame: CGRect(x: 40, y: atkLabel.frame.maxY + 10, width: 150, height: 30))
        defLabel.text = "Defense: \(def)"
        defLabel.textColor = .black
        defLabel.font = .systemFont(ofSize: 26)
        view.addSubview(defLabel)
        
        hpLabel = UILabel(frame: CGRect(x: 40, y: defLabel.frame.maxY + 10, width: 150, height: 30))
        hpLabel.text = "HP: \(hp)"
        hpLabel.textColor = .black
        hpLabel.font = .systemFont(ofSize: 26)
        view.addSubview(hpLabel)
        
        favoritesButton = UIButton(frame: CGRect(x: view.frame.width/2 - 110, y: view.frame.maxY - 120, width: 100, height: 60))
        favoritesButton.setTitle("Favorite", for: .normal)
        favoritesButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        favoritesButton.layer.cornerRadius = 10
        favoritesButton.layer.backgroundColor = Constants.mdbColor.cgColor
        favoritesButton.addTarget(self, action: #selector(favorite), for: .touchUpInside)
        view.addSubview(favoritesButton)
        
        
        webButton = UIButton(frame: CGRect(x: view.frame.width/2 + 10, y: view.frame.maxY - 120, width: 100, height: 60))
        webButton.setTitle("Online", for: .normal)
        webButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        webButton.layer.cornerRadius = 10
        webButton.layer.backgroundColor = Constants.resetColor.cgColor
        webButton.addTarget(self, action: #selector(web), for: .touchUpInside)
        view.addSubview(webButton)
    
    }
}
