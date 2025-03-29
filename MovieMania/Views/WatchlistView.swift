//
//  WatchListView.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

import SwiftUI

struct WatchlistView: View {
    @EnvironmentObject var watchlistVM: WatchlistViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if watchlistVM.watchlist.isEmpty {
                    Text("Your Watchlist is Empty!")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(watchlistVM.watchlist, id: \.imdbID) { movie in
                            NavigationLink(destination: MovieDetailView(movieID: movie.imdbID)) {
                                HStack {
                                    AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 75)
                                            .cornerRadius(8)
                                    } placeholder: {
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 50, height: 75)
                                            .cornerRadius(8)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(movie.title)
                                            .font(.headline)
                                        Text(movie.year)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .onDelete(perform: watchlistVM.removeFromWatchlist)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Your Watchlist")
        }
    }
}


#Preview {
    WatchlistView()
}
