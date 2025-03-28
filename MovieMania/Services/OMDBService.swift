//
//  OMDBService.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

import Foundation

class OMDBService {
    static let shared = OMDBService()
    private let apiKey = "8a4f4f50"

    private init() {}
    
    // MARK: - Fetch Movies (Random / Home Screen)
    func fetchMovies(from url: URL, completion: @escaping (Result<MovieSearchResponse, Error>) -> Void) {
        NetworkManager.shared.fetchData(from: url, responseModel: MovieSearchResponse.self, completion: completion)
    }

    // MARK: - Fetch Movie Details
    func fetchMovieDetail(imdbID: String, completion: @escaping (Result<Movie, Error>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=\(apiKey)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        NetworkManager.shared.fetchData(from: url, responseModel: Movie.self) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }

    // MARK: - Search Movies
    func searchMovies(query: String, completion: @escaping (Result<[SearchMovie], Error>) -> Void) {
        let queryEscaped = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        guard let url = URL(string: "\(Constants.baseURL)?apikey=\(Constants.apiKey)&s=\(queryEscaped)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        NetworkManager.shared.fetchData(from: url, responseModel: MovieSearchResponse.self) { result in
            switch result {
            case .success(let response):
                if let movies = response.search {
                    completion(.success(movies))
                } else {
                    completion(.failure(NetworkError.noData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


