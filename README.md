# SmartHub: Weather & Expense Tracker

SmartHub is a Flutter application that combines a real-time weather display with a personal expense tracker. This project demonstrates the integration of external APIs, local data persistence, and state management in a Flutter environment.

## Features

-   **Current Weather Display**: Fetches and displays weather information for a specified city using the OpenWeatherMap API.
-   **Expense Tracking**: Allows users to add, view, and delete expenses, categorized for better management.
-   **Local Data Storage**: Persists expense data locally using `shared_preferences`.
-   **State Management**: Utilizes the `provider` package for efficient state management across the application.

## Technologies Used

-   Flutter SDK
-   Dart
-   `http` for API calls
-   `provider` for state management
-   `shared_preferences` for local data storage
-   `uuid` for generating unique IDs for expenses

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

-   Flutter SDK installed (version 3.0.0 or higher)
-   VS Code or another IDE with Flutter and Dart plugins

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/YOUR_USERNAME/SmartHub.git
    cd SmartHub
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Obtain an OpenWeatherMap API Key:**
    -   Go to [OpenWeatherMap](https://openweathermap.org/api)
    -   Sign up for a free account.
    -   Navigate to the API keys section and generate a new API key.

4.  **Configure API Key:**
    -   Open `lib/services/weather_service.dart`.
    -   Replace `YOUR_OPENWEATHERMAP_API_KEY` with your actual API key:
        ```dart
        static const String _apiKey = 'YOUR_OPENWEATHERMAP_API_KEY'; // Replace with your API key
        ```

### Running the App

1.  **Connect a device or start an emulator.**
2.  **Run the app:**
    ```bash
    flutter run
    ```

## Project Structure

```
lib/
├── main.dart
├── models/
│   ├── expense_model.dart
│   └── weather_model.dart
├── providers/
│   ├── expense_provider.dart
│   └── weather_provider.dart
├── screens/
│   ├── add_expense_screen.dart
│   └── dashboard_screen.dart
├── services/
│   ├── expense_service.dart
│   └── weather_service.dart
└── widgets/
    ├── expense_list.dart
    └── weather_display.dart
```

## Contributing

Feel free to fork the repository, create a new branch, and submit pull requests. Any contributions you make are greatly appreciated.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

-   [Flutter](https://flutter.dev/)
-   [OpenWeatherMap](https://openweathermap.org/)
-   [Provider Package](https://pub.dev/packages/provider)
-   [Shared Preferences Package](https://pub.dev/packages/shared_preferences)
-   [UUID Package](https://pub.dev/packages/uuid)
