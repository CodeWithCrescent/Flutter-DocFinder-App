import 'package:flutter/material.dart';
import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/forget_password_form.dart';
import 'package:doc_finder/widgets/login_form.dart';
import 'package:doc_finder/widgets/new_password_form.dart';
import 'package:doc_finder/widgets/register_form.dart';
import 'package:doc_finder/widgets/social_login.dart';
import 'package:doc_finder/widgets/verify_code_form.dart';

// ignore: must_be_immutable
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: GlobalColor.white,
            surfaceTintColor: GlobalColor.white,
            floating: true,
            pinned: true,
            expandedHeight: 150.0,
            automaticallyImplyLeading: widget.pageNumber == 3 ||
                    widget.pageNumber == 4 ||
                    widget.pageNumber == 5
                ? true
                : false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1.25,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _getTitleFirstPart(),
                    style: TextStyle(
                      color: GlobalColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _getTitleSecondPart(),
                    style: TextStyle(
                      color: GlobalColor.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 30,
              right: MediaQuery.of(context).size.width / 30,
              // top: MediaQuery.of(context).size.height / 25,
              bottom: MediaQuery.of(context).viewInsets.bottom + 15,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    _getSubtitle(),
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: GlobalColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: widget.pageNumber == 1
                        ? MediaQuery.of(context).size.height / 25
                        : MediaQuery.of(context).size.height / 35,
                  ),
                  _getFormWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height / 25),
                  if (widget.pageNumber == 1 || widget.pageNumber == 2)
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 0.5,
                            color: GlobalColor.muted,
                          ),
                        ),
                        Text(
                          widget.pageNumber == 1
                              ? ' Or sign in with '
                              : ' Or sign up with ',
                          style: TextStyle(
                            color: GlobalColor.muted,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 0.5,
                            color: GlobalColor.muted,
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: widget.pageNumber == 1
                        ? MediaQuery.of(context).size.height / 25
                        : MediaQuery.of(context).size.height / 50,
                  ),
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
                  SizedBox(
                    height: widget.pageNumber == 1
                        ? MediaQuery.of(context).size.height / 25
                        : MediaQuery.of(context).size.height / 50,
                  ),
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
                              widget.pageNumber =
                                  widget.pageNumber == 1 ? 2 : 1;
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
        ],
      ),
    );
  }

  String _getTitleFirstPart() {
    switch (widget.pageNumber) {
      case 1:
        return 'Sign';
      case 2:
        return 'Create';
      case 3:
        return 'Forgot';
      case 4:
        return 'Verify';
      case 5:
        return 'Create';
      default:
        return '';
    }
  }

  String _getTitleSecondPart() {
    switch (widget.pageNumber) {
      case 1:
        return 'In';
      case 2:
        return 'Account';
      case 3:
        return 'Password';
      case 4:
        return 'Code';
      case 5:
        return 'New Password';
      default:
        return '';
    }
  }

  String _getSubtitle() {
    switch (widget.pageNumber) {
      case 1:
        return 'Hi! Welcome back, you\'ve been missed';
      case 2:
        return 'Join us to make appointment and meet your doctor seamlessly';
      case 3:
        return 'Enter your email so we can send you a verification code to recover your password';
      case 4:
        return 'Please enter the code we just sent to email example@email.com';
      case 5:
        return 'Your new password must be different from previously used passwords.';
      default:
        return '';
    }
  }

  Widget _getFormWidget() {
    switch (widget.pageNumber) {
      case 1:
        return const LoginForm();
      case 2:
        return const RegisterForm();
      case 3:
        return const ForgotPasswordForm();
      case 4:
        return const VerifyCodeForm();
      case 5:
        return const NewPasswordForm();
      default:
        return const SizedBox.shrink();
    }
  }
}
