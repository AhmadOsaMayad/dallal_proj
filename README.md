# دلاّل | Dallal Real Estate App

> A production-oriented Flutter app for browsing, publishing, managing, and promoting real-estate listings — with AI-assisted price prediction.

---

## ✨ Overview

**دلاّل** is a feature-rich real-estate marketplace app built with Flutter, focused on Arabic-first UX and modular scalability.  
The project follows a **feature-based Clean Architecture** style with `data / domain / presentation` layers, **Cubit/BLoC** state management, and **GetIt** dependency injection.

Core capabilities include:
- User onboarding, registration, login, OTP verification, password reset/change
- Home feed with featured/all ads + banners
- Sections browsing (houses, apartments, lands, shops)
- Advanced filtering and search
- Ad details with like/favorite/report interactions
- Ad creation/editing with media upload
- Account management and profile editing
- Notifications + unread counters + mark-as-read
- Featured ad packages and package details
- Local AI service integration for price prediction

---

## 🧱 Architecture & Design

### Architectural style
- **Feature-first modular structure**
- **Clean Architecture-inspired layers**
  - `data`: models, data sources, repository implementations
  - `domain`: entities, repository contracts, use cases
  - `presentation`: views, widgets, cubits/states
- **Dependency Injection** via `get_it` (`lib/core/di/service_locator.dart`)
- **Navigation** via `go_router` (`lib/core/utils/app_router.dart`)
- **State Management** via `flutter_bloc` (Cubit-based)
- **Functional error flow** with `dartz` (`Either<Failure, T>`)

### Shared core
- `lib/core/api` → HTTP/Dio consumers + endpoint definitions
- `lib/core/common` → shared entities/models/use-case base classes
- `lib/core/errors` → failure and exception mapping
- `lib/core/shared` → reusable UI components/widgets
- `lib/core/theme` → design tokens/colors/text styles/themes
- `lib/core/utils` → router, helpers, app functions

---

## 📦 Tech Stack

- **Framework:** Flutter (Dart 3.x)
- **State:** flutter_bloc
- **Routing:** go_router
- **DI:** get_it
- **Networking:** http + dio
- **Local Storage:** hive + hive_flutter
- **Functional patterns:** dartz
- **Media & UI packages:** flutter_svg, cached_network_image, carousel_slider, shimmer, smooth_page_indicator
- **Native integrations:** image_picker, url_launcher
- **Code generation:** build_runner, hive_generator, flutter_gen_runner

---

## 🗂 Project Structure

```text
lib/
├── core/
│   ├── api/
│   ├── common/
│   ├── constants/
│   ├── di/
│   ├── errors/
│   ├── shared/
│   ├── theme/
│   └── utils/
├── features/
│   ├── splash / preview / preregister
│   ├── register_page / login_page / verification_page / verify_msg_page
│   ├── reset_password_page / change_password_page
│   ├── home_page / sections_page / selected_section_page
│   ├── details_page / favorite_page
│   ├── create_adv_page / edit_adv_info_page / featuring_adv_page
│   ├── my_account_page / more_page / notifications_page
│   ├── package_details_page / edit_personal_info
│   └── ai_price_prediction
├── gen/assets/   (flutter_gen generated)
└── main.dart
```

---

## 🚀 Getting Started

### 1) Prerequisites
- Flutter SDK (matching Dart SDK constraints in `pubspec.yaml`)
- Android Studio / Xcode (depending on target platform)
- A connected emulator/device

### 2) Install dependencies
```bash
flutter pub get
```

### 3) Generate code (if needed)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4) Run the app
```bash
flutter run
```

---

## ⚙️ Configuration Notes

### Backend API base URL
Defined in:
- `lib/core/constants/app_defs.dart` → `kDomainApp`

### AI price prediction service
Defined in:
- `lib/features/ai_price_prediction/data/data_source/ai_api_service.dart`

For real-device local testing, set your laptop local IP and run the AI server on:
```bash
python -m uvicorn main:app --reload --host 0.0.0.0 --port 8000
```
Detailed guide:
- `lib/features/ai_price_prediction/AI_CONNECTION_GUIDE.md`

---

## 🔀 Navigation Highlights

Main bottom navigation tabs:
- **Home**
- **Sections**
- **Create Ad**
- **My Account**
- **More**

Routing constants and route wiring are centralized in:
- `lib/core/utils/app_router.dart`

---

## 🧪 Quality Commands

```bash
flutter analyze
flutter test
```

---

## 🤝 Contributing

1. Create a feature branch
2. Keep changes scoped by module/layer
3. Run analyzer/tests before PR
4. Follow existing naming and architecture conventions

---

## 📌 Notes

- The app is **Arabic-first** in UX copy and labels.
- Several feature modules rely on authenticated access (token-based API calls).
- Local Hive boxes are initialized in `main.dart` for user/ad caching.

---

### Built with ❤️ using Flutter
