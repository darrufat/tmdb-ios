import Factory
import Foundation
import HTTPClient

protocol ImageConfigurationDataSource {
    func fetchImageConfiguration() async throws -> ImageConfigurationDTO?
    func saveImageConfiguration(_ config: ImageConfigurationDTO?)
}

struct ImageConfigurationNetworkDataSource: ImageConfigurationDataSource {
    @Injected(\.httpClient) private var httpClient

    func fetchImageConfiguration() async throws -> ImageConfigurationDTO? {
        guard let url = NetworkSettings.baseURL else {
            throw HTTPClientError.invalidURL
        }
        let request = HTTPRequest(url: url.appendingPathComponent("configuration"),
                                  method: .GET,
                                  params: ["api_key": NetworkSettings.apiKey])
        let response = try await httpClient.fetch(request: request)
        guard let data = response.data else { throw HTTPClientError.response(response) }
        return try JSONDecoder().decode(ImageConfigurationDTO.self, from: data)
    }

    func saveImageConfiguration(_ config: ImageConfigurationDTO?) {
        // Not needed for network
    }
}
