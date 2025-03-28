//
//  Movie.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

// For detailed movie information
struct Movie: Codable, Identifiable {
    var id: String { imdbID }
    let title: String
    let year: String
    let rated: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let director: String?
    let writer: String?
    let actors: String?
    let plot: String?
    let language: String?
    let poster: String?
    let imdbRating: String?
    let imdbID: String
    let type: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case poster = "Poster"
        case imdbRating
        case imdbID
        case type = "Type"
    }
}

// For search results
struct MovieSearchResponse: Codable {
    let search: [SearchMovie]?
    let totalResults: String?
    let response: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

struct SearchMovie: Codable, Identifiable {
    var id: String { imdbID }
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

