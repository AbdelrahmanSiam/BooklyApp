# 📚 Bookly — Book Discovery App

> A Flutter book discovery app powered by the Google Books API.  
> Browse, search, save favorites, and preview books — built with MVVM architecture.

---

## 🎬 Live Demo

[![LinkedIn Demo](https://img.shields.io/badge/LinkedIn-Watch%20Demo-blue?logo=linkedin)](https://www.linkedin.com/posts/abdelrahman-siam-2a66072ba_flutter-dart-mvvm-activity-7414696276916682752-M6dZ?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEye2N4BxN3uf6ODo-UmeBYhDCm2KCGqw30)

---

## 📱 Screenshots

| Splash | Home | Search |
|:------:|:----:|:------:|
| ![Splash](splash.png) | ![Home](home.png) | ![Search](search.png) |

| Book Details | Favorite Books | Preview Book |
|:-----------:|:--------------:|:------------:|
| ![Details](book_details.png) | ![Favorites](favorite_books.png) | ![Preview](preview_book.png) |

---

## ✨ Features

### 📖 Discovery
- Browse featured and newest books on Home screen
- Search any book by title or author via Google Books API
- Infinite scroll with pagination

### 📘 Book Details
- Full book info: title, author, rating, pages, price
- Open book preview in browser via url_launcher

### ❤️ Favorites
- Save favorite books locally with Hive
- Offline access to saved books
- Add / Remove favorites with instant UI update

### 🎨 UI
- Animated splash screen
- Smooth page transitions with GoRouter
- Cached book cover images
- Custom Poppins font + Google Fonts

---

## 🏗️ Architecture — MVVM

```
lib/
├── core/
│   ├── di/              # Dependency injection (get_it)
│   ├── errors/          # Failures & Exceptions (dartz Either)
│   ├── network/         # Dio API client
│   ├── routing/         # GoRouter navigation
│   ├── theme/           # Colors & ThemeData
│   └── utils/           # Constants & helpers
│
└── features/
    ├── home/
    │   ├── data/
    │   │   ├── datasources/   # Google Books API calls
    │   │   ├── models/        # BookModel.fromJson
    │   │   └── repos/         # Repository implementation
    │   └── presentation/
    │       ├── view_models/   # ViewModel (Cubit) ← MVVM layer
    │       └── views/         # Home, Splash screens + Widgets
    ├── search/
    │   └── ...                # Same MVVM structure
    ├── book_details/
    │   └── ...
    └── favorites/
        └── ...                # Hive local datasource
```

### MVVM Data Flow

```
View (Widget)
    ↕  observes state
ViewModel (Cubit)
    ↕  calls
Repository (interface)
    ↕
RepositoryImpl → DataSource → Google Books API / Hive
```

---

## 🛠️ Tech Stack

| Category | Technology | Purpose |
|----------|-----------|---------|
| Architecture | MVVM | Separation of View from business logic |
| State Management | flutter_bloc (Cubit) | ViewModel layer |
| DI | get_it | Service locator |
| Navigation | go_router | Declarative routing |
| Network | dio | HTTP client |
| Error Handling | dartz (Either) | Functional error handling |
| Local Storage | hive + hive_flutter | Offline favorites |
| Images | cached_network_image | Efficient book cover caching |
| URL | url_launcher | Open book preview in browser |
| Icons | font_awesome_flutter | Rich icon set |
| Fonts | google_fonts + Poppins | Custom typography |
| Models | equatable | Value equality for entities |

---

## 🔌 API

**Google Books API** — free, no auth required for basic usage.

```
Base URL: https://www.googleapis.com/books/v1/

# Featured books
GET /volumes?q=subject:fiction&orderBy=relevance

# Newest books  
GET /volumes?q=subject:fiction&orderBy=newest&startIndex={page}

# Search
GET /volumes?q={query}
```

---

## 💾 Hive — Favorites Storage

```dart
// Favorite books stored locally
@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0) String id;
  @HiveField(1) String title;
  @HiveField(2) String author;
  @HiveField(3) String imageUrl;
  @HiveField(4) double price;
}
```

```bash
# Generate Hive adapters
flutter packages pub run build_runner build
```

---

## 🚀 Getting Started

### Prerequisites
```
Flutter SDK >= 3.6.0
Dart SDK ^3.6.0
```

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/AbdelrahmanSiam/BooklyApp.git

# 2. Navigate to project
cd BooklyApp

# 3. Install dependencies
flutter pub get

# 4. Generate Hive adapters
flutter packages pub run build_runner build

# 5. Run
flutter run
```

---

## 👨‍💻 Author

**Abdelrahman Siam**  
Flutter Mobile Application Developer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://linkedin.com/in/abdelrahman-siam-2a66072ba)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/AbdelrahmanSiam)

📧 syamabdo382@gmail.com
📱 +201282387620
