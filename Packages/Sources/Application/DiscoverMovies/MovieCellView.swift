import SwiftUI
import Kingfisher

struct MovieCellView: View {
    var imageURL: URL?
    var title: String
    var rating: Double
    var summary: String

    var body: some View {
        HStack(alignment: .top) {
            if let imageURL = imageURL {
                KFImage(imageURL)
                    .resizable()
                    .placeholder {
                        placeholderMovie
                    }
                    .aspectRatio(0.66, contentMode: .fit)
                    .cornerRadius(8)
            } else {
                placeholderMovie
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.title)
                    .bold()

                Text(summary)
                    .font(.subheadline)
                    .lineLimit(7)
                    .foregroundColor(.secondary)

                Spacer()

                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(rating, specifier: "%.1f")")
                }
            }

            Spacer()
        }
        .padding(.horizontal)
    }

    private var placeholderMovie: some View {
        ZStack {
            Color.secondary
                .opacity(0.3)
                .cornerRadius(8)
            Image(systemName: "film")
                .font(.largeTitle)
                .aspectRatio(0.66, contentMode: .fit)
        }
    }
}

#Preview {
    MovieCellView(
        imageURL: URL(string: "https://example.com/image.jpg"),
        title: "Ataque a los titanes",
        rating: 9.1,
        summary: "After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction."
    )
    .frame(height: 200)
}
