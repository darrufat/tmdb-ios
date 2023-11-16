import Common
import Factory
import Foundation

public protocol GetImageConfigurationUseCase {
    func callAsFunction() async throws -> ImageConfigurationEntity
}

public struct GetImageConfiguration: GetImageConfigurationUseCase {
    @Injected(\.imageConfigurationRepository) private var repository

    public func callAsFunction() async throws -> ImageConfigurationEntity {
        guard let repository else { throw NSError(domain: "Dependency missing", code: 1001) }
        return try await repository.getImageConfiguration()
    }
}
