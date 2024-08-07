import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/submit_button.dart';
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
  bool _obscurePass = true;
  bool _agreedTermsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name Field
          _buildInputField(
            label: 'Name',
            controller: _nameController,
            keyboardType: TextInputType.name,
            hintText: 'Your Name',
            icon: Icons.person_outlined,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid username';
              }
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),

          // Email Field
          _buildInputField(
            label: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'example@gmail.com',
            icon: Icons.email_outlined,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),

          // Password Field
          Text(
            'Password',
            style: TextStyle(
              color: GlobalColor.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 75),
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscurePass,
            cursorColor: GlobalColor.primary,
            decoration: InputDecoration(
              hintText: '************',
              prefixIcon: Icon(Icons.lock_outlined, color: GlobalColor.primary),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePass
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: _obscurePass ? GlobalColor.muted : GlobalColor.primary,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePass = !_obscurePass;
                  });
                },
              ),
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
              if (value == null || value.isEmpty) {
                return 'Enter a valid password';
              }
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),

          // Terms and Conditions Checkbox
          FormField<bool>(
            initialValue: _agreedTermsAndConditions,
            validator: (value) {
              if (value == null || !value) {
                return 'Please accept the terms and conditions to continue';
              }
              return null;
            },
            builder: (FormFieldState<bool> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    title: Row(
                      children: [
                        Text(
                          'Accept',
                          style: TextStyle(
                            color: GlobalColor.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Terms and Conditions',
                          style: TextStyle(
                            color: GlobalColor.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    value: state.value,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _agreedTermsAndConditions = newValue ?? false;
                        state.didChange(_agreedTermsAndConditions);
                      });
                    },
                  ),
                  if (state.hasError)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        state.errorText!,
                        style: TextStyle(
                          color: GlobalColor.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),

          // Submit Button
          AuthSubmitButton(
            title: 'Sign Up',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                Navigator.of(context).pushNamed('/location-access');
              }
            },
          ),
        ],
      ),
    );
  }

  // Helper method to build input fields
  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String hintText,
    required IconData icon,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: GlobalColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 75),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          cursorColor: GlobalColor.primary,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: GlobalColor.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _formKey.currentState?.validate();
            });
          },
          validator: validator,
        ),
      ],
    );
  }
}
