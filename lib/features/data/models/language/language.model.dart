import 'package:flutter/material.dart';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  indonesia(
    Locale('id', 'ID'),
    'Bahasa Indonesia',
  );

  /// Add another languages support here
  const Language(this.value, this.text);

  final Locale value;
  final String text; // Optional: this properties used for ListTile details
}
