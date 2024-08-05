import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/forget_password_form.dart';
import 'package:doc_finder/widgets/login_form.dart';
import 'package:doc_finder/widgets/new_password_form.dart';
import 'package:doc_finder/widgets/register_form.dart';
import 'package:doc_finder/widgets/social_login.dart';
import 'package:doc_finder/widgets/verify_code_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key, required this.pageNumber});
  int pageNumber;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: widget.pageNumber == 3 ||
                widget.pageNumber == 4 ||
                widget.pageNumber == 5
            ? true
            : false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: GlobalColor.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height / 30,
            right: MediaQuery.of(context).size.height / 30,
            top: widget.pageNumber == 1 || widget.pageNumber == 3
                ? MediaQuery.of(context).size.height / 25
                : 0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.pageNumber == 1
                        ? 'Sign'
                        : widget.pageNumber == 2
                            ? 'Create'
                            : widget.pageNumber == 3
                                ? 'Forgot'
                                : widget.pageNumber == 4
                                    ? 'Verify'
                                    : 'Create',
                    style: TextStyle(
                      color: GlobalColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.pageNumber == 1
                        ? 'In'
                        : widget.pageNumber == 2
                            ? 'Account'
                            : widget.pageNumber == 3
                                ? 'Password'
                                : widget.pageNumber == 4
                                    ? 'Code'
                                    : 'New Password',
                    style: TextStyle(
                      color: GlobalColor.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              Text(
                widget.pageNumber == 1
                    ? 'Hi! Welcome back, you\'ve been missed'
                    : widget.pageNumber == 2
                        ? 'Join us to make appointment and meet your doctor seamlesly'
                        : widget.pageNumber == 3
                            ? 'Enter your email so as we can send you a verification code, to recover your password'
                            : widget.pageNumber == 4
                                ? 'Please enter the code we just sent to email example@email.com'
                                : 'Your new password must be different from previously used passwords.',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GlobalColor.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              widget.pageNumber == 1
                  ? SizedBox(height: MediaQuery.of(context).size.height / 25)
                  : SizedBox(height: MediaQuery.of(context).size.height / 35),
              if (widget.pageNumber == 1)
                const LoginForm()
              else if (widget.pageNumber == 2)
                const RegisterForm()
              else if (widget.pageNumber == 3)
                const ForgotPasswordForm()
              else if (widget.pageNumber == 4)
                const VerifyCodeForm()
              else if (widget.pageNumber == 5)
                const NewPasswordForm(),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              if (widget.pageNumber != 4)
                ElevatedButton(
                  onPressed: () {
                    if (widget.pageNumber == 1) {
                      Navigator.pushNamed(context, '/home');
                    } else if (widget.pageNumber == 2) {
                      Navigator.pushNamed(context, '/location-access');
                    } else if (widget.pageNumber == 3) {
                      Navigator.pushNamed(context, '/verify-code');
                    } else if (widget.pageNumber == 5) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login', (Route route) => false);
                    }
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll(GlobalColor.white),
                    backgroundColor:
                        MaterialStatePropertyAll(GlobalColor.primary),
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(MediaQuery.of(context).size.width),
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                  child: Text(
                    widget.pageNumber == 1
                        ? 'Sign In'
                        : widget.pageNumber == 2
                            ? 'Sign Up'
                            : widget.pageNumber == 3
                                ? 'Send Code'
                                : widget.pageNumber == 4
                                    ? 'Verify'
                                    : 'Create New Password',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              if (widget.pageNumber == 1 || widget.pageNumber == 2)
                Text(
                  widget.pageNumber == 1
                      ? 'Or sign in with'
                      : 'Or sign up with',
                  style: TextStyle(
                    color: GlobalColor.muted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              widget.pageNumber == 1
                  ? SizedBox(height: MediaQuery.of(context).size.height / 25)
                  : SizedBox(height: MediaQuery.of(context).size.height / 50),
              if (widget.pageNumber == 1 || widget.pageNumber == 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SocialButton(social: 'apple'),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    const SocialButton(social: 'google'),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    const SocialButton(social: 'facebook'),
                  ],
                ),
              widget.pageNumber == 1
                  ? SizedBox(height: MediaQuery.of(context).size.height / 25)
                  : SizedBox(height: MediaQuery.of(context).size.height / 50),
              if (widget.pageNumber == 1 || widget.pageNumber == 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.pageNumber == 1
                          ? 'Don\'t have an account?'
                          : 'Already have an account?',
                      style: TextStyle(
                        color: GlobalColor.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (widget.pageNumber == 1) {
                            widget.pageNumber = 2;
                          } else if (widget.pageNumber == 2) {
                            widget.pageNumber = 1;
                          }
                        });
                      },
                      child: Text(
                        widget.pageNumber == 1 ? 'Sign Up' : 'Sign In',
                        style: TextStyle(
                          color: GlobalColor.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
