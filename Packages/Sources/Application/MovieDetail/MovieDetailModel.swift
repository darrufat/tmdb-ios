import Common
import Foundation

struct MovieDetailModel {
    public let id: String
    var backgroundImageURL: URL?
    var title: String
    var originalTitle: String
    var summary: String
    var rating: Float
    var year: Int?
}

extension MovieDetailModel: Redactable {
    public static var placeholder: MovieDetailModel {
        .init(
            id: UUID().uuidString,
            backgroundImageURL: .none,
            title: "",
            originalTitle: "Shingeki no Kyojin",
            summary: "After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.",
            rating: 9.1,
            year: 2013
        )
    }
}
