//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Luis on 07/10/26.
//


import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CharacterImageView(url: character.image)
                    .frame(width: 220, height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .accessibilityLabel("Picture of \(character.name)")

                Text(character.name)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                VStack(spacing: 12) {
                    InfoRow(title: "Status", value: character.status)
                    InfoRow(title: "Species", value: character.species)
                    InfoRow(title: "Gender", value: character.gender)
                    InfoRow(title: "Origin", value: character.origin.name)
                    InfoRow(title: "Location", value: character.location.name)
                    InfoRow(title: "Episodes", value: "\(character.episode.count)")
                }
                .padding()
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16))
            }
            .padding()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct InfoRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
                .multilineTextAlignment(.trailing)
        }
    }
}
