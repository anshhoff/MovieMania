//
//  MovieGridItemView.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

import SwiftUI

struct MovieGridItemView: View {
    let movie: SearchMovie
    var animation: Namespace.ID

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .matchedGeometryEffect(id: movie.imdbID, in: animation)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 225)
            .clipped()
            
            Text(movie.title)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(1)
                .multilineTextAlignment(.center)
        }
        .background(
            ZStack {
                AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 20)
                        .opacity(0.5)
                        .ignoresSafeArea()
                } placeholder: {
                    Color.black.opacity(0.5)
                }
            }
        )
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

#Preview {
    let sampleMovie = SearchMovie(
        title: "Inception of the world war 3",
        year: "2010",
        imdbID: "tt1375666",
        type: "movie",
        poster: "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmYtYWFhYS00ZDJlLTg3YjAtZDJmZWFjODcwNzMzXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg"
    )
    return MovieGridItemView(movie: sampleMovie, animation: Namespace().wrappedValue)
}
