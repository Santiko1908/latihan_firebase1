import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 25),

            ClipOval(
              child: Image.asset(
                'assets/images/profile.jpeg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.35),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'User Profile',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.blue),
                    title: const Text('Email'),
                    subtitle: Text(user?.email ?? '-'),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.fingerprint, color: Colors.blue),
                    title: const Text('User ID'),
                    subtitle: Text(user?.uid ?? '-'),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(
                      Icons.verified_user,
                      color: Colors.blue,
                    ),
                    title: const Text('Email Verification'),
                    subtitle: Text(
                      user?.emailVerified == true
                          ? 'Terverifikasi'
                          : 'Belum terverifikasi',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  if (!context.mounted) return;

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
