# Rick and Morty App

A small SwiftUI app that lists characters from *Rick and Morty*. Tap a character to see their details.

## What the app does

- **List screen:** shows each character's picture, name, status and species.
- **Detail screen:** shows a large picture plus status, species, gender, origin, location and number of episodes.
- **Loading state:** shows a spinner while the data is loading. Each picture also shows its own spinner until it loads.
- **Errors:** if you're offline or the API fails, a friendly message and a **Try Again** button appear. Pull down on the list to refresh.

## API

[The Rick and Morty API](https://rickandmortyapi.com/)

Endpoint used (GET): **https://rickandmortyapi.com/api/character**

## Architecture (MVVM)

| Layer | File | Responsibility |
|---|---|---|
| Model | `Models/Character.swift`, `Models/CharacterResponse.swift` | Decodable structs that match the JSON |
| ViewModel | `ViewModels/CharactersViewModel.swift` | Makes the GET request, handles errors, exposes `state` (`loading` / `loaded` / `failed`) |
| View | `Views/ContentView.swift` | List + `NavigationStack`, switches on `state` |
| View | `Views/CharacterRowView.swift` | One row in the list |
| View | `Views/CharacterDetailView.swift` | Detail screen |
| View | `Views/CharacterImageView.swift` | Remote image with loading and failure states |
| View | `Views/ErrorView.swift` | Error message + retry button |

## How to run

1. Requirements: **Xcode 27** or newer, **iOS 27** deployment target.
2. Clone the repo and open `RickAndMortyApp.xcodeproj`.
3. Select an iPhone simulator and press **Run** (⌘R).
4. To test the error handling, turn off your Mac's Wi-Fi and press **Try Again**.
