# Beacon iOS App

A native iOS app for finding restaurants, cafés and hotels around you using the [Geoapify Places API](https://apidocs.geoapify.com/docs/places/), rating the places you visit, and keeping those ratings locally with SwiftData. Built with Swift and SwiftUI following an MVVM architecture. The app UI is in Norwegian.

## Background

Originally built as the exam project for **iOS Programming (15 ECTS)**, Kristiania University College, graded **B**.

All code is handwritten.
AI is only used to help write the README and commit messages.

## Features

- **Explore:** nearby places on an interactive map with custom pins, or in a list view, toggled with one button
- **Search:** search places by name, debounced 300 ms so typing doesn't spam the API
- **Filter:** pick a category (restaurant, hotel, café) and a search radius from 1 km to 10 km
- **Sort:** by distance, alphabetically, by highest average rating, or show only places you've rated
- **Rate:** give a place 1–5 stars; every rating is stored with a date and shown as a partially filled average star
- **My Places:** your saved places with their average rating and full rating history
- **Details:** address, opening hours, phone, email and website, plus a link that opens the place in Apple Maps
- GPS button, animated category illustrations, pull to refresh, loading and empty states

## Tech Stack

| Layer | Tools |
|---|---|
| Language | Swift |
| UI | SwiftUI |
| Maps | MapKit |
| Location | CoreLocation |
| Networking | URLSession, Codable |
| Local storage | SwiftData |
| Reactive | Combine (debounced search) |
| Architecture | MVVM (View → ViewModel → API/SwiftData) |

## Architecture

```
Models/            Decodable API models + SwiftData @Model types
ViewModels/        Location tracking, debounced search
Views/ExploreTab/  Map view, list view, and the shared parent view
Views/MyPlacesTab/ Saved places and rating history
Views/Components/  Place details sheet, average star rating
Views/Animations/  Per-category animated illustrations
Modifiers/         Shared button and heading styling
```

`SavedPlace` and `Rating` are related with a cascading delete rule, so deleting a place removes its ratings.

## Getting Started

**Requirements:** Xcode 26 or newer, iOS 26.0 deployment target.

```bash
git clone git@github.com:AnnikenJE/beacon.git
cd beacon
```

The API key is not checked in (`**/APIKey.swift` is git-ignored). Get a free key at [geoapify.com](https://www.geoapify.com/), then copy the template and fill in your key:

```bash
cp Beacon/APIKey.example.swift Beacon/APIKey.swift
```

```swift
enum APIKey {
    static let geoapifyAPIKey = "YOUR_API_KEY_HERE"
}
```

Add `Beacon/APIKey.swift` to the Beacon target in Xcode so it gets compiled.

Open `Beacon.xcodeproj` in Xcode and run on a simulator or device. The app asks for "when in use" location access the first time you use the GPS button.


