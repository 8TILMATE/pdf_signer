import 'package:flutter_riverpod/flutter_riverpod.dart';
String? currentFilePath;
final pickedFileProvider = StateProvider<String?>((ref) => currentFilePath);
