import DiscoverMovies
import SwiftUI

@main
struct tmdbApp: App {
    var body: some Scene {
        WindowGroup {
            DiscoverMoviesView(viewModel: .init())
        }
    }
}
