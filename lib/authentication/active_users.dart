import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActiveUser extends StatelessWidget {
  const ActiveUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xfff3f3f3),
        elevation: 0,
        title: Text(
          'Active users',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
          ),
        ),
      ),
      body: FirestoreDataDisplay(),
    );
  }
}

class FirestoreDataDisplay extends StatelessWidget {
  Future<void> deleteUser(String userId, String email) async {
    try {
      // Find user by email
      User? userToDelete =
          (await FirebaseAuth.instance.fetchSignInMethodsForEmail(email))
                  .isEmpty
              ? null
              : FirebaseAuth.instance.currentUser;

      // Delete user from Authentication
      if (userToDelete != null) {
        await userToDelete.delete();
      }

      // Delete user data from Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).delete();
    } catch (e) {
      // Handle error
      print("Error deleting user: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<DocumentSnapshot> documents = snapshot.data!.docs;

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> data =
                documents[index].data() as Map<String, dynamic>;

            return Column(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Name: ${data['firstName']} ${data['lastName']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        color: Color(0xff040404),
                      ),
                    ),
                  ),
                  subtitle: Text('Email: ${data['email']}'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Color(0xff040404),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Delete User'),
                            content: Text(
                              'Are you sure you want to delete this user?',
                              style:
                                  TextStyle(fontFamily: 'Inter', fontSize: 16),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await deleteUser(
                                      documents[index].id, data['email']);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Color(0xffDA1E37)),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  endIndent: 16,
                  indent: 16,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
