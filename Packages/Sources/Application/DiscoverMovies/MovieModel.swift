import Common
import Foundation

public struct MovieModel: Identifiable {
    public let id = UUID()
    var imageURL: URL?
    var title: String
    var rating: Double
    var summary: String
}

extension MovieModel: Redactable {
    public static var placeholder: MovieModel {
        .init(
            imageURL: URL(string: "https://example.com/image.jpg"),
            title: "Attack on titan",
            rating: 9.1,
            summary: "After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction."
        )
    }
}
