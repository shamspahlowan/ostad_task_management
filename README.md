# Task Management

A cross-platform Flutter application for managing tasks efficiently. This app provides features for creating, updating, tracking, and organizing tasks with various statuses. It is designed for mobile and desktop platforms.

## Features
- **Task CRUD**: Create, update, and delete tasks
- **Status Tracking**: Tasks can be marked as New, In Progress, Completed, or Cancelled
- **Dashboard**: View tasks by status and overall progress
- **Authentication**: Login and user session management
- **Persistent Storage**: Uses shared preferences for local data
- **Modern UI**: Custom themes, navigation, and responsive design
- **Sample Data**: Preloaded tasks for demonstration

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart 3.9.2 or higher

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/shamspahlowan/ostad_task_management.git
   cd ostad_task_management
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```

## Project Structure
- `lib/`
  - `main.dart`: Entry point
  - `app.dart`: App theme and navigation
  - `auth/`: Authentication logic and UI
  - `dashboard/`: Main dashboard and task views
  - `shared/`: Models, utilities, sample data
  - `util/`: Helper functions and constants
- `assets/images/`: App images
- `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/`: Platform-specific code

## Dependencies
- `flutter`, `cupertino_icons`, `flutter_svg`, `google_fonts`, `path_provider`, `http`, `logger`, `shared_preferences`

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License.
