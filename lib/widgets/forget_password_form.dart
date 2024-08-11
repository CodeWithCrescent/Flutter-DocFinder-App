import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: TextStyle(
                  color: GlobalColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 75),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: GlobalColor.primary,
            decoration: InputDecoration(
              hintText: 'example@gmail.com',
              prefixIcon: const Icon(Icons.email_outlined),
              prefixIconColor: GlobalColor.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _formKey.currentState?.validate();
              });
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                return 'Enter a valid email!';
              }
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          AuthSubmitButton(
            title: Text(
              'Send Reset Code',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) {
                return;
              }
              _formKey.currentState!.save();
              Navigator.of(context).pushNamed('/verify-code');
            },
          ),
        ],
      ),
    );
  }
}
