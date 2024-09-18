import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  UploadTask? task;
  @override
  Widget build(BuildContext context) {
    // final fileName = file != null ? basename(file!.path) : 'no file selected';
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {},
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
            //  Text(fileName),
            SizedBox(
              height: 10,
            ),
            Center(
              child: GestureDetector(
                onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
