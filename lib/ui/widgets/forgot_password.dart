import 'package:flutter/material.dart';

import '../../util/value_validators.dart';
import 'custom_alert_dialog.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({
    super.key,
  });

  @override
  State<ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      isLoading: _isLoading,
      title: 'Forgot Password?',
      description:
          'Enter your registered email address to receive an email with passowrd reset link.',
      content: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              validator: emailValidator,
              enabled: !_isLoading,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
          ],
        ),
      ),
      primaryButton: 'CONFIRM',
      // onPrimaryPressed: () async {
      //   try {
      //     if (_formKey.currentState!.validate()) {
      //       _isLoading = true;
      //       setState(() {});
      //       await Supabase.instance.client.auth.resetPasswordForEmail(
      //         _emailController.text.trim(),
      //       );
      //       _isLoading = false;
      //       setState(() {});
      //       // ignore: use_build_context_synchronously
      //       Navigator.pop(context);
      //       // ignore: use_build_context_synchronously
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (_) => ResetPasswordScreen(
      //             email: _emailController.text.trim(),
      //           ),
      //         ),
      //       );
      //     }
      //   } catch (e) {
      //     _isLoading = false;
      //     setState(() {});
      //     if (e is AuthException) {
      //       await showDialog(
      //         context: context,
      //         builder: (context) => CustomAlertDialog(
      //           title: 'Failed!',
      //           description: e.message.toString(),
      //           primaryButton: 'OK',
      //         ),
      //       );
      //     } else {
      //       showDialog(
      //         context: context,
      //         builder: (context) => CustomAlertDialog(
      //           title: 'Failed!',
      //           description: e.toString(),
      //           primaryButton: 'OK',
      //         ),
      //       );
      //     }
      //   }
      // },
      secondaryButton: 'CANCEL',
    );
  }
}
