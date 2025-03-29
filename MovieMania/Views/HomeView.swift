//
//  HomeView.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//
import SwiftUI

struct HomeView: View {
    //@StateObject var viewModel = HomeViewModel()
    @Namespace var animation
    // Define your grid columns
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]

    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        ForEach(genres) { genre in
                            GenreRowView(genre: genre, animation: animation)
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Movies")
            }
        }
}

#Preview {
    HomeView()
}
