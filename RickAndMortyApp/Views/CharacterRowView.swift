//
//  CharacterRowView.swift
//  RickAndMortyApp
//
//  Created by Luis on 07/10/26.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Character

    var body: some View {
        HStack(spacing: 16) {
            CharacterImageView(url: character.image)
                .frame(width: 64, height: 64)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.headline)
                Text("\(character.status) · \(character.species)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
