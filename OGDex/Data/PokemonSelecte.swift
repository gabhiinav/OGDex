//
//  PokemonSelecte.swift
//  OGDex
//
//  Created by Abhinav Gupta on 11/08/23.
//

import Foundation

struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites : Codable {
    var front_default: String?
}

class PokemonSelectedApi  {
    func getSprite(url: String, completion:@escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
}