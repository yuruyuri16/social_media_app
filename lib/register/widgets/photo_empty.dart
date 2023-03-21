import 'package:flutter/material.dart';

class PhotoEmpty extends StatelessWidget {
  const PhotoEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        CircleAvatar(
          child: Text(
            'Select an image',
            style: theme.textTheme.labelMedium,
          ),
        ),
        const Positioned(
          right: 0,
          bottom: 0,
          child: Icon(
            Icons.camera_alt,
            size: 30,
          ),
        ),
      ],
    );
  }
}
