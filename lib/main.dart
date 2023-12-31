import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'spudly_app.dart';

void main() async {
  await dotenv.load();

  runApp(const ProviderScope(
    child: spudlyApp(),
  ));
}
