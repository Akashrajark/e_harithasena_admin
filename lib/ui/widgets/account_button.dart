import 'package:e_harithasena_admin/ui/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import 'custom_alert_dialog.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          Text(
            'ADMIN',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: appBarIconColor,
                ),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'LOGOUT?',
                  description: 'Are you sure you want to logout?',
                  primaryButton: 'LOGOUT',
                  onPrimaryPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  secondaryButton: 'NO',
                ),
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
              size: 20,
              color: appBarIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
