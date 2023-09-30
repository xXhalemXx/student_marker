# News App

This Flutter app is a simple news reader I have designed to learn how to handle APIs in a professional way and fully understand app theming. The app provides news articles from three different categories and supports both dark and light modes.

## Table of Contents

- [Features](#features)
- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
- [API Integration](#api-integration)
- [Theming](#theming)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

## Features

- **News Categories**: The app fetches news articles from three different categories: Technology, Sports, and Entertainment.

- **Dark and Light Modes**: The app supports both dark and light themes, allowing users to choose their preferred reading mode.

- **Caching**: News articles are cached using `shared_preferences` for offline reading.

- **Web View**: Users can read the full article by tapping on a news item, which opens the article in a web view.

## Dependencies

This project relies on the following dependencies:

- **flutter_bloc**: State management library for handling application state.

- **get_it**: A simple service locator for dependency injection.

- **bloc**: State management library built on top of flutter_bloc.

- **freezed**: Code generation for immutable classes.

- **freezed_annotation**: Annotations for the freezed package.

- **dio**: HTTP client for making API requests.

- **retrofit**: A type-safe HTTP client generator for Dart.

- **json_annotation**: JSON serialization/deserialization.

- **auto_size_text**: Flutter widget that automatically resizes text to fit perfectly within its bounds.

- **shared_preferences**: Plugin for reading and writing key-value pairs persistently.

- **webview_flutter**: Flutter plugin for displaying web content.

Make sure to check the respective package documentation for detailed information on each dependency.

## Getting Started

To get started with this project, follow these steps:

1. Clone this repository:

   ```bash
   git clone https://github.com/your-username/flutter-news-app.git

2.  Navigate to the project directory:
    
     ```bash
    cd flutter-news-app
    
3.  Install the project dependencies:
    
     ```bash
    flutter pub get
    
4.  Run the app on your preferred emulator or physical device:
     ```bash    
    flutter run

## API Integration

The app integrates with a news API to fetch articles. The API integration logic can be found in the `lib/data` directory. We use `dio` for making HTTP requests and `retrofit` for type-safe API calls. You'll find API service classes and models for data handling in this directory.

To integrate your preferred news API, update the API endpoints, request headers, and data models as needed.

## Theming

The app supports both dark and light themes. The theming logic can be found in the `lib/theme` directory. The app's theme can be customized by modifying the theme files in this directory.

## Screenshots



## Contributing

Contributions to this project are welcome. If you'd like to contribute, please fork the repository, create a new branch, make your changes, and submit a pull request. Please ensure your code follows best practices and includes relevant tests.

