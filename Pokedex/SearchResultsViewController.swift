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
    
    /* order of images in pokemonImages should be same as in pokemonArr */
    var pokemonArr = PokemonGenerator.getPokemonArray()
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
        collectionView.backgroundColor = .green
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
        /* taken from stack overflow question: 24231680 */
        //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        var image: UIImage!
        
        let url = URL(string: p.imageUrl)
        
        if let data = try? Data(contentsOf: url!) {
            image = UIImage(data: data)
        } else {
            image = #imageLiteral(resourceName: "question")
        }
        return image
        
//        var image: UIImage!
//        
//        let imgURL = NSURL(string: p.imageUrl)
//        let request: NSURLRequest = NSURLRequest(url: imgURL! as URL)
//        let mainQueue = OperationQueue.main
//        
//        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
//            if error == nil {
//                // Convert the downloaded data in to a UIImage object
//                image = UIImage(data: data!)
//            } else {
//                image = #imageLiteral(resourceName: "question") // if occurred an error put a placeholder image
//            }
//        })
//        return image!;
    }
}


extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    /* specifying number of sections */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /* specifying the total number of cells in a given section */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonArr.count
    }
    
    // dequeue and set it up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonCollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    
    // populate data of a cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let pokemonCell = cell as! PokemonCollectionViewCell
        pokemonCell.pokemonImageView.image = pokemonImages[indexPath.row]
    }
    
    // size of each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200);
    }
    
    // if item is selected what do you do
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row);
    }
    
}
