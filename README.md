# TMDB iOS

**TMDB** is a demo app to discover recent released movies.

## Overview

This app displays a list of movies and, when you select one, its details will be displayed on a new screen.

## Configure and Run the Application

The TMDB iOS app was developed in Xcode 15 to take advantage of the latests features and cleaner swift macros like #Preview.

There are several dependencies integrated with SPM:

### App:

* [Factory](https://github.com/hmlongco/Factory.git): A compile-time safe dependency injection library.
* [Kingfisher](https://github.com/onevcat/Kingfisher.git): An image downloading library that also handles caching.

### Tests:

* [Snapshot-Testing](https://github.com/pointfreeco/swift-snapshot-testing.git): A library for creating snapshot tests with different configurations.
* [Nimble](https://github.com/Quick/Nimble.git): A library for writing more readable unit tests and offering helpful expectations.

## Architecture

To avoid adding excessive boilerplate, I developed the app using the MVVM architecture for the presentation layer. I also incorporated Coordinators to abstract navigation logic.

Following clean architecture principles, I also have a domain layer with use cases, and a Data layer consisting of repositories and data sources.

## Workspace Structure

I understand that one can work directly on a project with SPM. However, I prefer having a Workspace to compartmentalize the application into Packages, even delineating each feature or screen.

I choose this approach because, in the future, if you want to create an App Clip (or a watchOS, macOS, tvOS App...), you can simply incorporate the features you need.

The main modules include:

- **Data**: This encompasses the repositories and data sources.
- **Domain**: Primarily, the search use case and the repository protocol.
- **DiscoverMovies**: This is the discover movies screen with the view module utilizing the MVVM structure and a builder to consolidate the classes.
- **MovieDetail**: The detail screen follows a similar architecture.
- **Common**: Shared protocols and entities between layers, free of dependencies.
- **HTTPClient**: A simple URLSession wrapper for requests, which can be replaced by Alamofire or another library if necessary.

Dependencies between 3rd party libraries and packages are established in SPM and registered with Factory, with Container extensions created in each module.

## Testing

Regrettably, I didn't have time to implement tests. Ideally, I'd like to at least establish a snapshot test of cells under different scales, in both dark and light modes, and so on.

Unit tests are crucial for all logic to ensure consistent app behavior and to prevent issues across releases. I usually mock dependency protocols with tools like Sourcery, Cuckoo, Mockolo, etc., but perhaps Swift macros might offer similar capabilities.

In my experience, UI Tests tend to be unstable and slow. I prioritize covering code with the aforementioned test types and occasionally some integration tests, from ViewModel to HTTPClient, using real dependencies but mocking HTTP responses.