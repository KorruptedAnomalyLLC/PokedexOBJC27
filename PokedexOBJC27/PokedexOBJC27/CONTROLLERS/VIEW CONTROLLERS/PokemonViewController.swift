//
//  PokemonViewController.swift
//  PokedexOBJC27
//
//  Created by Austin West on 7/2/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonSearchBar.delegate = self
    }
    
    func updateViews() {
        guard let pokemon = pokemon else { return }
        
        pokemonNameLabel.text = pokemon.pokemonName
        pokemonIDLabel.text = "ID: \(pokemon.identifier)"
        pokemonAbilitiesLabel.text = "Abilities: " + (pokemon.abilities.joined(seperator: ", "))
    }
    
}

extension PokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Fetch with the search text
        AJDWPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
            
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
}
