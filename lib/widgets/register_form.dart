import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  bool _obsecurePass = true;

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
                'Name',
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
            controller: _nameController,
            keyboardType: TextInputType.name,
            cursorColor: GlobalColor.primary,
            decoration: InputDecoration(
              hintText: 'Your Name',
              prefixIcon: const Icon(Icons.person_outlined),
              prefixIconColor: GlobalColor.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
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
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.email_outlined),
              prefixIconColor: GlobalColor.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
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
            decoration: InputDecoration(
              hintText: '************',
              alignLabelWithHint: true,
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {
                  value = !value!;
                },
              ),
              Row(
                children: [
                  Text(
                    'Agree with',
                    style: TextStyle(
                      color: GlobalColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Terms & Condition',
                    style: TextStyle(
                      color: GlobalColor.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
