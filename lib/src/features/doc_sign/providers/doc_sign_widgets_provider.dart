import 'package:flutter_riverpod/flutter_riverpod.dart';
List<String> userAddedWidgetsUID = [];
final userAddedWidgetsProvider = StateProvider<List<String>>((ref) => userAddedWidgetsUID);

