//
//  IRPokeSearchViewController.swift
//  PokeDexC
//
//  Created by Ivan Ramirez on 9/18/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class IRPokeSearchViewController: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var pokemon: IRPokemon?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       searchBar.delegate = self 

    }
    
    func updateViews() {
        guard let pokemon = self.pokemon else {return}
        
        nameLabel.text = pokemon.name
        idLabel.text = "ID: \(pokemon.identifer)"
        abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
    }
}

extension IRPokeSearchViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {return}
        IRPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
            DispatchQueue.main.async {
                //keyboard goes back down
                searchBar.resignFirstResponder()
                self.updateViews()
            }
        }
    }
}
