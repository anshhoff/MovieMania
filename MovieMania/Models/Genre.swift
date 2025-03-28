//
//  Genre.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

import Foundation

struct Genre: Identifiable {
    let id = UUID()
    let title: String
    let query: String
}

let genres: [Genre] = [
    Genre(title: "Action", query: "action"),
    Genre(title: "Comedy", query: "comedy"),
    Genre(title: "Drama", query: "drama"),
    Genre(title: "Sci-Fi", query: "sci-fi"),
    Genre(title: "Horror", query: "horror"),
    Genre(title: "Romance", query: "romance"),
    Genre(title: "Thriller", query: "thriller"),
    Genre(title: "Animation", query: "animation"),
    Genre(title: "Adventure", query: "adventure"),
    Genre(title: "Fantasy", query: "fantasy")
]
