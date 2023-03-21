import 'dart:io';

import 'package:flutter/material.dart';

class PhotoSelected extends StatelessWidget {
  const PhotoSelected({
    required this.photo,
    super.key,
  });

  final File photo;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(photo.path),
    );
  }
}
