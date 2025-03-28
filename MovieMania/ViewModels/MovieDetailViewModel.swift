import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie?

    func fetchMovieDetail(imdbID: String) {
        OMDBService.shared.fetchMovieDetail(imdbID: imdbID) { [weak self] result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.movie = movie
                }
            case .failure(let error):
                print("Failed to fetch movie details: \(error.localizedDescription)")
            }
        }
    }
}
