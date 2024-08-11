import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool _obsecurePass = true;
  bool _obsecureConfirmPass = true;
  String _currentPassword = '';

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
                'Password',
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
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: GlobalColor.primary,
            obscureText: _obsecurePass,
            decoration: InputDecoration(
              hintText: '************',
              prefixIcon: const Icon(Icons.lock_outlined),
              prefixIconColor: GlobalColor.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obsecurePass = !_obsecurePass;
                  });
                },
                icon: _obsecurePass
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: GlobalColor.muted,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: GlobalColor.primary,
                      ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _formKey.currentState?.validate();
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid password';
              }
              setState(() {
                _currentPassword = value;
              });
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Confirm Password',
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
            controller: _confirmPassController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: GlobalColor.primary,
            obscureText: _obsecureConfirmPass,
            decoration: InputDecoration(
              hintText: '************',
              prefixIcon: const Icon(Icons.lock_outlined),
              prefixIconColor: GlobalColor.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obsecureConfirmPass = !_obsecureConfirmPass;
                  });
                },
                icon: _obsecureConfirmPass
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: GlobalColor.muted,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: GlobalColor.primary,
                      ),
              ),
            ),
            onChanged: (confirmValue) {
              setState(() {
                _formKey.currentState?.validate();
              });
            },
            validator: (confirmValue) {
              if (confirmValue == null || confirmValue.isEmpty) {
                return 'Confirm your password';
              } else if (confirmValue != _currentPassword) {
                return 'Password and confirm password do not match';
              }
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          AuthSubmitButton(
            title: Text(
        'Create New Password',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) {
                return;
              }
              _formKey.currentState!.save();
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
