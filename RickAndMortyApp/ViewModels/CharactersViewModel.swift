//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Luis on 02/10/26.
//

import SwiftUI


@MainActor
@Observable
final class CharactersViewModel {
    enum State {
        case loading
        case loaded([Character])
        case failed(String)
    }

    private(set) var state: State = .loading

    private let endpoint = URL(string: "https://rickandmortyapi.com/api/character")!

    func loadCharacters() async {
        state = .loading
        do {
            // 1. GET request
            let (data, response) = try await URLSession.shared.data(from: endpoint)

            // 2. Check the HTTP status code
            if let http = response as? HTTPURLResponse, http.statusCode != 200 {
                state = .failed("Server error (code \(http.statusCode)). Please try again later.")
                return
            }

            // 3. Decode the JSON
            let characters = try JSONDecoder().decode(CharacterResponse.self, from: data).results
            state = .loaded(characters)
        } catch {
            state = .failed(message(for: error))
        }
    }

    private func message(for error: Error) -> String {
        switch error {
        case let urlError as URLError
            where urlError.code == .notConnectedToInternet || urlError.code == .networkConnectionLost:
            return "No connection. Please try again."
        case is DecodingError:
            return "We couldn't read the data from the server."
        default:
            return "Something went wrong. Please try again."
        }
    }
}
