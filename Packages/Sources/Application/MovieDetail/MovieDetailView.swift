import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    var body: some View {
        Text("Movie detail \(viewModel.movieId)")
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
    }
}
