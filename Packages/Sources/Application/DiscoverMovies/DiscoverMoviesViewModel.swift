import Combine
import Common

public final class DiscoverMoviesViewModel: ObservableObject {
    @Published var state: ViewState
    @Published var movies: [MovieModel]

    public init(state: ViewState = .loading, movies: [MovieModel] = []) {
        self.state = state
        self.movies = movies
    }
}
