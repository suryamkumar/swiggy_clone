# 🍽️ Swiggy Clone - Flutter App

A **Swiggy-like food delivery UI** built using Flutter.  
This project demonstrates clean architecture, robust state management, and modern scroll-responsive UI — inspired by the Swiggy app.

---

## 🚀 Features

- ✅ Flutter-based Swiggy UI Clone  
- ✅ MVVM Architecture  
- ✅ State Management using **BLoC** & **Cubit**  
- ✅ Scroll-responsive **SliverAppBar** (like Swiggy)  
- ✅ API Integration using **First APIs**  
- ✅ **Pagination** support  
- ✅ **Shimmer Effect** for loading state  
- ✅ Custom Theme Support  
- ✅ **Navigation 2.0** using `go_router`  

---

## 📸 Screenshots

| 🏠 Home Page | 🏬 99 Store | 🍛 Top Rated Near You |
|-------------|-------------|------------------------|
| ![Home](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/first.jpeg) | ![99 Store](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/second.jpeg) | ![Top Rated](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/third.jpeg) |

| 🔼 Scroll Up View | 🔽 Scroll Down View |
|------------------|---------------------|
| ![Scroll Up](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/fourth.jpeg) | ![Scroll Down](https://github.com/suryamkumar/swiggy_clone/blob/main/ScreenShots/fifth.jpeg) |

> 📂 Screenshots are stored in the `/ScreenShots/` folder.

---

## 🧠 Architecture

This project uses the **MVVM (Model-View-ViewModel)** pattern:

- **Model** – API and data representation  
- **ViewModel** – Business logic via BLoC or Cubit  
- **View** – Widget tree and UI rendering  

### 🛠️ Technologies & Packages

| Package         | Role                                  |
|-----------------|----------------------------------------|
| `flutter_bloc`  | State Management (BLoC/Cubit)          |
| `go_router`     | Navigation 2.0                         |
| `shimmer`       | Loading shimmer effect                 |
| `http`          | API calls                              |
| `provider`      | Optional for dependency injection      |

---

## 🧪 Getting Started

1. Clone this repo:
   ```bash
   git clone https://github.com/suryamkumar/swiggy_clone.git
   cd swiggy_clone
