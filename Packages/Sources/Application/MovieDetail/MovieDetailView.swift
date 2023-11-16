import Kingfisher
import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .empty:
                EmptyView() // TODO
            case .loading, .idle:
                mainView
                    .redacted(reason: .placeholder)
                    .shimmering()
            case .loaded:
                mainView
            case .failed(let error):
                Text(error.localizedDescription) // TODO
            }
        }
        .navigationTitle(viewModel.detailModel.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                switch viewModel.state {
                case .empty, .failed, .idle:
                    await viewModel.load()
                case .loaded, .loading:
                    break
                }
            }
        }
        .refreshable {
            await viewModel.refresh()
        }
    }

    private var mainView: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                if let imageURL = viewModel.detailModel.backgroundImageURL {
                    KFImage(imageURL)
                        .resizable()
                        .placeholder { Color.secondary
                            .opacity(0.3) }
                        .aspectRatio(1.77, contentMode: .fit)
                } else {
                    Color.secondary
                        .opacity(0.3)
                        .aspectRatio(1.77, contentMode: .fit)
                }

                VStack(alignment: .leading) {
                    Text(viewModel.detailModel.title)
                        .font(.title)
                        .bold()

                    Text("\(viewModel.detailModel.originalTitle) (original title)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text(viewModel.detailModel.summary)
                        .font(.subheadline)
                        .padding(.vertical)

                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(viewModel.detailModel.rating, specifier: "%.1f")")

                        if let year = viewModel.detailModel.year {
                            Spacer()

                            Text(String(year))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
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
    MovieDetailView(viewModel: .init(state: .loading, movieId: "342341"))
}
