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

    // MARK: - Add to Watchlist
    func addToWatchlist(movie: SearchMovie) {
        if !watchlist.contains(where: { $0.imdbID == movie.imdbID }) {
            watchlist.append(movie)
            saveWatchlist()
        }
    }

    // MARK: - Remove from Watchlist
    func removeFromWatchlist(at offsets: IndexSet) {
        watchlist.remove(atOffsets: offsets)
        saveWatchlist()
    }

    // MARK: - Save to UserDefaults
    private func saveWatchlist() {
        if let data = try? JSONEncoder().encode(watchlist) {
            UserDefaults.standard.set(data, forKey: watchlistKey)
        }
    }

    // MARK: - Load from UserDefaults
    private func loadWatchlist() {
        if let data = UserDefaults.standard.data(forKey: watchlistKey),
           let savedMovies = try? JSONDecoder().decode([SearchMovie].self, from: data) {
            watchlist = savedMovies
        }
    }
}
