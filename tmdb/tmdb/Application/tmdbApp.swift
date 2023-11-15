import DiscoverMovies
import Factory
import SwiftUI

@main
struct tmdbApp: App {
    @Injected(\.discoverMoviesBuilder) private var discoverMoviesBuilder

    init() {
        Container.shared.autoRegister()
    }

    var body: some Scene {
        WindowGroup {
            discoverMoviesBuilder.build()
        }
    }
}
