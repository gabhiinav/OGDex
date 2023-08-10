//
//  PokemonModel.swift
//  OGDex
//
//  Created by Abhinav Gupta on 10/08/23.
//

import Foundation

struct PokemonPage: Decodable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "mew", url: "https://pokeapi.co/api/v2/pokemon/151/")
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
