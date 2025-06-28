# Reminder App 📱

A modern, feature-rich Flutter application for managing tasks and reminders with a beautiful UI and intuitive user experience.

![Reminder App](https://github.com/user-attachments/assets/7c34bf91-37b4-4df2-ad5b-f2f3bd4ca645)

## ✨ Features

- **Task Management**: Create, edit, and delete reminders
- **Priority Levels**: Set priority levels (Low, Medium, High, Urgent) with color coding
- **Search Functionality**: Search through your reminders quickly
- **Due Date Tracking**: Set due dates and get overdue notifications
- **Task Completion**: Mark tasks as complete with visual feedback
- **Modern UI**: Beautiful, responsive design with smooth animations
- **Cross-Platform**: Works on iOS, Android, Web, and Desktop

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (version 3.5.4 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/reminder_app.git
   cd reminder_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📱 App Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── reminder_model.dart   # Reminder data model
├── screens/
│   └── reminder_screen.dart  # Main app screen
├── widgets/
│   └── custom_button.dart    # Reusable button widget
├── theme.dart               # App theme and styling
└── assets/
    └── profile.jpg          # Profile image
```

## 🛠️ Dependencies

- **shared_preferences**: Local data storage
- **intl**: Date and time formatting
- **flutter_local_notifications**: Local notifications
- **uuid**: Unique ID generation
- **cupertino_icons**: iOS-style icons

## 🎨 Features in Detail

### Task Management
- Create new reminders with title, description, and priority
- Edit existing reminders
- Delete completed tasks
- Mark tasks as complete/incomplete

### Priority System
- **Low** (Green): Basic tasks
- **Medium** (Orange): Regular tasks
- **High** (Red): Important tasks
- **Urgent** (Purple): Critical tasks

### Search & Filter
- Real-time search through reminder titles
- Filter by completion status
- Sort by priority or due date

### Due Date Tracking
- Set due dates for reminders
- Visual indicators for overdue tasks
- Days until due calculation

## 🔧 Configuration

### Adding Custom Fonts
To add custom fonts, update the `pubspec.yaml`:

```yaml
fonts:
  - family: YourFont
    fonts:
      - asset: fonts/YourFont-Regular.ttf
      - asset: fonts/YourFont-Bold.ttf
        weight: 700
```

### Theme Customization
Modify `lib/theme.dart` to customize colors and styles:

```dart
class AppColors {
  static const Color primary = Colors.blue;
  static const Color accent = Colors.orange;
  // Add your custom colors
}
```

## 📸 Screenshots

The app features a clean, modern interface with:
- Header section with user profile
- Search bar for quick task finding
- Task list with priority indicators
- Bottom navigation bar
- Add task functionality

## 🚧 Future Enhancements

- [ ] Local notifications for due dates
- [ ] Data persistence with SQLite
- [ ] Cloud sync functionality
- [ ] Categories and tags
- [ ] Dark mode support
- [ ] Export/import functionality
- [ ] Recurring reminders
- [ ] Voice input for tasks

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Himanshu** - *Initial work* - [YourGitHub](https://github.com/yourusername)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI inspiration
- The open-source community for various packages

## 📞 Support

If you encounter any issues or have questions, please:
1. Check the [Issues](https://github.com/yourusername/reminder_app/issues) page
2. Create a new issue with detailed information
3. Contact the maintainer

---

**Made with ❤️ using Flutter**
