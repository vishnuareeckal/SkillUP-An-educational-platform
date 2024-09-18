import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key? key}) : super(key: key);

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  File? selectedFile;
  String? fileName;
  firebase_storage.UploadTask? task;
  double uploadProgress = 0.0;
  String? selectedFolder;
  List<String> subfolders = [];
  List<String> videoList = [];

  @override
  void initState() {
    super.initState();
    fetchSubfolders();
  }

  @override
  void dispose() {
    task?.cancel(); // Cancel the file upload task if it's still in progress
    super.dispose();
  }

  Future<void> fetchSubfolders() async {
    try {
      firebase_storage.ListResult result = await firebase_storage
          .FirebaseStorage.instance
          .ref('files/videos/')
          .list();

      setState(() {
        subfolders = result.prefixes
            .map((prefix) => prefix.name.split('/').last)
            .toList();

        selectedFolder = subfolders.isNotEmpty ? subfolders.first : null;
        fetchVideoList();
      });
    } catch (e) {
      print('Error fetching subfolders: $e');
    }
  }

  Future<void> fetchVideoList() async {
    try {
      if (selectedFolder != null) {
        firebase_storage.ListResult result = await firebase_storage
            .FirebaseStorage.instance
            .ref('files/videos/$selectedFolder/')
            .list();

        setState(() {
          videoList =
              result.items.map((item) => item.name.split('/').last).toList();
        });
      }
    } catch (e) {
      print('Error fetching video list: $e');
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
    );

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
        fileName = result.files.single.name;
      });
    }
  }

  Future<void> uploadFile() async {
    if (selectedFile == null || selectedFolder == null) {
      return;
    }

    String folderPath = 'files/videos/$selectedFolder/';
    String filePath = '$folderPath$fileName';

    firebase_storage.Reference storageReference =
        firebase_storage.FirebaseStorage.instance.ref().child(filePath);

    task = storageReference.putFile(selectedFile!);

    task!.snapshotEvents.listen((firebase_storage.TaskSnapshot snapshot) {
      double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
      setState(() {
        uploadProgress = progress;
      });
      print('Upload in progress: $progress%');
    });

    try {
      await task!.whenComplete(() {
        print('Upload complete');
        setState(() {
          fileName = null;
          uploadProgress = 0.0;
        });
        fetchVideoList();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xff44AB42),
          content: Text('File uploaded successfully!'),
        ),
      );
    } on firebase_storage.FirebaseException catch (e) {
      print('Error during file upload: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xffDA1E37),
          content: Text('Error during file upload. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xfff3f3f3),
        title: Text(
          'Upload Video',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  await fetchSubfolders();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Select Folder'),
                        content: DropdownButton<String>(
                          value: selectedFolder,
                          items: subfolders
                              .map<DropdownMenuItem<String>>((String folder) {
                            return DropdownMenuItem<String>(
                              value: folder,
                              child: Text(folder),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedFolder = value;
                              fetchVideoList();
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Color(0xff4361ee),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Select folder',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Color(0xff4361ee),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            if (selectedFolder != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Selected Folder: $selectedFolder'),
              ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: pickFile,
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Color(0xff4361ee),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Select file',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Color(0xff4361ee),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            if (fileName != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Selected File: $fileName'),
              ),
            SizedBox(height: 10),
            if (task != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: LinearProgressIndicator(
                  minHeight: 4,
                  borderRadius: BorderRadius.circular(50),
                  value: uploadProgress / 100,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff44AB42)),
                ),
              ),
            if (task != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                    'Upload Progress: ${uploadProgress.toStringAsFixed(2)}%'),
              ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: uploadFile,
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff4361ee),
                  ),
                  child: Center(
                    child: Text(
                      'Upload file',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
