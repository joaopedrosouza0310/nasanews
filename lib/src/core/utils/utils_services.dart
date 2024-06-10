import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nasanews/src/core/core.dart';
import 'package:path_provider/path_provider.dart';

abstract class UtilsServices {
  Future<File?> downloadImage(String url);
}

@Injectable(as: UtilsServices)
class UtilsServicesImpl implements UtilsServices {
  final DefaultLogger _logger;

  UtilsServicesImpl(this._logger);

  @override
  Future<File?> downloadImage(String url) async {
    try {
      final dio = getIt<Dio>();

      final directory = await getTemporaryDirectory();

      final filePath = '${directory.path}/${UniqueKey().toString()}.jpg';

      await dio.download(url, filePath);

      return File(filePath);
    } catch (e) {
      _logger.error('Falha ao baixar a imagem: $e');
      return null;
    }
  }
}
