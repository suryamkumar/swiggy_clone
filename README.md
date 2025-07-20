# 🍽️ Swiggy Clone - Flutter App

A **Swiggy-like food delivery UI** built using Flutter.  
This project demonstrates clean architectural practices, robust state management, and modern UI design.

---

## 🚀 Features

✅ Flutter-based Swiggy UI Clone  
✅ MVVM Architecture  
✅ State Management using **BLoC** & **Cubit**  
✅ Dynamic **SliverAppBar** (changes with scroll like Swiggy)  
✅ API Integration using **First APIs**  
✅ **Pagination** for infinite scrolling  
✅ **Shimmer Effect** for loading UI  
✅ Custom **Theme** support  
✅ Modern **Navigation 2.0 (go_router)**  

---

## 📸 Screenshots

| Home Page | Restaurant List | Product Detail |
|-----------|------------------|----------------|
| ![Home](screenshots/screen1.png) | ![99 Store](screenshots/screen2.png) | ![Top Rated Near You](screenshots/screen3.png) |

| Cart Page | Profile Page |
|-----------|--------------|
| ![Top Restaunrants To Explore UP Scroll](screenshots/screen4.png) | ![Top Restaunrants To Explore Down Scroll](screenshots/screen5.png) |

> 📂 Place your screenshots inside a folder named `/screenshots` in the root of the repo.

---

## 🧠 Architecture

This project follows **MVVM**:
- `Model` → API models / data
- `ViewModel` → Cubit/BLoC handling logic and states
- `View` → Flutter widgets

### Tools Used:
- `flutter_bloc`
- `go_router`
- `http`
- `shimmer`
- `provider` (if used optionally)
- `custom themes`

---

## 📦 Getting Started

```bash
flutter pub get
flutter run
