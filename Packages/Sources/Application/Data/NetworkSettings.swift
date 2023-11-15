import Foundation

// Create an Environment enum to be read from plist
struct NetworkSettings {
    static let baseURL: URL? = URL(string: "https://api.themoviedb.org/3/")
    static let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
}
