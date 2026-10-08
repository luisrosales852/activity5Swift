//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Luis on 02/10/26.
//

import Foundation

struct Character: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Place
    let location: Place
    let image: String
    let episode: [String]

    struct Place: Decodable, Hashable {
        let name: String
    }
}
