import Foundation

public enum ViewState {
    case idle
    case empty
    case loading
    case loaded
    case failed(LocalizedError)
}
