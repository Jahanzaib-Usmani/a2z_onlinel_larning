import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountScreenView extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(_auth.currentUser?.photoURL ?? ''),
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Favourite', style: TextStyle(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            title: Text('Edit Account', style: TextStyle(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            title: Text('Settings', style: TextStyle(fontSize: 18)),
            onTap: () {},
          ),
          ListTile(
            title: Text('Privacy', style: TextStyle(fontSize: 18)),
            onTap: () {},
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                await _signOut(context);
              },
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await _auth.signOut();

      // If using Google Sign-In, sign out from Google as well
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }

      Navigator.popUntil(context, (route) => false);
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
