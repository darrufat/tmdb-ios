import SwiftUI

public protocol MovieDetailBuilding {
    func build(with movieId: String) -> AnyView
}
