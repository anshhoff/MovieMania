//
//  HomeViewModel.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

//
//import Foundation
//import SwiftUI
//
//class HomeViewModel: ObservableObject {
//    @Published var movies: [SearchMovie] = []
//    @Published var isLoading: Bool = false
//    @Published var errorMessage: String?
//    
//    func fetchRandomMovies() {
//        isLoading = true
//        errorMessage = nil
//
//        let randomKeywords = ["Batman", "Avengers", "Spider", "Harry"]
//        guard let keyword = randomKeywords.randomElement(),
//              let url = URL(string: "\(Constants.baseURL)?s=\(keyword)&apikey=\(Constants.apiKey)") else {
//            self.errorMessage = "Invalid URL"
//            self.isLoading = false
//            return
//        }
//
//        OMDBService.shared.fetchMovies(from: url) { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                case .success(let response):
//                    self.movies = response.search ?? []
//                case .failure(let error):
//                    self.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }
//}
