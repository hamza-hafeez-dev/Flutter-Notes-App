# Flutter ListView Notes App 📝

A small Notes app built with Flutter while practicing different `ListView` variations.

This project helped me understand how Flutter handles dynamic lists and how to build simple functionality around them.

## 📱 Preview

![Notes App Preview](preview/notes-app.png)

## 🚀 What I Practiced

- `ListView.builder`
- `ListView.separated`
- Adding notes
- Deleting notes
- `TextEditingController`
- `FocusNode`
- Dialogs
- Basic Flutter state management

## ✨ Features

### Add Notes

Users can add a new note using a simple dialog with:

- Title field
- Subtitle field
- Add button

### Delete Notes

Each note has a delete button that removes it from the list dynamically.

### Empty State

When all notes are deleted, the app displays an empty state instead of showing a blank screen.

### Smooth Form Navigation

I also used `FocusNode` to improve the note form.

When pressing **Enter** on the title field, the focus moves directly to the subtitle field.

A small detail, but it makes the form feel smoother.

## 📚 ListView Concepts

This project was mainly built to practice three important Flutter list widgets:

### ListView

Used for displaying a simple scrollable list.

### ListView.builder

Useful when working with dynamic lists because items are built when they are needed.

### ListView.separated

Similar to `ListView.builder`, but also makes it easy to add separators between items.

## 🛠️ Built With

- Flutter
- Dart
- Material Design

## 🎯 Purpose

This is a learning project created while practicing Flutter's `ListView` widgets.

The goal was not just to create a UI, but to understand how lists work in Flutter and use them in a small real-world style feature.

Still learning, still building — one concept at a time. 🚀
