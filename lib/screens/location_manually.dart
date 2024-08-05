import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';

class EnterLocationManually extends StatefulWidget {
  const EnterLocationManually({super.key});

  @override
  State<EnterLocationManually> createState() => _EnterLocationManuallyState();
}

class _EnterLocationManuallyState extends State<EnterLocationManually> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    debugPrint(arguments['title']);
    return Scaffold(
      backgroundColor: GlobalColor.white,
      appBar: AppBar(
        title: Text(arguments['title'] ?? 'Enter Your Location'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: GlobalColor.black,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: GlobalColor.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            TextField(
              controller: _searchController,
              style: TextStyle(
                color: GlobalColor.black,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
              cursorWidth: 1.25,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded),
                prefixIconColor: GlobalColor.black,
                suffixIcon: const Icon(Icons.cancel_outlined),
                suffixIconColor: GlobalColor.primary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusColor: GlobalColor.primary,
                hintText: 'Makumbusho Stand',
                hintStyle: TextStyle(
                  color: GlobalColor.muted,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                hoverColor: GlobalColor.primary,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: GlobalColor.primary,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 3),
              ),
              cursorColor: GlobalColor.muted,
              enableSuggestions: true,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: GlobalColor.primary,
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 50),
                Text(
                  'Use my current location',
                  style: TextStyle(
                    color: GlobalColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Divider(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Text(
              'SEARCH RESULT'.toUpperCase(),
              style: TextStyle(
                color: GlobalColor.muted,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: GlobalColor.primary,
                      textDirection: TextDirection.ltr,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    Text(
                      'Makumbusho Stand',
                      style: TextStyle(
                        color: GlobalColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: MediaQuery.of(context).size.height / 99),
                Text(
                  '8502 Bagamoyo Rd. Near Old Ti..',
                  style: TextStyle(
                    color: GlobalColor.muted,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
