import Common
import SwiftUI
import Kingfisher

struct MovieCellView: View {
    let model: MovieModel

    var body: some View {
        HStack(alignment: .top) {
            if let imageURL = model.imageURL {
                KFImage(imageURL)
                    .resizable()
                    .placeholder { placeholderImage }
                    .aspectRatio(0.66, contentMode: .fit)
                    .cornerRadius(8)
            } else {
                placeholderImage
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(model.title)
                    .font(.title)
                    .bold()

                Text(model.summary)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(model.rating, specifier: "%.1f")")
                }
            }
        }
        .padding()
    }

    private var placeholderImage: some View {
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
    MovieCellView(model: .placeholder)
        .frame(height: 250)
        .redacted(reason: .placeholder)
        .shimmering()
}
