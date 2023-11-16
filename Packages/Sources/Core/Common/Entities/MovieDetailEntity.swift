public struct MovieDetailEntity {
    public let id: Int
    public let backgroundURL: String
    public let title: String
    public let originalTitle: String
    public let overview: String
    public let posterURL: String
    public let year: Int?
    public let voteAverage: Float

    public init(id: Int, backgroundURL: String, title: String, originalTitle: String, overview: String, posterURL: String, year: Int?, voteAverage: Float) {
        self.id = id
        self.backgroundURL = backgroundURL
        self.title = title
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterURL = posterURL
        self.year = year
        self.voteAverage = voteAverage
    }
}
