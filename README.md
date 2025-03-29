# 🎬 MovieMania

Welcome to **MovieMania** – an iOS movie guide app with a sleek, Netflix-inspired interface!  
Discover, search, and save your favorite movies with smooth animations, genre-based horizontal scrolling, and real-time updates.

---

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Screenshots](#screenshots)
- [Project Structure](#project-structure)
- [How to Run](#how-to-run)
- [API Information](#api-information)
- [Contributing](#contributing)
- [License](#license)

---

## Features

- **Home Screen (Netflix-Style UI):**  
  - Vertical list of movie genres  
  - Each genre row displays movies in a horizontal scroll  
  - Smooth animations and blurred background effects

- **Search Screen:**  
  - Real-time movie search powered by the OMDB API  
  - Error handling and clean UI design

- **Movie Detail Screen:**  
  - Detailed movie information with poster, genre, rating, plot, and cast  
  - "Add to Watchlist" functionality with instant updates  
  - "Watch Trailer" button that opens an in-app YouTube search

- **Watchlist Screen:**  
  - Save and manage your favorite movies  
  - Data persistence via UserDefaults and live updates using shared view models

---

## Tech Stack

| Technology         | Description                                             |
|--------------------|---------------------------------------------------------|
| **SwiftUI**        | Declarative UI framework for building iOS apps          |
| **MVVM Architecture** | Clean separation of concerns, modular code             |
| **OMDB API**       | Fetch movie data and details                            |
| **AsyncImage**     | Asynchronous image loading with placeholders            |
| **Combine**        | State management using `@StateObject` and `@EnvironmentObject`  |
| **Xcode**          | Integrated development environment (IDE)              |
| **Git & GitHub**   | Version control and repository hosting                |

---

## Screenshots

<img width="1234" alt="image" src="https://github.com/user-attachments/assets/5868bada-ded2-4d63-9c6c-d58a940b397d" />

---

## Project Structure

```
MovieMania
├── Models
│   ├── Movie.swift
│   ├── SearchMovie.swift
│   └── MovieSearchResponse.swift
├── ViewModels
│   ├── HomeViewModel.swift
│   ├── MovieDetailViewModel.swift
│   ├── SearchViewModel.swift
│   └── WatchlistViewModel.swift
├── Views
│   ├── ContentView.swift
│   ├── HomeView.swift
│   ├── MovieDetailView.swift
│   ├── SearchView.swift
│   └── WatchlistView.swift
├── Services
│   ├── NetworkManager.swift
│   └── OMDBService.swift
├── Utilities
│   └── Constants.swift
├── Resources
│   └── Assets.xcassets
└── MovieManiaApp.swift
```

---

## How to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/MovieMania.git
   ```

2. **Open the project in Xcode:**
   - Double-click `MovieMania.xcodeproj` or `MovieMania.xcworkspace` (if using Swift Package Manager/CocoaPods).

3. **Run the app:**
   - Select your target device or simulator, then press `Cmd + R`.

---

## API Information

**OMDB API**  
Movie data is fetched from the [OMDB API](https://www.omdbapi.com/).  
The app uses the OMDB API key provided in the OMDBService class.

**API Implementation:**
- The app implements a robust networking layer to handle API calls
- Search functionality to find movies by title
- Detailed movie information retrieval by IMDB ID
- Error handling and response parsing

---

## Contributing

Contributions are welcome!  
Feel free to fork this repository and submit a pull request for improvements or bug fixes. For major changes, please open an issue first to discuss what you would like to change.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

*Developed as part of an iOS app development project focused on learning API integration, MVVM architecture, and modern SwiftUI design.*
