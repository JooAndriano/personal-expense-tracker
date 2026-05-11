# Personal Expense Tracker

A modern Flutter-based personal expense tracking application built for a technical assessment. The application focuses on clean architecture, smooth user experience, local-first persistence, and maintainable feature-based structure.

---

# Overview

Personal Expense Tracker allows users to:

* Add expenses
* Edit expenses
* Delete expenses
* Search expenses
* Filter by category
* Sort expenses
* Manage profile information
* Upload profile image
* Persist data locally

The application is designed with a simple and modern mobile-first UI while maintaining clean and scalable engineering practices.

---

# Screenshots

## Expense List

![Expense List](screenshoot/photo_2026-05-12_00-29-39.jpg)

---

## Add Expense

![Add Expense](screenshoot/photo_2026-05-12_00-29-41.jpg)

---

## Profile Bottom Sheet

![Profile Bottom Sheet](screenshoot/photo_2026-05-12_00-29-43.jpg)

---

# Tech Stack

| Technology        | Purpose                                       |
| ----------------- | --------------------------------------------- |
| Flutter           | Cross-platform application framework          |
| GetX              | State management, navigation, and reactive UI |
| GetStorage / Hive | Local persistence                             |
| Flutter Slidable  | Swipe actions for edit/delete                 |
| Image Picker      | Profile image upload                          |
| Intl              | Currency and date formatting                  |

---

# Why Flutter?

Flutter was chosen because it provides:

* Fast development speed
* Excellent UI rendering performance
* Consistent cross-platform behavior
* Rich widget ecosystem
* Strong support for responsive mobile UI
* Easy maintainability for scalable applications

For this technical assessment, Flutter is highly suitable because it allows rapid development while still maintaining production-quality UI and architecture.

Flutter also enables:

* Smooth animations
* High-performance rendering
* Consistent design implementation
* Clean component-based UI structure

---

# Why GetX?

GetX was chosen because it provides:

* Lightweight state management
* Simple reactive programming
* Fast development workflow
* Minimal boilerplate
* Integrated navigation and dependency management

For this project scope, GetX is ideal because:

* The application is relatively small to medium scale
* Reactive UI updates are needed
* Development speed is important
* Clean structure is required without unnecessary complexity

GetX helps keep the codebase:

* Readable
* Scalable
* Maintainable
* Efficient

without introducing enterprise-level over-engineering.

---

# Why Hive / Local Storage?

Hive and local storage were chosen because this application is designed as a local-first expense tracker.

Reasons:

* Fast local data access
* Offline-first capability
* No backend dependency
* Lightweight persistence
* Simple implementation
* Good Flutter integration

Using local storage is appropriate for this assessment because:

* Expense data does not require server synchronization
* The application should work instantly offline
* Simplicity and reliability are prioritized

Local persistence is used for:

* Expense data
* Profile information
* Profile image path

---

# Features

## Expense Management

* Create expense
* Edit expense
* Delete expense
* Swipe actions
* Validation handling
* Success and error feedback

---

## Search, Filter, and Sorting

* Realtime search
* Category filtering
* Sort by newest
* Sort by oldest
* Sort by highest amount
* Sort by lowest amount

---

## Profile Management

* Edit profile name
* Edit profile email
* Upload profile image
* Persistent profile data

---

## UX Improvements

* Empty state handling
* No result state
* Keyboard-safe bottom sheet
* Delete confirmation sheet
* Responsive layout
* Category-specific icons
* Snackbar feedback

---

# Architecture

The project uses a feature-based structure with GetX.

## Folder Structure

```text
lib/
├── app/
│   ├── constants/
│   ├── routes/
│   ├── themes/
│
├── core/
│   ├── components/
│   ├── extensions/
│   ├── services/
│   ├── utils/
│
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
│
├── features/
│   ├── add_expense/
│   ├── expense_list/
│   └── profile/
    └── shared/
│
├── main.dart
```

---

# State Management

The application uses reactive state management with GetX.

Benefits:

* Efficient UI updates
* Simple reactive flows
* Reduced boilerplate
* Better separation between UI and logic

Controllers are responsible for:

* Business logic
* State updates
* Data interaction
* Filtering and sorting

Views are responsible for:

* Rendering UI
* Observing reactive state
* Triggering actions

---

# Local Persistence Flow

The application stores all data locally.

Flow:

```text
UI
→ Controller
→ Repository
→ Local Data Source
→ Local Storage
```

This structure improves:

* Separation of concerns
* Maintainability
* Scalability
* Testability

---

# Validation Strategy

Validation is implemented for:

* Empty title
* Invalid amount
* Zero amount

User feedback is provided using snackbar notifications.

---

# UI/UX Considerations

Several UX improvements were implemented:

* Swipe-to-action gestures
* Search and filtering
* Confirmation before deletion
* Keyboard-safe forms
* Empty states
* Consistent spacing and radius
* Responsive mobile layout
* Category-based visual indicators

The application prioritizes usability and clarity while keeping the UI minimal and modern.

---

# Setup

## Install Dependencies

```bash
flutter pub get
```

---

## Run Application

```bash
flutter run
```

---

# Future Improvements

Potential future improvements:

* Expense statistics and charts
* Cloud synchronization
* Authentication
* Export to PDF/CSV
* Budget planning
* Dark mode
* Unit testing
* Widget testing

---

# Conclusion

This project was built to demonstrate:

* Flutter development skills
* Clean architecture practices
* State management understanding
* Local persistence implementation
* UI/UX awareness
* Practical engineering decisions

The application intentionally avoids unnecessary complexity while still maintaining production-like structure and maintainability.
