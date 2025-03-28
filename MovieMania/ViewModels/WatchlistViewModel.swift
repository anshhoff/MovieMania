//
//  WatchlistViewModel.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//


import Foundation

class WatchlistViewModel: ObservableObject {
    @Published var watchlist: [SearchMovie] = []

    private let watchlistKey = "watchlist"

    init() {
        loadWatchlist()
    }

    // Add to Watchlist
    func addToWatchlist(movie: SearchMovie) {
        if !watchlist.contains(where: { $0.imdbID == movie.imdbID }) {
            watchlist.append(movie)
            saveWatchlist()
        }
    }

    // Remove from Watchlist
    func removeFromWatchlist(movie: SearchMovie) {
        watchlist.removeAll { $0.imdbID == movie.imdbID }
        saveWatchlist()
    }

    // Save to UserDefaults
    private func saveWatchlist() {
        if let encoded = try? JSONEncoder().encode(watchlist) {
            UserDefaults.standard.set(encoded, forKey: watchlistKey)
        }
    }

    // Load from UserDefaults
    private func loadWatchlist() {
        if let data = UserDefaults.standard.data(forKey: watchlistKey),
           let decoded = try? JSONDecoder().decode([SearchMovie].self, from: data) {
            watchlist = decoded
        }
    }
}
