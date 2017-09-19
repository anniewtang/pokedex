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
        
        pokemonImage = UIImageView(frame: CGRect(x: contentView.frame.width*0.15, y: contentView.frame.height*0.15, width: contentView.frame.width*0.7, height: contentView.frame.height*0.7))
//        pokemonImage = getPokemonImage()
        pokemonImage.contentMode = .scaleAspectFill
        contentView.addSubview(pokemonImage)
    }
    
    func getPokemonImage() -> String {
        let pokemonImageURL = URL(string: pokemonObject.imageUrl)
        
        // Creating a session object with the default configuration.
        // You can read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
        let session = URLSession(configuration: .default)
        
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: pokemonImageURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading pokemon picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded pokemon picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        let image = UIImage(data: imageData)
                        // Do something with your image.
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
    }
    
}
