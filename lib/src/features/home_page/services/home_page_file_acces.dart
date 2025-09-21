import 'dart:io';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf_signer/src/features/home_page/providers/home_provider.dart';

class FileManager
{
  
  Future<void> pickFile(WidgetRef ref) async {
    FilePicker filePicker = FilePicker.platform;
    final result = await filePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf']
    );
    currentFilePath = result?.files.first.path;
    ref.read(pickedFileProvider.notifier).state = currentFilePath; 
  }

  Future<void> saveFile(String fileName) async {
    final directory = await getDownloadsDirectory();
    final path = directory?.path;
    final file = File('$path/$fileName');
     }

}