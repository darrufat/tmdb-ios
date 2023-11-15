import Foundation

// TODO: add post, delete, patch...
public enum HTTPRequestMethod: String {
    case GET
}

public struct HTTPRequest {
    let url: URL
    let method: HTTPRequestMethod
    let params: [String: String]
    let headers: [String: String]

    public init(url: URL, 
                method: HTTPRequestMethod,
                params: [String: String] = [:],
                headers: [String: String] = [:]) {
        self.url = url
        self.method = method
        self.params = params
        self.headers = headers
    }
}
