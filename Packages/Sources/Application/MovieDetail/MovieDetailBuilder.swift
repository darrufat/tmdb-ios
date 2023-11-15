import Common
import SwiftUI

struct MovieDetailBuilder: MovieDetailBuilding {
    public func build(with movieId: String) -> AnyView {
        AnyView(
            MovieDetailView(viewModel: .init(movieId: movieId))
        )
    }
}
