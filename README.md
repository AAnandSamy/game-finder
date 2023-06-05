# Game Finder

Game finder help you to find sport for your game and stay conencetd with your team.

## Getting Started

### Developer setup

- [Install flutter SDK ](https://docs.flutter.dev/get-started/install)
- [Install android studio ](https://developer.android.com/studio)
- [Editor setup ](https://docs.flutter.dev/get-started/editor?tab=vscode)

## Tech Overview

Application based on MVC architecture, Firebase act as BASS(back-end-as-service-layer).

### Project Structure

```
.
├── android                         - contains files and folders required for running the application on an Android operating system.
├── ios                             - contains files required by the application to run the dart code on iOS platforms.
├── web                             - contains files required by the application to run the dart code on Chrome/Web platforms.
├── assets                          - contains all images and fonts of your application.
├── lib                             - Most important folder in the project, used to write most of the Dart code.
    ├── main.dart                   - starting point of the application
    ├── models
    │   ├── req/res.dart            - contains request/response models  
    │   ├── constants               - contains all constants classes
    │   ├── errors                  - contains error handling classes                  
    │   └── network                 - contains network related classes
    │   
    ├── view
    │   ├── theme                   - contains app theme and decoration classes 
    │   ├── componets               - contains UI elements/chips/icons/decoration classes
    │   └── localization            - contains localization classes
    ├────── screens                 - contains all screens 
    ├── controller                  - contains all controllers class 
    │   ├── service                 - contains request/response service impl
    │   ├── constants               - contains all constants classes
    │   └── utils                   - contains common files and utilities of project
    
```




This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Material-3](https://github.com/flutter/flutter/issues/91605)
- [Color roles](https://m3.material.io/styles/color/the-color-system/color-roles)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
