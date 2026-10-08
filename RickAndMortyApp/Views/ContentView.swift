//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Luis on 02/10/26.
//
//JEJEJEJE

import SwiftUI


struct ContentView: View {
    @State private var viewModel = CharactersViewModel()

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Rick and Morty")
                .navigationDestination(for: Character.self) { character in
                    CharacterDetailView(character: character)
                }
        }
        .task { await viewModel.loadCharacters() }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView("Loading characters…")
        case .failed(let message):
            ErrorView(message: message) {
                Task { await viewModel.loadCharacters() }
            }
        case .loaded(let characters):
            List(characters) { character in
                NavigationLink(value: character) {
                    CharacterRowView(character: character)
                }
            }
            .refreshable { await viewModel.loadCharacters() }
        }
    }
}

#Preview {
    ContentView()
}
