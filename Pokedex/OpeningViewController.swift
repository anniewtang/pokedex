//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class OpeningViewController: UIViewController {
    
    var searchLabel: UILabel!
    var categoryButton: UIButton!
    var nameButton: UIButton!
    var randomButton: UIButton!    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addSearchLabel()
        addCategoryButton()
        addNameButton()
        addRandomButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addSearchLabel() {
        searchLabel = UILabel()
        searchLabel.frame = CGRect(
            x: self.view.center.x - 60,
            y: self.view.frame.height * 0.35,
            width: 120,
            height: 50
        )
        searchLabel.text = "search by: "
        searchLabel.textAlignment = .center
        self.view.addSubview(searchLabel)
    }
    
    func addCategoryButton() {
        categoryButton = UIButton()
        categoryButton.frame = CGRect(
            x: self.view.center.x - 80,
            y: searchLabel.frame.maxY + 10,
            width: 160,
            height: 40
        )
        categoryButton.setTitle("category", for: .normal)
        categoryButton.setTitleColor(UIColor.white, for: .normal)
        categoryButton.layer.cornerRadius = 16
        categoryButton.backgroundColor = UIColor.blue
        categoryButton.contentHorizontalAlignment = .center
        self.view.addSubview(categoryButton)
    }
    
    func addNameButton() {
        nameButton = UIButton()
        nameButton.frame = CGRect(
            x: self.view.center.x - 80,
            y: categoryButton.frame.maxY + 10,
            width: 160,
            height: 40
        )
        nameButton.setTitle("name/number", for: .normal)
        nameButton.setTitleColor(UIColor.white, for: .normal)
        nameButton.layer.cornerRadius = 16
        nameButton.backgroundColor = UIColor.blue
        nameButton.contentHorizontalAlignment = .center
        self.view.addSubview(nameButton)
    }
    
    func addRandomButton() {
        randomButton = UIButton()
        randomButton.frame = CGRect(
            x: self.view.center.x - 80,
            y: nameButton.frame.maxY + 10,
            width: 160,
            height: 40
        )
        randomButton.setTitle("random", for: .normal)
        randomButton.setTitleColor(UIColor.white, for: .normal)
        randomButton.layer.cornerRadius = 16
        randomButton.backgroundColor = UIColor.blue
        randomButton.contentHorizontalAlignment = .center
        self.view.addSubview(randomButton)
    }

}

