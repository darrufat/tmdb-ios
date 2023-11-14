import Foundation

public enum ViewState {
    case empty
    case loading
    case loaded
    case failed(LocalizedError)
}
