//
//  SearchResultsViewController.swift
//  Pokedex
//
//  Created by Annie Tang on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var pokemonArr: [Pokemon]!
    var pokemonImages: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpPokemonImages()
    }

    
    /* Initializaing collection view, and adding it to the view controller */
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "pokemonCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func setUpPokemonImages() {
        pokemonImages = []
        for p in pokemonArr {
            pokemonImages.append(grabImagesFromURL(p: p))
        }
    }
    
    func grabImagesFromURL(p: Pokemon)->UIImage {
        var image: UIImage!
        
        let imgURL = NSURL(string: p.imageUrl)
        let request: NSURLRequest = NSURLRequest(url: imgURL! as URL)
        let mainQueue = OperationQueue.main
        
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
            if error == nil {
                // Convert the downloaded data in to a UIImage object
                image = UIImage(data: data!)
            } else {
                image = #imageLiteral(resourceName: "question") // if occurred an error put a placeholder image
            }
        })
        return image!;
    }
}


extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    /* specifying number of sections */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /* specifying the total number of cells */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonCollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let pokemonCell = cell as! PokemonCollectionViewCell
        pokemonCell.pokemonImageView.image = pokemonImages[indexPath.row]
    }
}
