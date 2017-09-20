//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Annie Tang on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    var pokemonObject: Pokemon!
    var pokemonObject: Pokemon!
    var pokemonImage: UIImageView!
    var pokemonImageView: UIImageView!
    
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
 
    override func awakeFromNib() {
        
        pokemonImageView = UIImageView(frame: CGRect(x: contentView.frame.width*0.15, y: contentView.frame.height*0.15, width: contentView.frame.width*0.7, height: contentView.frame.height*0.7))
        pokemonImageView.contentMode = .scaleAspectFill
        contentView.addSubview(pokemonImageView)
    }    
}
