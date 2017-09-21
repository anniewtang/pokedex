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
    var tableView: UITableView!
    var segmentedControl: UISegmentedControl!
    
    /* order of images in pokemonImages should be same as in pokemonArr */
    var pokemonArr = PokemonGenerator.getPokemonArray()
    var results: [Pokemon]!
    var pokemonImages: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(results)
        pokemonArr = results
        setUpPokemonImages()
        setupSegmentedControl()
        setupCollectionView()
        setupTableView()
    }
    
    func setupSegmentedControl() {
        //Initialize SegmentedControl
        segmentedControl = UISegmentedControl(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.05 + 10, width: view.frame.width, height: view.frame.height * 0.05))
        segmentedControl.insertSegment(withTitle: "TableView", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "CollectionView", at: 1, animated: true)
        segmentedControl.layer.cornerRadius = 3
        segmentedControl.addTarget(self, action: #selector(switchView), for: .valueChanged)
        view.addSubview(segmentedControl)
    }

    /* Initializaing collection view, and adding it to the view controller */
    func setupCollectionView() {
        segmentedControl.selectedSegmentIndex = 1
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.1 + 10, width: view.frame.width, height: view.frame.height * 0.9 - UIApplication.shared.statusBarFrame.maxY - 10), collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "pokemonCollectionViewCell")
        collectionView.backgroundColor = .green
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func setupTableView() {
        segmentedControl.selectedSegmentIndex = 0
        
        tableView = UITableView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.1 + 10, width: view.frame.width, height: view.frame.height - UIApplication.shared.statusBarFrame.maxY))
        //Register the tableViewCell you are using
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "pokemonTableViewCell")
        
        //Set properties of TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50/2, right: 0)
        //Add tableView to view
        view.addSubview(tableView)

    }
    
    func switchView(sender: UISegmentedControl) {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        view.addSubview(segmentedControl)
        if (sender.selectedSegmentIndex == 0) {
            setupTableView()
        } else {
            setupCollectionView()
        }
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
        
        /* if url is not nil, try to get the contents of it and use it */
        if url != nil {
//            print("not nil URL: ", url)
            let data = try? Data(contentsOf: url!)
            if data != nil {
//                print("not nil data: ", data)
                image = UIImage(data: data!)
            }
        }
        else {
            print("default")
            image = #imageLiteral(resourceName: "question")
        }
        
        if image == nil {
            image = #imageLiteral(resourceName: "question")
        }
        
        print("image: ", image)
        return image
    }
    
    /* from stack overflow: 35049322 */
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url  = NSURL(string: urlString) {
                print("true")
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }

}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonTableViewCell") as! PokemonTableViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.pokemonObject = pokemonArr[indexPath.row]
        cell.awakeFromNib()
        cell.pokemonImageView.image = pokemonImages[indexPath.row]
        // cell.nameLabel.text = pokemonArr[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // fruitToPass = fruits[indexPath.row]
        // performSegue(withIdentifier: "segueToFruitVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout     {
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCollectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.pokemonObject = pokemonArr[indexPath.row]
        cell.awakeFromNib()
        cell.pokemonImageView.image = pokemonImages[indexPath.row]
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
