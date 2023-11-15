import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    var body: some View {
        Text("Movie detail \(viewModel.movieId)")
    }
}
