import Common
import Domain
import Factory
import Foundation
import HTTPClient

struct DefaultImageConfigurationRepository: ImageConfigurationRepository {
    @Injected(\.imageConfigurationMemoryDataSource) private var memoryDataSource
    @Injected(\.imageConfigurationNetworkDataSource) private var networkDataSource

    func getImageConfiguration() async throws -> ImageConfigurationEntity {
        if let dto = try await memoryDataSource.fetchImageConfiguration() {
            return mapDTO(dto)
        } else if let dto = try await networkDataSource.fetchImageConfiguration() {
            memoryDataSource.saveImageConfiguration(dto)
            return mapDTO(dto)
        }
        throw NSError(domain: "Missing DTO", code: 1012)
    }

    private func mapDTO(_ dto: ImageConfigurationDTO) -> ImageConfigurationEntity {
        .init(baseURL: dto.images.secureBaseURL,
              backgroundSizes: dto.images.backDropSizes,
              posterSizes: dto.images.posterSizes)
    }
}
