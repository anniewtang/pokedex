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
    var pokemonImage: UIImageView!
    var pokemonImageView: UIImageView!
    
    var pokemonName: UILabel!
 
    override func awakeFromNib() {
        setImage()
        setName()
    }
    
    func setImage() {
        pokemonImageView = UIImageView(frame: CGRect(x: contentView.frame.width*0.15, y: contentView.frame.height*0.15, width: contentView.frame.width*0.7, height: contentView.frame.height*0.7))
        pokemonImageView.contentMode = .scaleAspectFill
        contentView.addSubview(pokemonImageView)
    }
    
    func setName() {
        pokemonName = UILabel(frame: CGRect(x: contentView.frame.width*0.15, y: contentView.frame.height*0.15, width: contentView.frame.width*0.7, height: contentView.frame.height*0.7))
        pokemonName.text = pokemonObject.name;
        contentView.addSubview(pokemonName);
    }
}
