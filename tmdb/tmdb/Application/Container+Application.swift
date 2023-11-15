import Data
import MovieDetail
import Factory

extension Container: AutoRegistering {
    public func autoRegister() {
        registerDataDependencies()
        registerDetailDependencies()
    }
}
