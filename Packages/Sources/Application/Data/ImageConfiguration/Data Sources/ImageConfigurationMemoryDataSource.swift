final class ImageConfigurationMemoryDataSource: ImageConfigurationDataSource {
    private var config: ImageConfigurationDTO?

    func fetchImageConfiguration() async throws -> ImageConfigurationDTO? {
        config
    }

    func saveImageConfiguration(_ config: ImageConfigurationDTO?) {
        self.config = config
    }
}
