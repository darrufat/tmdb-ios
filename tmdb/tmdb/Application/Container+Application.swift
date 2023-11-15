import Data
import Factory

extension Container: AutoRegistering {
    public func autoRegister() {
        registerDataDependencies()
    }
}
