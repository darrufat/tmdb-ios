import Common
import Foundation

public struct MovieModel: Identifiable {
    public let id: String
    var imageURL: URL?
    var title: String
    var summary: String
    var rating: Float
    var year: Int?
}

extension MovieModel: Redactable {
    public static var placeholder: MovieModel {
        .init(
            id: UUID().uuidString,
            imageURL: URL(string: "https://example.com/image.jpg"),
            title: "Attack on titan",
            summary: "After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.",
            rating: 9.1,
            year: 2013
        )
    }
}
