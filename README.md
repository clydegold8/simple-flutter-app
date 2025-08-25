# Simple Flutter Ad Blocker (Demo App)

A **personal Flutter demo app** that showcases a simple ad-blocking interface.  
⚠️ This project is **frontend only** — no APIs, no backend communication.  
It’s built purely for **UI/UX demonstration purposes**.

---

## 🚀 Project Setup

Clone the repository:
```sh
git clone git@github.com:your-username/k-block-demo.git
```

Install dependencies:
```sh
flutter pub get
```

---

## 🛠️ Flutter Setup

### For Windows Users
1. Install [Android Studio](https://developer.android.com/) (recommended IDE).  
2. Download Flutter SDK: [Get Flutter](https://docs.flutter.dev/get-started/install/windows)  
3. Extract the SDK to your preferred location.  
4. Add `<your_path>/flutter/bin` to your system `PATH`.  
5. Verify installation:
   ```sh
   flutter --version
   ```
6. Open this project in Android Studio and install **Flutter** + **Dart** plugins.  
7. Run:
   ```sh
   flutter pub get
   ```
8. Start an emulator or connect a device.  
9. Run the app from your IDE.

### For macOS Users
1. Install Flutter SDK: [Get Flutter](https://docs.flutter.dev/get-started/install/macos#get-sdk)  
2. Follow the official installation steps.  
3. Open the project in your IDE and run as described above.

---

## ▶️ Running the App

### From IDE
- Run → `main.dart`  
  *(Windows shortcut: `Shift + F10`)*

### From CLI (Mobile/Desktop)
```sh
flutter run
```

### 🌐 Run on Web
Flutter supports running apps directly in the browser.  

1. Make sure web support is enabled:
   ```sh
   flutter config --enable-web
   flutter devices
   ```
   You should see `Chrome` or another browser listed as a device.  

2. Run the app on web:
   ```sh
   flutter run -d chrome
   ```
   or  
   ```sh
   flutter run -d edge
   ```

3. To build a release version for web:
   ```sh
   flutter build web
   ```
   The output will be in the `build/web` folder.

---

## 📖 Widgetbook (UI Showcase)

This app also includes a **Widgetbook setup** for browsing and testing UI components.  

1. Install dependencies:
   ```sh
   flutter pub get
   ```
2. Build:
   ```sh
   flutter pub run build_runner build
   ```
3. Keep build runner watching:
   ```sh
   flutter pub run build_runner watch
   ```
4. Run Widgetbook:
   ```sh
   flutter run lib/src/app.widgetbook.dart
   ```
5. Preview in browser or emulator.

---
