import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class inicio extends StatelessWidget {
  final User user;
  inicio({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user.photoURL != null)
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(user.photoURL!),
              )
            else
              CircleAvatar(
                radius: 80,
                child: Icon(Icons.person, size: 50),
              ),
            SizedBox(height: 15),
            Container(
                alignment: Alignment.center,
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Text(
                    user.displayName ?? 'Usuário',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                    )
                )
            ),
            SizedBox(height: 15),
            Container(
                alignment: Alignment.center,
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Text(user.email ?? 'Email',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ))
            ),
            SizedBox(height: 50),
            IconButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}