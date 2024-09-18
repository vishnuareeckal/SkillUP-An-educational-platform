import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:url_launcher/url_launcher.dart';

class vDownload extends StatefulWidget {
  const vDownload({Key? key}) : super(key: key);

  @override
  _vDownloadState createState() => _vDownloadState();
}

class _vDownloadState extends State<vDownload> {
  List<String> videoList = [];
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    fetchPdfList();
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  Future<void> fetchPdfList() async {
    try {
      var result = await firebase_storage.FirebaseStorage.instance
          .ref('files/videos/python')
          .listAll();

      if (_isMounted) {
        setState(() {
          videoList = result.items.map((item) => item.name).toList();
        });
      }
    } catch (e) {
      if (_isMounted) {
        print('Error fetching videos: $e');
        // Handle error (e.g., show an error message)
      }
    }
  }

  Future<void> downloadPdf(String fileName) async {
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref('files/videos/python/$fileName');
      final String url = await ref.getDownloadURL();

      // Open the URL in a browser
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error downloading videos: $e');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error downloading video'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
        foregroundColor: Color(0xfff3f3f3),
      ),
      body: videoList.isNotEmpty
          ? ListView.builder(
              itemCount: videoList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/images/Python.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              color: Color(0xfff3f3f3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  videoList[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff040404),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 12),
                                GestureDetector(
                                  onTap: () {
                                    downloadPdf(videoList[index]);
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xff4361ee),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Download',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter',
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
