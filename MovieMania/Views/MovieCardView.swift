//
//  MovieCardView.swift
//  MovieMania
//
//  Created by Ansh Hardaha on 28/03/25.
//

import SwiftUI

struct MovieCardView: View {
    let movie: SearchMovie

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 210)
                    .clipped()
            } placeholder: {
                Color.gray.opacity(0.3)
                    .frame(width: 140, height: 210)
                    .overlay(
                        ProgressView()
                    )
            }
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 5)

            // Title Overlay
            VStack {
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 6)
                    .background(
                        LinearGradient(colors: [.black.opacity(0.8), .clear], startPoint: .bottom, endPoint: .top)
                    )
            }
            .frame(width: 140)
        }
        .scaleEffect(1)
        .onTapGesture {
            // Optional animation if you want
            withAnimation(.spring()) {}
        }
    }
}

#Preview {
    MovieCardView(movie: SearchMovie(title: "Inception", year: "2010", imdbID: "tt1375666", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BMmYxN2MwY2UtZDA2Yy00N2EyLWI3NDItMTI0MzY4NjVhNzQzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"))
}
