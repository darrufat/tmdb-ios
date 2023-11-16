struct MovieDetailDTO: Decodable {
    let id: Int
    let backdropPath: String
    let title: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let voteAverage: Float

    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case title
        case originalTitle = "original_title"
        case overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
