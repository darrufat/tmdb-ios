public struct MovieEntity {
    public let id: Int
    public let title: String
    public let overview: String
    public var posterPath: String
    public let year: Int?
    public let voteAverage: Float

    public init(id: Int, title: String, overview: String, posterURL: String, year: Int?, voteAverage: Float) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterURL
        self.year = year
        self.voteAverage = voteAverage
    }
}
