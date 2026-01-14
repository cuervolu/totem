// lib/core/utils/platform_utils.dart
import 'dart:io';
import 'package:flutter/foundation.dart';

bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);
bool get isDesktop =>
    !kIsWeb && (Platform.isLinux || Platform.isWindows || Platform.isMacOS);
