import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeForm extends StatefulWidget {
  const VerifyCodeForm({super.key});

  @override
  State<VerifyCodeForm> createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {
  late var _pinPutController = TextEditingController();
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    _pinPutController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: GlobalColor.primary,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: GlobalColor.black,
        ),
      ),
    );
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: _pinPutController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                return value == '2222' ? null : 'Pin is incorrect';
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: GlobalColor.primary,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: GlobalColor.primary),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: GlobalColor.white,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: GlobalColor.primary),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyWith(
                textStyle: TextStyle(
                  fontSize: 22,
                  color: GlobalColor.black,
                ),
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: GlobalColor.white,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: GlobalColor.red),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          Column(
            children: [
              Text(
                'Didn\'t receive OTP?',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GlobalColor.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Resend Code',
                  softWrap: true,
                  textAlign: TextAlign.center,
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
          ElevatedButton(
            onPressed: () {
              focusNode.unfocus();
              formKey.currentState!.validate();
              if (formKey.currentState!.validate()) {
                debugPrint('CODE VALIDATED');
                Navigator.pushReplacementNamed(context, '/new-password');
              }
            },
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(GlobalColor.white),
              backgroundColor: MaterialStatePropertyAll(GlobalColor.primary),
              fixedSize: MaterialStatePropertyAll(
                Size.fromWidth(MediaQuery.of(context).size.width),
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            child: const Text(
              'Verify',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
