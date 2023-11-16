public struct ImageConfigurationEntity {
    let baseURL: String
    let backgroundSizes: [String]
    let posterSizes: [String]

    public init(baseURL: String, backgroundSizes: [String], posterSizes: [String]) {
        self.baseURL = baseURL
        self.backgroundSizes = backgroundSizes
        self.posterSizes = posterSizes
    }
}

extension ImageConfigurationEntity {
    public func getHighestQualityBackgroundImageURL(path: String) -> String {
        guard let highestQualitySize = backgroundSizes.last else { return path }
        return baseURL.appending(highestQualitySize).appending(path)
    }

    public func getHighestQualityPosterImageURL(path: String) -> String {
        guard let highestQualitySize = posterSizes.last else { return path }
        return baseURL.appending(highestQualitySize).appending(path)
    }
}
