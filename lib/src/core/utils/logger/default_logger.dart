import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'i_default_logger.dart';

@injectable
class DefaultLogger implements IDefaultLogger {
  final Logger logger;

  DefaultLogger({
    required this.logger,
  });

  @override
  void error(String message) {
    if (kDebugMode) logger.e(message);
  }

  @override
  void info(String message) {
    if (kDebugMode) logger.i(message);
  }

  @override
  void waning(String message) {
    if (kDebugMode) logger.w(message);
  }
}
