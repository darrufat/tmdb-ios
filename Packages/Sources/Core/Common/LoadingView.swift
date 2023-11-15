import SwiftUI

public struct LoadingView: View {
    public init() {}
    
    public var body: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LoadingView()
}
