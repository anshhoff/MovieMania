//
//  GenreRowView.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

import SwiftUI

struct GenreRowView: View {
    let genre: Genre
    @StateObject private var viewModel = GenreRowViewModel()
    var animation: Namespace.ID

    var body: some View {
        VStack(alignment: .leading) {
            Text(genre.title)
                .font(.headline)
                .padding(.leading, 16)
            
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding(.leading, 16)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movieID: movie.imdbID)) {
                                MovieGridItemView(movie: movie, animation: animation)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .onAppear {
            viewModel.fetchMovies(for: genre.query)
        }
    }
}

struct GenreRowView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyGenre = Genre(title: "Action", query: "action")
        // Using a Namespace for matched geometry effect in preview.
        let namespace = Namespace().wrappedValue
        
        GenreRowView(genre: dummyGenre, animation: namespace)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

