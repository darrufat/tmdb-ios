import Combine
import Common
import Domain
import Factory
import Foundation

public final class DiscoverMoviesViewModel: ObservableObject {
    @Injected(\.getImageConfigurationUseCase) private var getImageConfigurationUseCase
    @Injected(\.getDiscoveryMoviesUseCase) private var getDiscoveryMoviesUseCase
    @Injected(\.discoverMoviesCoordinator) var coordinator

    @Published var state: ViewState
    @Published var movies: [MovieModel]
    var isLoadingMore = false
    private var hasMoreMovies = true

    private var currentPage = 1

    public init(state: ViewState = .idle, movies: [MovieModel] = []) {
        self.state = state
        self.movies = movies
    }

    @MainActor
    func load() async {
        state = .loading
        do {
            try await loadDiscover(page: 1)
            currentPage = 1
        } catch {
            //state = .failed(error) // TODO: handle error state
        }
    }

    @MainActor
    func loadMore() async throws {
        guard !isLoadingMore, hasMoreMovies else { return }
        do {
            isLoadingMore = true
            try await loadDiscover(page: currentPage+1)
            currentPage += 1
        } catch {
            // state = .failed(error) // TODO: handle error state
        }
        isLoadingMore = false
    }

    @MainActor
    func refresh() async {
        do {
            try await loadDiscover(page: 1)
            currentPage = 1
        } catch {}
    }

    @MainActor
    private func loadDiscover(page: Int) async throws {
        let imageConfig = try await getImageConfigurationUseCase()
        let entities = try await getDiscoveryMoviesUseCase(page: page)
        hasMoreMovies = !entities.isEmpty
        let models: [MovieModel] = entities.map {
            .init(id: String($0.id),
                  imageURL: URL(string: imageConfig.getHighestQualityPosterImageURL(path: $0.posterPath)),
                  title: $0.title,
                  summary: $0.overview,
                  rating: $0.voteAverage,
                  year: $0.year
            )
        }
        if isLoadingMore {
            movies.append(contentsOf: models)
        } else {
            movies = models
        }

        state = .loaded
        // TODO: handling empty states depending on pagination
        //state = data == nil ? .empty(emptyPlaceHolderModel) : .loaded
    }
}
