//
//  ProfileViewController.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/15/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var profileImage : UIImageView!
    var nameLabel : UILabel!
    var atkLabel : UILabel!
    var defLabel : UILabel!
    var hpLabel : UILabel!
    var name = ""
    var imgURL = ""
    var num = 0
    var atk = ""
    var def = ""
    var hp = ""
    var spatk = ""
    var spdef = ""
    var numLabel : UILabel!
    var favoritesButton : UIButton!
    var webButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func favorite(_ sender: UIButton) {
        var favoritesArray = UserDefaults.standard.array(forKey: "pokemon") as! [Int]
        if (favoritesButton.titleLabel?.text == "Favorite") {
            favoritesArray.append(num)
            favoritesButton.setTitle("Added", for: .normal)
        } else {
            favoritesArray = favoritesArray.filter{$0 != num}
            favoritesButton.setTitle("Favorite", for: .normal)
        }
        UserDefaults.standard.set(favoritesArray, forKey: "pokemon")
        
    }
    
    @objc func web(_ sender: UIButton) {
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
