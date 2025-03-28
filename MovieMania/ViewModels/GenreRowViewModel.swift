//
//  GenreRowViewModel.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

import Foundation

class GenreRowViewModel: ObservableObject {
    @Published var movies: [SearchMovie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchMovies(for query: String) {
        isLoading = true
        errorMessage = nil

        OMDBService.shared.searchMovies(query: query) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let movies):
                    self?.movies = movies
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
