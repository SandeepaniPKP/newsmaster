# NewsMaster

NewsMaster is a Flutter-based mobile application that provides categorized news updates from around the globe. Users can explore news in various categories like Business, Entertainment, Health, Sports, Technology, and more. The app also includes functionality to save articles for later reading and features a user-friendly design for seamless browsing.

## Features

- **Categorized News**: Access news articles in categories such as Business, Entertainment, General, Health, Science, Sports, and Technology.
- **Saved News**: Bookmark articles for later reading and access them anytime.
- **Search Functionality**: Search for specific news articles using keywords.
- **Responsive UI**: A clean and visually appealing user interface optimized for various screen sizes.
- **Welcome Screen**: A one-time welcome screen for new users, which does not reappear upon subsequent launches.
- **State Management**: Persistent storage for saved articles and the welcome screen state without third-party state management libraries.

## Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (>= 3.0)
- Android Studio or any IDE for Flutter development

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/newsmaster.git
   ```

2. Navigate to the project directory:
   ```bash
   cd newsmaster
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Add your [News API](https://newsapi.org/) key:
   - Open `home.dart`.
   - Replace `YOUR_API_KEY_HERE` with your actual API key.

   Example:
   ```dart
   final String apiKey = 'YOUR_API_KEY_HERE';
   ```

5. Run the application:
   ```bash
   flutter run
   ```

## Folder Structure

- `lib/`
  - `home.dart`: The main screen showing categories and saved news.
  - `category.dart`: Displays news articles in a specific category.
  - `welcome_screen.dart`: The welcome screen shown on the first app launch.
  - `main.dart`: The app's entry point.

## Permissions

The following permissions are required for the app to function properly:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
```

Make sure these permissions are added in `android/app/src/main/AndroidManifest.xml`.

## Notes

- **API Key**: The `home.dart` file does not include an API key by default for security reasons. You must add your own API key before running the app.
- **Persistent Storage**: The app uses a simple mechanism to store saved articles and manage the welcome screen state without relying on third-party plugins.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or issues, feel free to open an issue or reach out to [your_email@example.com](mailto:ranaweera.paba97@gmail.com).

