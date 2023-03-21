import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/register/register.dart';

class PhotoBottomSheet extends StatefulWidget {
  const PhotoBottomSheet({super.key});

  @override
  State<PhotoBottomSheet> createState() => _PhotoBottomSheetState();
}

class _PhotoBottomSheetState extends State<PhotoBottomSheet> {
  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: source);
    if (!mounted) return;
    if (image == null) return;
    final file = File(image.path);
    context.read<RegisterBloc>().add(RegisterPhotoSelected(file));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () async => _pickImage(ImageSource.camera),
              title: const Text('Take a photo'),
            ),
            ListTile(
              onTap: () async => _pickImage(ImageSource.gallery),
              title: const Text('Select from gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
