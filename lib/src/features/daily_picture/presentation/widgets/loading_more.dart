import 'package:flutter/material.dart';

class LoadingMore extends StatelessWidget {
  const LoadingMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
            ),
          ),
          Text('Loading more'),
        ],
      ),
    );
  }
}
