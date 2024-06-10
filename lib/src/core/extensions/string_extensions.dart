extension StringExtensions on String {
  bool isUrl() {
    final urlPattern = RegExp(
      r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
      multiLine: false,
    );
    return urlPattern.hasMatch(this);
  }

  String removeAllBreakLines() {
    return replaceAll(RegExp(r'\n+(?=\S)'), '')
        .replaceAll(RegExp(r'\n+$'), '')
        .replaceAll(RegExp(r'(?<=\S)\r?\n(?=\S)'), ' ');
  }
}
