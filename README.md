# Image Searching App

## Description

The Image Searching App is an iOS application built with SwiftUI using Unsplash API to search images. After entering a search query, on View displays a grid of images.

Key features:
- Search functionality with real-time results
- LazyVGrid for displaying images. So items in the grid are only loaded and rendered when they are about to become visible
- Asynchronous image loading
- Error handling for no results or empty searches

## Installation

1. To get started with this project, clone the repository to your local machine using the following command: `git clone https://github.com/victoriaSamsonovaaa/Image-searching`
2. Open the project in Xcode.
3. Create a `APIKeys.xcconfig` file in the project root folder
4. Open APIKeys.xcconfig and add your Unsplash API key: `APIKey = your API key`.
   Note: Do not use quotes around the API key.

   ### How to get your access key:
   - [Unsplash](https://unsplash.com)
   - Create an Account
   - Click on "New Application"
   - Fill in Application Details
   - Once your application is created, you'll be taken to your app's page
   - Here you'll find your "Access Key" (which is your API key)

5. Make sure in project's Info Configuration settings `Config.xcconfig` is set as the configuration file for both Debug and Release.
6. Make sure in `Info.plist`file exists key: `APIKey` of String type with value: `$(APIKey)`.
7. If steps 6 || 7 aren't performed, use instructions and run it.
8. Build and run the project on your iOS simulator or physical device.

## Usage

1. Launch the app on your iOS device or simulator.
2. Enter a query word in the textField at the top of the screen. If you're not satisfied with a query you can tap on "Xmark" and this word will disappear from textField.
3. Tap the "Find" button to initiate the search.
4. Scroll through the grid of images that match your search query.

## Authors

- Victoria Samsonova

