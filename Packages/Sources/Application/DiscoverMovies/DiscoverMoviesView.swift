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
            case .loaded, .loading:
                mainView
            case .failed(let error):
                Text(error.localizedDescription) // TODO
            }
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
    DiscoverMoviesView(viewModel: .init(state: .loaded,
                                        movies: [
                                            .placeholder,
                                            .placeholder,
                                            .placeholder
                                        ]))
}
