//
//  DataManager.swift
//  OGDex
//
//  Created by Abhinav Gupta on 11/08/23.
//

import Foundation

class PokemonManager: ObservableObject {
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion:@escaping(PokemonDetail) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/",
                              model: PokemonDetail.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getPokemonStats(id: Int, _ completion:@escaping(SpecificStat) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/",
                              model: SpecificStat.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getPokemonTypes(id: Int, _ completion:@escaping(SpecificType) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/",
                              model: SpecificType.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}

