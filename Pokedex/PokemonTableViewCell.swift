//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Annie Tang on 9/20/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    var pokemonObject: Pokemon!
    // how to get pokemon? do that PokemonTableViewCell.pokemonObject = something thing like fruitVC
    var pokemonImage: UIImageView!
    var pokemonImageView: UIImageView!
    
    var pokemonName: UILabel!
    var pokemonNumber: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    func setImage() {
        pokemonImageView = UIImageView(frame: CGRect(x: contentView.frame.width*0.2, y: contentView.frame.width*0.2, width: contentView.frame.width*0.2, height: contentView.frame.height*0.2))
        pokemonImageView.contentMode = .scaleAspectFill
        contentView.addSubview(pokemonImageView)
    }
    
    func setName() {
        pokemonName = UILabel(frame: CGRect(x: contentView.frame.width*0.15, y: contentView.frame.height*0.15, width: contentView.frame.width*0.7, height: contentView.frame.height*0.7))
        pokemonName.text = pokemonObject.name;
        contentView.addSubview(pokemonName);
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
