//
//  SearchViewModel.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchResults: [SearchMovie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func searchMovies(query: String) {
        guard !query.isEmpty else { return }
        isLoading = true
        errorMessage = nil

        OMDBService.shared.searchMovies(query: query) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let movies):
                    self?.searchResults = movies
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

