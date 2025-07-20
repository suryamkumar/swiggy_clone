# 🍽️ Swiggy Clone - Flutter App

A **Swiggy-like food delivery UI** built using Flutter.  
This project showcases clean architecture, smooth state management, and visually rich UI interactions inspired by the Swiggy app.

---

## 🚀 Features

- ✅ Flutter-based Swiggy UI Clone  
- ✅ MVVM Architecture  
- ✅ State Management using **BLoC** & **Cubit**  
- ✅ Scroll-responsive **SliverAppBar** (just like Swiggy)  
- ✅ API Integration via **First APIs**  
- ✅ **Pagination** for infinite list loading  
- ✅ **Shimmer Effect** for better loading experience  
- ✅ Theming support (Light/Dark/Custom)  
- ✅ Modern **Navigation 2.0** using `go_router`  

---

## 🧠 Architecture

This project is built using the **MVVM pattern**, ensuring scalability and separation of concerns:

- **Model** → API response and data structures  
- **ViewModel** → Business logic and state via BLoC/Cubit  
- **View** → UI widgets and screens

### 🔧 Core Packages Used

| Package         | Purpose                         |
|-----------------|---------------------------------|
| `flutter_bloc`  | State management (BLoC/Cubit)   |
| `go_router`     | Navigation 2.0                  |
| `http`          | API Calls                       |
| `shimmer`       | Loading UI shimmer              |
| `provider`      | Optional utility layer          |

---

## 📸 Screenshots

| 🏠 Home Page | 🏬 99 Store | 🍛 Product Detail |
|-------------|------------|------------------|
| ![Home](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/home_page.jpeg) | ![99 Store](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/store_page.jpeg) | ![Product](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/product_detail.jpeg) |

| 🔄 Scroll Behavior (Up) | 🔽 Scroll Behavior (Down) |
|------------------------|---------------------------|
| ![Scroll Up](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/scroll_up.jpeg) | ![Scroll Down](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/scroll_down.jpeg) |

> 📂 Place all screenshots inside a `ScreenShots/` folder in the root of the repo.

---

## 📦 Getting Started

Clone the repo and run:

```bash
flutter pub get
flutter run
