# waste_managament

## I. Introduction
I’m Android Developer and I’m working in a software company in Vietnam. I have experience in both kind project: outsourcing project and product project. I decided to study Flutter, because I believe it’s promised in future. As experienced developer, I care about clean architecture, testing, performance and maintainability that why I keep searching for an example of completed application. Unfortunately, community now full of project such as speedcode, UI challenges, … it’s just small pieces of real world application. In fact, most of the project doesn’t have fancy UI like that.
That why I build this project by myself and now share it to the community, I hope you can get something from it then apply to your work.

The first version of project (v1.0) is just about UI + simple logic. In this version v2.0, I applied BloC pattern by using Flutter Bloc to project and also have unit tests for it. I also built simple Mock API for the app, it just static json file uploaded to a my private hosting. I hope I have time to do cache local data by SQLite but I have not, so hope next version will be soon available.


### 🏗️ Application architecture (Flutter Clean Bloc Architecture)

The project follows a Clean Architecture approach combined with BLoC (Business Logic Component) for efficient state management.

This structure ensures scalability, testability, and maintainability, making it easier to develop and expand the app over time 🔄.

```Console

├───common                               # Shared utilities and reusable components
│   ├───bloc                             # Global state management using BLoC
│   │   ├───authentication               # Authentication BLoC (for Know has login before)
│   │   └───theme                        # Theme management BLoC
│   ├───helpers                          # Helper functions and utilities
│   └───widgets                          # Reusable Custom UI components
│       ├───appbar         
│       ├───button         
│       ├───footer                 
│       ├─── ...
├───core                                 # Core functionality and configurations
│   ├───api                              # API-related functionalities
│   ├───configs                          # Application-wide configurations
│   │   ├───assets                       # Asset management
│   │   └───theme                        # Theme settings (Color font)
│   ├───constants                        # Constant values
│   ├───enum                             # Enum definitions
│   ├───local                            # Local storage management
│   └───usecase           
├───data                                 # Data layer (models, repositories, data sources)
│   ├───models                           # Data models (DTO)
│   │   ├───auth          
│   │   ├───booking       
│   │   ├───cast          
│   │   ├───cinema        
│   │   ├─── ...     
│   ├───repository                       # Repository layer for data fetching
│   │   ├───all_movie     
│   │   ├───auth          
│   │   ├───authentication 
│   │   ├─── ...     
│   └───sources                          # Data sources (API, local storage, etc.)
│       ├───all_movie   
│       ├───auth          
│       ├───authentication 
│       ├─── ...       
├───domain                               # Domain layer (business logic, entities, use cases)
│   ├───entities                         # Core business entities ()
│   │   ├───auth          
│   │   ├───booking      
│   │   ├───cast        
│   │   ├───cinema        
│   │   ├─── ...    
│   ├───repository                       # Abstract repository interfaces
│   │   ├───all_movie    
│   │   ├───auth         
│   │   ├───authentication 
│   │   ├─── ...     
│   │   └───tickets       
│   └───usecase                          # Business logic use cases
│       ├───all_movie    
│       ├───authentication 
│       ├───booking_time  
│       ├─── ...        
└───presentation                         # Presentation layer (UI and state management)
    ├───about_page                       # About screen
    │   ├───bloc                         # BLoC for About page
    │   └───widgets                      # UI components
    ├───all_movies       
    │   ├───bloc         
    │   └───widgets     
    ├───all_tickets          
    ├───booking          
    │   ├───booking_seat_slot 
    │   ├───booking_seat_type 
    │   ├───booking_time_slot 
    │   └───model        
    ├───home                 
    ├───intro            
    ├───login                 
    ├───movie_detail     
    ├───register         
    ├───splash     

```      
## V. Design credit
## Development Environment
`flutter doctor -v`
```
[√] Flutter (Channel stable, 2.8.1, on Microsoft Windows [Version 10.0.19043.1586], locale en-US)
    • Flutter version 2.8.1 at C:\src\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision 77d935af4d (3 months ago), 2021-12-16 08:37:33 -0800
    • Engine revision 890a5fca2e
    • Dart version 2.15.1

[!] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
    • Android SDK at C:\Users\ASUS\AppData\Local\Android\sdk
    X cmdline-tools component is missing
      Run `path/to/sdkmanager --install "cmdline-tools;latest"`
      See https://developer.android.com/studio/command-line for more details.
    X Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/docs/get-started/install/windows#android-setup for more details.

[√] Chrome - develop for the web
    • Chrome at C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

[√] Android Studio (version 3.1)
    • Android Studio at C:\Program Files\Android\Android Studio
    • Flutter plugin version 29.0.1
    • Dart plugin version 173.4700
    • Java version OpenJDK Runtime Environment (build 1.8.0_152-release-1024-b02)

[√] Android Studio (version 3.5)
    • Android Studio at C:\Program Files\Android\android-studio
    • Flutter plugin version 42.1.1
    • Dart plugin version 191.8593
    • Java version OpenJDK Runtime Environment (build 1.8.0_202-release-1483-b03)

[√] Android Studio (version 3.6)
    • Android Studio at C:\Program Files\Android\AS33
    • Flutter plugin version 49.0.1
    • Dart plugin version 192.8052
    • Java version OpenJDK Runtime Environment (build 1.8.0_212-release-1586-b04)

[√] IntelliJ IDEA Community Edition (version 2020.3)
    • IntelliJ at C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2020.3.1
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart

[√] IntelliJ IDEA Ultimate Edition (version 2021.1)
    • IntelliJ at C:\Program Files\JetBrains\IntelliJ IDEA 2021.1
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart

[√] VS Code (version 1.65.0)
    • VS Code at C:\Users\ASUS\AppData\Local\Programs\Microsoft VS Code
    • Flutter extension can be installed from:
       https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

[√] Connected device (3 available)
    • sdk gphone x86 (mobile) • emulator-5554 • android-x86    • Android 11 (API 30) (emulator)
    • Chrome (web)            • chrome        • web-javascript • Google Chrome 99.0.4844.74
    • Edge (web)              • edge          • web-javascript • Microsoft Edge 98.0.1108.62

! Doctor found issues in 1 category.

```

Before run project, execute commands:
- `flutter clean`
- `flutter pub get`
- `flutter pub run build_runner build` or `flutter pub run build_runner build --delete-conflicting-outputs`
- `flutter run` (if needed)

## Support
- If you wanna get updates in next version, please give me a ⭐ to the repo 👍
- If you love my work and want to support. Thank you so much 👍
## Credits 🏆

Inspired by [ChungThanhDe/cinema-booking](https://github.com/ChunhThanhDe/cinema-booking.git)

I have reused part of the `UI idea` and `Data Mock` from this project.

## License

Feel free to use my code on your project. It would be great if you put a reference to this repository.