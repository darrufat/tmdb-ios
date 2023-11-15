import DiscoverMovies
import Factory
import SwiftUI

@main
struct tmdbApp: App {
    init() {
        Container.shared.autoRegister()
    }

    var body: some Scene {
        WindowGroup {
            DiscoverMoviesView(viewModel: .init())
        }
    }
}
