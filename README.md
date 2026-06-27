# AI ChatBot - Flutter AI Companion

A modern, responsive, and intelligent AI ChatBot built with Flutter. This application provides a seamless chat experience powered by the DeepSeek AI model via OpenRouter API.

## 🚀 Features

- **Splash Screen**: Professional entry animation and app branding.
- **Secure Login**: Authentication interface for user access.
- **AI-Powered Chat**: Real-time messaging with AI using `OpenRouter API`.
- **Responsive UI**: Clean and modern design optimized for both Android and iOS.
- **Auto-Scrolling**: Chat automatically scrolls to the latest message.
- **Environment Safety**: API keys are managed securely using `.env` files.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **API Integration**: [http](https://pub.dev/packages/http)
- **Environment Management**: [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- **Backend Service**: [OpenRouter API](https://openrouter.ai/) (DeepSeek V3 Model)

## 📁 Project Structure

```text
lib/
├── api/
│   └── api.dart          # API Service for AI communication
├── models/
│   └── message.dart      # Data model for chat messages
├── main.dart             # App entry point & initialization
├── splash_screen.dart    # Initial landing screen
├── home_screen.dart      # Login & Welcome screen
└── chat_screen.dart      # Main chat interface
```

## ⚙️ Setup & Installation

### Prerequisites

- Flutter SDK installed on your machine.
- Android Studio / VS Code with Flutter extensions.
- An API Key from [OpenRouter](https://openrouter.ai/).

### Steps to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Vinay-ops/AI-CHATBOT-FLUTTER-MOBILE-APP.git
   cd AI-CHATBOT-FLUTTER-MOBILE-APP/chatbot
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Environment Variables:**
   - Create a `.env` file in the `chatbot/` root directory.
   - Add your API key:
     ```env
     OPENROUTER_API_KEY=your_api_key_here
     ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## 📸 Screenshots

| Splash Screen | Login Screen | Chat Interface |
|---------------|--------------|----------------|
| ![Splash](assets/logo.png) | (Login UI) | (Chat UI) |

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the project.

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.
