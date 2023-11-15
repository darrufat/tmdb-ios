import Combine
import Common
import Domain
import Factory
import Foundation

public final class DiscoverMoviesViewModel: ObservableObject {
    @Injected(\.getDiscoveryMoviesUseCase) private var getDiscoveryMoviesUseCase

    @Published var state: ViewState
    @Published var movies: [MovieModel]
    private var page = 1

    public init(state: ViewState = .idle, movies: [MovieModel] = [.placeholder, .placeholder, .placeholder]) {
        self.state = state
        self.movies = movies
    }

    @MainActor
    func load() async {
        state = .loading
        do {
            try await loadDiscover(page: page)
        } catch {
            //state = .failed(error) // TODO: handle error state
        }
    }

    @MainActor
    func refresh() async {
        do {
            try await loadDiscover(page: 1)
        } catch {}
    }

    @MainActor
    private func loadDiscover(page: Int) async throws {
        let entities = try await getDiscoveryMoviesUseCase(page: page)
        movies = entities.map {
            .init(id: String($0.id),
                  imageURL: URL(string: $0.posterURL),
                  title: $0.title,
                  summary: $0.overview,
                  rating: $0.voteAverage,
                  year: $0.year
            )
        }
        state = .loaded
        // TODO: handling empty states depending on pagination
        //state = data == nil ? .empty(emptyPlaceHolderModel) : .loaded
    }
}
