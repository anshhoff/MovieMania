//
//  WatchListView.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//
import SwiftUI

struct WatchlistView: View {
    @EnvironmentObject var viewModel: WatchlistViewModel

    var body: some View {
        NavigationView {
            List {
                if viewModel.watchlist.isEmpty {
                    Text("Your watchlist is empty.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(viewModel.watchlist, id: \.imdbID) { movie in
                        HStack {
                            AsyncImage(url: URL(string: movie.poster)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 90)
                                    .cornerRadius(8)
                            } placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 90)
                                    .foregroundColor(.gray)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                Text(movie.title)
                                    .font(.headline)
                                Text(movie.year)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.removeFromWatchlist)
                }
            }
            .navigationTitle("Watchlist")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    WatchlistView()
}
