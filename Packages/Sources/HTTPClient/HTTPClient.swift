import Foundation

public protocol HTTPClient {
    func fetch(request: HTTPRequest) async throws -> HTTPResponse
}

struct URLSessionHTTPClient: HTTPClient {
    func fetch(request: HTTPRequest) async throws -> HTTPResponse {
        var urlRequest = URLRequest(url: request.url)
        urlRequest.httpMethod = request.method.rawValue

        request.headers.forEach { (field: String, value: String) in
            urlRequest.setValue(value, forHTTPHeaderField: field)
        }

        urlRequest.url?.append(queryItems: request.params.map {
            .init(name: $0, value: $1)
        })

        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse,
            200...299 ~= httpResponse.statusCode else {
                throw HTTPClientError.failure
        }
        return .init(data: data, response: response)
    }
}
