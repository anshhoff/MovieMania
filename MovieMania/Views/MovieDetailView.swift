//
//  MovieDetailView.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movieID: String
    @StateObject private var viewModel = MovieDetailViewModel()
    @EnvironmentObject var watchlistVM: WatchlistViewModel
    @State private var showAlert = false
    @State private var showTrailer = false

    var body: some View {
        ScrollView {
            if let movie = viewModel.movie {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .foregroundColor(.gray)
                    }
                    .opacity((movie.poster ?? "N/A") == "N/A" ? 0 : 1)
                    
                    Text(movie.title ?? "Unknown Title")
                        .font(.title)
                        .bold()
                    
                    Text("Genre: \(movie.safeGenre)")
                        .font(.subheadline)
                    
                    Text("Actors: \(movie.safeActors)")
                        .font(.subheadline)
                    
                    Text("Rating: \(movie.safeRating)")
                        .font(.subheadline)
                    
                    Text(movie.safePlot)
                        .font(.body)
                        .padding(.top)
                    
                    Button(action: {
                        let searchMovie = SearchMovie(
                            title: movie.title ?? "Unknown Title",
                            year: movie.year ?? "",
                            imdbID: movie.imdbID,
                            type: movie.type ?? "",
                            poster: movie.poster ?? ""
                        )
                        watchlistVM.addToWatchlist(movie: searchMovie)
                        showAlert = true
                    }) {
                        Text("Add to Watchlist")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding(.top)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Added!"),
                              message: Text("Movie added to Watchlist."),
                              dismissButton: .default(Text("OK")))
                    }
                    
                    Button(action: {
                        showTrailer = true
                    }) {
                        Text(" Watch Trailer")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                    .sheet(isPresented: $showTrailer) {
                        let query = "\(viewModel.movie?.title ?? "") trailer"
                        let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        if let url = URL(string: "https://www.youtube.com/results?search_query=\(queryEncoded)") {
                            WebView(url: url)
                        } else {
                            Text("Trailer not available")
                        }
                    }
                    .padding(.top)
                    
                    
                }
                .padding()
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

            } else {
                ProgressView()
                    .onAppear {
                        if viewModel.movie == nil {
                            viewModel.fetchMovieDetail(imdbID: movieID)
                        }
                    }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Trailer Functionality
    private func openTrailer(for movie: Movie) {
        let title = movie.title
        let query = "\(title) trailer"
        let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let url = URL(string: "https://www.youtube.com/results?search_query=\(queryEncoded)") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - Safe Optional Computed Properties
extension Movie {
    var safeGenre: String {
        guard let genre = genre, genre != "N/A" else { return "Not Available" }
        return genre
    }
    
    var safeActors: String {
        guard let actors = actors, actors != "N/A" else { return "Unknown" }
        return actors
    }
    
    var safeRating: String {
        guard let rating = imdbRating, rating != "N/A" else { return "No Rating" }
        return rating
    }
    
    var safePlot: String {
        guard let plot = plot, plot != "N/A" else { return "Plot not available" }
        return plot
    }
}

#Preview {
    MovieDetailView(movieID: "tt3896198")
}
