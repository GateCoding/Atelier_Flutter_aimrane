import 'package:atelier4_aimrane_essakhi_iir5g7/liste_produits.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEcran extends StatelessWidget {
  const LoginEcran({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SignInScreen();
        }

        return const ListProduits();
      },
    );
  }
}
