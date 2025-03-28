//
//  WatchlistManager.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//


import Foundation

class WatchlistManager: ObservableObject {
    static let shared = WatchlistManager()

    @Published private(set) var watchlist: [SearchMovie] = []

    private let key = "watchlist_movies"

    private init() {
        loadWatchlist()
    }

    // Add movie
    func addToWatchlist(_ movie: SearchMovie) {
        if !watchlist.contains(where: { $0.imdbID == movie.imdbID }) {
            watchlist.append(movie)
            saveWatchlist()
        }
    }

    // Remove movie
    func removeFromWatchlist(_ movie: SearchMovie) {
        watchlist.removeAll { $0.imdbID == movie.imdbID }
        saveWatchlist()
    }

    // MARK: - Save & Load
    private func saveWatchlist() {
        if let data = try? JSONEncoder().encode(watchlist) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func loadWatchlist() {
        if let data = UserDefaults.standard.data(forKey: key),
           let movies = try? JSONDecoder().decode([SearchMovie].self, from: data) {
            watchlist = movies
        }
    }
}
