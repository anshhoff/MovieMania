//
//  NetworkError.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//


import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
