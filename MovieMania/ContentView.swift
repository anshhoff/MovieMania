//
//  ContentView.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 27/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var watchlistVM = WatchlistViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            WatchlistView()
                .tabItem {
                    Label("Watchlist", systemImage: "bookmark")
                }
        }
        .accentColor(.blue)
        .environmentObject(watchlistVM)
    }
}

#Preview {
    ContentView()
}

