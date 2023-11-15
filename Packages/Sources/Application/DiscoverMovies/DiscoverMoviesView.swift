import Common
import SwiftUI

public struct DiscoverMoviesView: View {
    @ObservedObject var viewModel: DiscoverMoviesViewModel
    public init(viewModel: DiscoverMoviesViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
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
        List {
            ForEach(viewModel.movies) { movie in
                MovieCellView(model: movie)
                    .frame(height: 250)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    DiscoverMoviesView(viewModel: .init(state: .loading,
                                        movies: [
                                            .placeholder,
                                            .placeholder,
                                            .placeholder
                                        ]))
}
