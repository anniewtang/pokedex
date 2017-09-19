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

        // Do any additional setup after loading the view.
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
        
        
        let imageUrlString = p.imageUrl
        let imageUrl:URL = URL(string: imageUrlString!)!
        
        // Start background thread so that image loading does not make app unresponsive
        DispatchQueue.global(qos: .userInitiated).async {
            
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            let imageView = UIImageView(frame: CGRect(x:0, y:0, width:200, height:200))
            imageView.center = self.view.center
            
            // When from background thread, UI needs to be updated on main_queue
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                imageView.image = image
                imageView.contentMode = UIViewContentMode.scaleAspectFit
                self.view.addSubview(imageView)
            }
        }
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
