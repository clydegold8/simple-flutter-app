# K-Block App

A K-Block app that blocks unwanted ads to the users

## Flutter Setup

### Getting Started for Windows OS users
 - Clone this repo on your desired path.
 - Recommended IDE [Android Studio](https://developer.android.com/)
 - Download flutter framework [See Here](https://docs.flutter.dev/get-started/install/windows)
 - Extract the downloaded zip on your desired path on your pc.
 - Add the flutter directory on your <code>PATH</code> env eg. <code>your_path/flutter/bin</code> on the env variable PATH.
 - On your <code>CMD</code> try to run <code>flutter --version </code> if its working proceed to next step.
 - Open this repo through your IDE and <code>File > Settings > Plugins</code> search for <code>Flutter</code> and <code>Dart</code> and install it.
 - Run <code>flutter pub get</code> on your IDE terminal
 - Make sure to run first your Emulator or create a device emulator
 - Run the app through IDE

### Getting Started for MAC OS users
 - Download Flutter SDK and follow steps https://docs.flutter.dev/get-started/install/macos#get-sdk

## Project Setup

Clone Repo
```sh
git clone git@github.com:vananaz-systems/k-block.git
```

Update packages and dependencies
```sh
flutter pub get
```

## Run the main build

### Build and Run project via IDE
 - on Run > Run 'main.dart' <code></code>

### Build and Run project via CLI
 - Open simulator or device
 - Use command <code>flutter run</code>


## Run the Widgetbook

 This will create some UI/UX documentation for the app [See More](https://docs.widgetbook.io/widgetbook/overview)
- Run <code>flutter pub get</code> to get latest packages and dependencies
- Build app <code>flutter pub run build_runner build</code>
- On second terminal run <code>flutter pub run build_runner watch</code> so <code>package:build_runner</code> will listen for changes in the file system and update Widgetbook accordingly.
- Run the widgetbook <code>flutter run .\lib\src\app.widgetbook.dart</code>
- Select browser/emulator/ to preview widgetbook