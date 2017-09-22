//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Annie Tang on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonProfileViewController: UIViewController {
    
    let grayBlue = UIColor(red:0.58, green:0.67, blue:0.75, alpha:1.0)
    let lightGrayBlue = UIColor(red:0.83, green:0.86, blue:0.88, alpha:1.0)
    let darkGray = UIColor(red:0.17, green:0.25, blue:0.30, alpha:1.0)
    
    /* POKEMON PROPERTIES
     let name: String!
     let number: Int!
     let attack: Int!
     let defense: Int!
     let health: Int!
     let specialAttack: Int!
     let specialDefense: Int!
     let species: String!
     let speed: Int!
     let total: Int!
     let types: [String]
     let imageUrl: String! */
    
    var p: Pokemon!
    
    var pokemonImage: UIImage!
    var pokemonImageView: UIImageView!
    var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupImage()
        setupNameAndNumber()
        setUpStatisticsLabels()
        addSearchButton()
    }
    
    func setupImage() {
        pokemonImageView = UIImageView(frame:
            CGRect(x: view.frame.width * 0.1,
                   y: view.frame.width * 0.25,
                   width: view.frame.width * 0.8,
                   height: view.frame.width * 0.5))
        pokemonImageView.image = pokemonImage
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.clipsToBounds = true
        view.addSubview(pokemonImageView)
    }
    
    func setupNameAndNumber() {
        let nameLabel = UILabel(frame:
            CGRect(x: view.frame.width * 0.1,
                   y: view.frame.width * 0.67,
                   width: view.frame.width * 0.8,
                   height: view.frame.height * 0.2))
        nameLabel.text = p.name
        nameLabel.textColor = UIColor.darkGray
        nameLabel.textAlignment = .left
        nameLabel.font = nameLabel.font.withSize(20)
        view.addSubview(nameLabel)
        
        let numberLabel = UILabel(frame:
            CGRect(x: view.frame.width * 0.1,
                   y: view.frame.width * 0.67,
                   width: view.frame.width * 0.8,
                   height: view.frame.height * 0.2))
        numberLabel.text = " # " + String(p.number)
        numberLabel.textColor = .lightGray
        numberLabel.textAlignment = .right
        numberLabel.font = numberLabel.font.withSize(14)
        view.addSubview(numberLabel)
    }
    
    func setUpStatisticsLabels() {
        var labels: [UILabel] = []
        let labelsNames: [String] = ["Attack", "Defense", "Health", "Special Attack", "Special Defense", "Species", "Speed", "Total", "Type"]
        
        let info: [String] = [String(p.attack), String(p.defense), String(p.health), String(p.specialAttack), String(p.specialDefense), p.species, String(p.speed), String(p.total)]
        
        var OFFSET_Y: CGFloat = 0.43
        for i in 0...(labelsNames.count - 1) {
            let label = UILabel(frame:
                CGRect(x: view.frame.width * 0.1,
                       y: view.frame.height * OFFSET_Y,
                       width: view.frame.width * 0.8,
                       height: view.frame.height * 0.2))
            labels.append(label)
            
            let info = grabInfo(index: i, infoArr: info, types: p.types)
            
            label.text = labelsNames[i] + ": " + info
            label.textColor = .darkGray
            label.textAlignment = .left
            label.font = label.font.withSize(15)
            view.addSubview(label)
            OFFSET_Y += 0.035
        }
    }
    
    func addSearchButton() {
        let searchButton = UIButton(frame:
            CGRect(x: view.frame.width * 0.1,
                   y: view.frame.height * 0.85,
                   width: view.frame.width * 0.8,
                   height: view.frame.height * 0.1))
        searchButton.layer.cornerRadius = 3
        searchButton.backgroundColor = lightGrayBlue
        searchButton.setTitle("Search on the Web", for: .normal)
        searchButton.setTitleColor(darkGray, for: .normal)
        searchButton.setTitleShadowColor(grayBlue, for: .normal)
        searchButton.addTarget(self, action: #selector(searchGoogle), for: .touchUpInside)
        
        view.addSubview(searchButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWebView" {
            let webView = segue.destination as! GoogleSearchWebViewController
            webView.pokeName = p.name
        }
    }
    
    func searchGoogle() {
        performSegue(withIdentifier: "segueToWebView", sender: self)
    }
    
    /* helper function to create a string with all of the pokemon's types */
    func grabInfo(index: Int!, infoArr: [String], types: [String]) -> String {
        var info: String = ""
        let delimiter: String = ", "
        if index == infoArr.count {
            for i in 0...(types.count - 1) {
                if i == (types.count - 1) {
                    info += types[i]
                } else {
                    info = info + types[i] + delimiter
                }
            }
        } else {
            info = infoArr[index]
        }
        return info
    }
}
