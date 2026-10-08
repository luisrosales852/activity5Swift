//
//  CharacterImageView.swift
//  RickAndMortyApp
//
//  Created by Luis on 07/10/26.
//

import SwiftUI

struct CharacterImageView: View {
    let url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                image.resizable().scaledToFill()
            case .failure:
                Image(systemName: "person.crop.circle.badge.exclamationmark")
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
            default:
                ProgressView() // Loading state for images
            }
        }
    }
}
