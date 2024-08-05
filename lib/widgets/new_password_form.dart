import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final _formKey = GlobalKey<FormState>();
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
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
        ],
      ),
    );
  }
}
