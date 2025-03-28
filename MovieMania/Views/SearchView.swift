import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search movies...", text: $searchText, onCommit: {
                        viewModel.searchMovies(query: searchText)
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                    Button(action: {
                        viewModel.searchMovies(query: searchText)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .padding(.trailing)
                    }
                }
                .padding(.top)

                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieID: movie.imdbID)) {
                            HStack {
                                AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 75)
                                        .cornerRadius(8)
                                } placeholder: {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 75)
                                        .foregroundColor(.gray)
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
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
