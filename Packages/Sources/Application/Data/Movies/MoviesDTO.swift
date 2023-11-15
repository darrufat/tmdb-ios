struct MoviesDTO: Decodable {
    let page: Int
    let totalPages: Int
    let results: [MovieDTO]

    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case results
    }
}

struct MovieDTO: Decodable {
    let id: Int
    let backdropPath: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Float

    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
