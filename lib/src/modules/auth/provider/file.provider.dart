import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fileProvider =
    NotifierProviderFamily<FileProvider, File?, String>(FileProvider.new);

class FileProvider extends FamilyNotifier<File?, String> {
  @override
  File? build(String arg) => null;
  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'jpg', 'png', 'webp'],
    );
    if (result?.files == null) return;
    final imageFile = File(result!.files.first.path!);
    state = imageFile;
  }

  void removeImage() => state = null;
}
