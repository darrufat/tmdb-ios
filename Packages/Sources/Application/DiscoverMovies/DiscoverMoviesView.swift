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
                mainView([.placeholder, .placeholder, .placeholder])
                    .redacted(reason: .placeholder)
                    .shimmering()
            case .loaded:
                mainView(viewModel.movies)
            case .failed(let error):
                Text(error.localizedDescription) // TODO
            }
        }
        .navigationTitle("TMDB")
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

    private func mainView(_ movies: [MovieModel]) -> some View {
        NavigationStack {
            List {
                ForEach(movies) { movie in
                    NavigationLink(value: movie) {
                        MovieCellView(model: movie)
                            .frame(height: 250)
                            .onAppear {
                                guard movies.last?.id == movie.id else { return }
                                Task {
                                    switch viewModel.state {
                                    case .loaded:
                                        try await viewModel.loadMore()
                                    case .loading, .failed, .idle, .empty:
                                        break
                                    }
                                }
                            }
                    }
                }
                if viewModel.isLoadingMore {
                    LoadingView()
                }
            }
            .navigationTitle("TMDB")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: MovieModel.self) { model in
                viewModel.coordinator.navigate(to: .detail(movieId: model.id))
            }
            .listStyle(.plain)
        }
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
