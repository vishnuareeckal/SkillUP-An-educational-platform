import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class ListVideo extends StatefulWidget {
  const ListVideo({Key? key}) : super(key: key);

  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  List<String> videoList = [];
  List<String> subfolderList = [];
  String selectedSubfolder = '';

  @override
  void initState() {
    super.initState();
    // Fetch subfolders from 'files/videos/' directory
    fetchSubfolders();
  }

  Future<void> fetchSubfolders() async {
    try {
      var result = await firebase_storage.FirebaseStorage.instance
          .ref('files/videos/')
          .listAll();

      setState(() {
        subfolderList = result.prefixes.map((folder) {
          // Extract the subfolder name from the full path
          return folder.fullPath.split('/').last;
        }).toList();
      });

      // Fetch the video list for the initially selected subfolder
      if (subfolderList.isNotEmpty) {
        selectedSubfolder = subfolderList[0];
        fetchVideoList(selectedSubfolder);
      }
    } catch (e) {
      print('Error fetching subfolders: $e');
    }
  }

  Future<void> fetchVideoList(String subfolder) async {
    try {
      var result = await firebase_storage.FirebaseStorage.instance
          .ref('files/videos/$subfolder')
          .listAll();

      setState(() {
        videoList = result.items.map((item) => item.name).toList();
      });
    } catch (e) {
      print('Error fetching videos: $e');
    }
  }

  Future<void> deleteVideo(String videoName) async {
    try {
      // Delete video from Firebase Storage
      await firebase_storage.FirebaseStorage.instance
          .ref('files/videos/$selectedSubfolder/$videoName')
          .delete();

      // Delete corresponding document from Firestore
      await FirebaseFirestore.instance
          .collection('files')
          .doc(videoName)
          .delete();

      // Refresh the video list after deletion
      fetchVideoList(selectedSubfolder);

      // Show a SnackBar to indicate successful deletion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xff44AB42),
          content: Text('Video deleted successfully!'),
        ),
      );
    } catch (e) {
      print('Error deleting video: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xfff3f3f3),
        title: Text(
          "Videos uploaded",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Dropdown to select subfolder
          DropdownButton<String>(
            value: selectedSubfolder,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedSubfolder = newValue;
                  // Fetch the video list for the selected subfolder
                  fetchVideoList(selectedSubfolder);
                });
              }
            },
            items: subfolderList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // Your other widgets can go here if needed
          videoList.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                    itemCount: videoList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        indent: 16,
                        endIndent: 16,
                      ); // Add a divider between each item
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          videoList[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: Color(0xff040404),
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Color(0xff040404),
                          onPressed: () {
                            // Prompt user for confirmation before deletion if needed
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Delete Video'),
                                  content: Text(
                                      'Are you sure you want to delete this Video?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Delete the video and close the dialog
                                        deleteVideo(videoList[index]);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
