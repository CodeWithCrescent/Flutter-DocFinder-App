import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/provider/auth_provider.dart';
import 'package:doc_finder/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _obsecurePass = true;
  bool isLoading = false;

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
            readOnly: isLoading ? true : false,
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
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
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
            readOnly: isLoading ? true : false,
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
              return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/forgot-password');
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: GlobalColor.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          AuthSubmitButton(
            title: isLoading
                ? SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: GlobalColor.white,
                      strokeWidth: 3,
                    ),
                  )
                : const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              final isValid = _formKey.currentState!.validate();
              if (!isValid) {
                setState(() {
                  isLoading = false;
                });
                return;
              }
              _formKey.currentState!.save();
              try {
                await Provider.of<AuthProvider>(context, listen: false).login(
                  _emailController.text,
                  _passController.text,
                  context,
                );
              } catch (e) {
                debugPrint(e.toString());
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Login Error'),
                    content: Text(e.toString()),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                      ),
                    ],
                  ),
                );
              } finally {
                setState(() {
                  isLoading = false;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
