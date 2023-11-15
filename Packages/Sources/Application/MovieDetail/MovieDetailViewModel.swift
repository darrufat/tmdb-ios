import Combine

public final class MovieDetailViewModel: ObservableObject {
    let movieId: String
    var detailModel: MovieDetailModel?

    public init(movieId: String) {
        self.movieId = movieId
    }
}
