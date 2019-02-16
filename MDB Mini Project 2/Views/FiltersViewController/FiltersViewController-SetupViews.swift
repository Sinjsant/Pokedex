//
//  FiltersViewController-SetupViews.swift
//  MDB Mini Project 2
//
//  Created by Sinjon Santos on 2/15/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import UIKit

extension FiltersViewController {
    
    func setupViews() {
        doneButton = UIButton(frame: CGRect(x: view.frame.width - 80, y: 50, width: 60, height: 50))
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        doneButton.setTitleColor(UIColor(red: 41/255, green: 124/255, blue: 246/255, alpha: 1.0), for: .normal)
        doneButton.addTarget(self, action: #selector(exit), for: .touchUpInside)
        view.addSubview(doneButton)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: 110)
        titleLabel.font = .boldSystemFont(ofSize: 35)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.text = "Filter Your Search"
        view.addSubview(titleLabel)
        
        randomButton = UIButton(frame: CGRect(x: view.frame.width/2 - 70, y: titleLabel.frame.maxY + 10, width: 140, height: 40))
        randomButton.setTitle("Random 20", for: .normal)
        randomButton.titleLabel?.font = .boldSystemFont(ofSize: 22)
        randomButton.layer.cornerRadius = 10
        randomButton.layer.backgroundColor = Constants.randomColor.cgColor
        randomButton.addTarget(self, action: #selector(random), for: .touchUpInside)
        view.addSubview(randomButton)
        
        atkLabel = UILabel(frame: CGRect(x: 50, y: titleLabel.frame.maxY + 70, width: 220, height: 40))
        atkLabel.textAlignment = .left
        atkLabel.text = "Min. Attack Points:"
        atkLabel.font = .systemFont(ofSize: 24)
        atkLabel.textColor = .black
        view.addSubview(atkLabel)
        
        defLabel = UILabel(frame: CGRect(x: 50, y: atkLabel.frame.maxY + 70, width: 220, height: 40))
        defLabel.textAlignment = .left
        defLabel.text = "Min. Defense Points:"
        defLabel.font = .systemFont(ofSize: 24)
        defLabel.textColor = .black
        view.addSubview(defLabel)
        
        hpLabel = UILabel(frame: CGRect(x: 50, y: defLabel.frame.maxY + 70, width: 220, height: 40))
        hpLabel.textAlignment = .left
        hpLabel.text = "Min. Health Points:"
        hpLabel.font = .systemFont(ofSize: 24)
        hpLabel.textColor = .black
        view.addSubview(hpLabel)
        
        atkSlider = UISlider()
        atkSlider.frame = CGRect(x: 50, y: atkLabel.frame.maxY + 10, width: 300, height: 50)
        atkSlider.minimumTrackTintColor = .green
        atkSlider.maximumTrackTintColor = .cyan
        atkSlider.thumbTintColor = .lightGray
        atkSlider.maximumValue = 250
        atkSlider.minimumValue = 0
        atkSlider.setValue(50, animated: false)
        atkSlider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        view.addSubview(atkSlider)
        
        defSlider = UISlider()
        defSlider.frame = CGRect(x: 50, y: defLabel.frame.maxY + 10, width: 300, height: 50)
        defSlider.minimumTrackTintColor = .green
        defSlider.maximumTrackTintColor = .cyan
        defSlider.thumbTintColor = .lightGray
        defSlider.maximumValue = 250
        defSlider.minimumValue = 0
        defSlider.setValue(50, animated: false)
        defSlider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        view.addSubview(defSlider)
        
        hpSlider = UISlider()
        hpSlider.frame = CGRect(x: 50, y: hpLabel.frame.maxY + 10, width: 300, height: 50)
        hpSlider.minimumTrackTintColor = .green
        hpSlider.maximumTrackTintColor = .cyan
        hpSlider.thumbTintColor = .lightGray
        hpSlider.maximumValue = 250
        hpSlider.minimumValue = 0
        hpSlider.setValue(50, animated: false)
        hpSlider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        view.addSubview(hpSlider)
        
        
        typeLabel = UILabel(frame: CGRect(x: 30, y: hpSlider.frame.maxY + 10, width: 220, height: 40))
        typeLabel.textAlignment = .left
        typeLabel.text = "Type:"
        typeLabel.font = .systemFont(ofSize: 24)
        typeLabel.textColor = .black
        view.addSubview(typeLabel)
        
        
        applyFilters = UIButton(frame: CGRect(x: view.frame.width/2 - 110, y: view.frame.maxY - 120, width: 100, height: 60))
        applyFilters.setTitle("Apply", for: .normal)
        applyFilters.titleLabel?.font = .boldSystemFont(ofSize: 30)
        applyFilters.layer.cornerRadius = 10
        applyFilters.layer.backgroundColor = Constants.mdbColor.cgColor
        applyFilters.addTarget(self, action: #selector(apply), for: .touchUpInside)
        view.addSubview(applyFilters)
        
        
        resetFilters = UIButton(frame: CGRect(x: view.frame.width/2 + 10, y: view.frame.maxY - 120, width: 100, height: 60))
        resetFilters.setTitle("Reset", for: .normal)
        resetFilters.titleLabel?.font = .boldSystemFont(ofSize: 30)
        resetFilters.layer.cornerRadius = 10
        resetFilters.layer.backgroundColor = Constants.resetColor.cgColor
        resetFilters.addTarget(self, action: #selector(reset), for: .touchUpInside)
        view.addSubview(resetFilters)
        
        
        
        var yOffset = 0
        var xOffset = 0
        for type in Constants.typesArray {
            if xOffset == 360 {
                xOffset = 0
                yOffset += 50
            }
            let typeButton = UIButton(frame: CGRect(x: 30 + xOffset, y: 600 + yOffset, width: 55, height: 40))
            
            xOffset += 60
            typeButton.layer.cornerRadius = 10
            typeButton.setBackgroundImage(UIImage(named: "\(type)"), for: .normal)
            typeButton.alpha = 0.3
            typeButton.titleLabel?.text = "\(type)"
            typeButton.addTarget(self, action: #selector(typePressed), for: .touchUpInside)
            view.addSubview(typeButton)
            
        }
    }
    
}
