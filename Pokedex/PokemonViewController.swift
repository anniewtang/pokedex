//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Annie Tang on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
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
    
    var pokemonImage: UIImageView!
    var nameLabel: UILabel!
    var numberLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupImage()
        setupNameAndNumber()
        setUpStatistics()
    }
    
    func setupImage() {
        
    }
    
    func setupNameAndNumber() {
        
    }
    
    func setUpStatistics() {
        
    }
}
