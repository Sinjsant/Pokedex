//
//  FiltersViewController.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/15/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {
    
    var doneButton : UIButton!
    var titleLabel : UILabel!
    var randomButton : UIButton!
    var categoryLabel : UILabel!
    var atkLabel : UILabel!
    var defLabel : UILabel!
    var hpLabel : UILabel!
    var atkSlider : UISlider!
    var defSlider : UISlider!
    var hpSlider : UISlider!
    var typeLabel : UILabel!
    var selectedArray = [String]()
    
    var applyFilters : UIButton!
    var resetFilters : UIButton!
    var svc : MainViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        

        // Do any additional setup after loading the view.
    }
    
    @objc func apply() {
        print("test")
        svc.filterFromFilters(minAtk: Int(atkSlider!.value), minDef: Int(defSlider!.value), minHP: Int(hpSlider!.value), typesArray: selectedArray)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func exit() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func random() {
        svc.randomMode = true
        svc.pokeTableView.reloadData()
        svc.pokeCollectionView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func changeValue(_ sender: UISlider) {
    }
    
    @objc func typePressed(_ sender: UIButton) {
        print("type selected: \(sender.titleLabel!.text!)")
        if sender.alpha < 1.0 {
            sender.alpha = 1.0
            selectedArray.append(sender.titleLabel!.text!)
        } else {
            sender.alpha = 0.3
            selectedArray = selectedArray.filter{$0 != sender.titleLabel!.text!}
        }

    }
    
    @objc func reset(_ sender: UIButton) {
        svc.appliedFilters = false
        svc.randomMode = false
        svc.favoritesMode = false
        svc.pokeTableView.reloadData()
        svc.pokeCollectionView.reloadData()
        UserDefaults.standard.set([Int](), forKey: "pokemon")
        self.dismiss(animated: true, completion: nil)
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
