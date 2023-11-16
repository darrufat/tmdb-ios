struct ImageConfigurationDTO: Decodable {
    let images: ImageDataDTO
}

struct ImageDataDTO: Decodable {
    let secureBaseURL: String
    let backDropSizes: [String]
    let posterSizes: [String]

    enum CodingKeys: String, CodingKey {
        case secureBaseURL = "secure_base_url"
        case backDropSizes = "backdrop_sizes"
        case posterSizes = "poster_sizes"
    }
}
