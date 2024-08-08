import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/app_button.dart';
import 'package:flutter/material.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  final TextEditingController _otherController = TextEditingController();
  int selectedChoice = 0;
  final List<String> _choices = [
    'Schedule Change',
    'Weather conditions',
    'Unexpected work',
    'Childcare issue',
    'Travel delays',
    'Other',
  ];

  void setSelectedChoice(int choice) {
    setState(() {
      selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
      appBar: AppBar(
        title: const Text(
          'Cancel Booking',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        foregroundColor: GlobalColor.black,
        backgroundColor: GlobalColor.white,
        surfaceTintColor: GlobalColor.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 50,
          bottom: MediaQuery.of(context).size.height / 50,
          left: MediaQuery.of(context).size.width / 25,
          right: MediaQuery.of(context).size.width / 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please select the reason for cancellation:',
              style: TextStyle(
                color: GlobalColor.muted,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            ...List.generate(
              _choices.length,
              (index) => RadioListTile<int>(
                value: index,
                groupValue: selectedChoice,
                title: Text(
                  _choices[index],
                  style: TextStyle(
                    color: GlobalColor.black,
                    fontSize: 14,
                  ),
                ),
                onChanged: (currentChoice) {
                  if (currentChoice != null) {
                    setSelectedChoice(currentChoice);
                  }
                },
                activeColor: GlobalColor.primary,
                contentPadding: const EdgeInsets.all(0),
                dense: true,
              ),
            ),
            const Divider(
              height: 30,
              thickness: 0.5,
            ),
            Text(
              'Other:',
              style: TextStyle(
                color: GlobalColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 75),
            TextField(
              controller: _otherController,
              autocorrect: true,
              enabled: selectedChoice == _choices.length - 1,
              keyboardType: TextInputType.multiline,
              maxLength: 100,
              maxLines: null,
              minLines: 5,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Type your reason',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        enableDrag: false,
        elevation: 5,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: GlobalColor.white,
              boxShadow: [
                BoxShadow(
                  color: GlobalColor.black.withOpacity(0.2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Button fixed at the bottom
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: GlobalColor.primary,
                    foregroundColor: GlobalColor.white,
                    fixedSize: 1.2,
                    text: 'Cancel Appointment',
                    elevation: 5,
                    verticalPadding: 10,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
