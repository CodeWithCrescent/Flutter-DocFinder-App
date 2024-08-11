import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  int _activeIndex = 0;
  final List<String> _menu = [
    'My Profile',
    'Payment Methods',
    'Favourite',
    'Settings',
    'Help Center',
    'Privacy Policy',
    'Log Out',
  ];

  final List<IconData> _menuIcon = [
    Icons.person_outlined,
    Icons.payment_outlined,
    Icons.favorite_outline,
    Icons.settings_outlined,
    Icons.help_outline_outlined,
    Icons.lock_outline_rounded,
    Icons.logout_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        foregroundColor: GlobalColor.black,
        backgroundColor: GlobalColor.white,
        surfaceTintColor: GlobalColor.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 7,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset(
                'assets/images/profile/user.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Text(
            'Crescent Geniius',
            style: TextStyle(
              color: GlobalColor.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: _menu.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 0.7,
                indent: 5,
                endIndent: 5,
              ),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  if (index == 6) {
                    try {
                      setState(() {
                        isLoading = true;
                        _activeIndex = index;
                      });
                      Provider.of<AuthProvider>(context, listen: false)
                          .logout(context);
                      debugPrint("Successful signed out!");
                    } catch (e) {
                      debugPrint("Failed to sign out due to: $e");
                      setState(() {
                        isLoading = false;
                        _activeIndex = index;
                      });
                    }
                  }
                },
                leading: Icon(_menuIcon[index], color: GlobalColor.primary),
                title: Text(
                  _menu[index],
                  style: TextStyle(
                    color: GlobalColor.black,
                    fontSize: 15,
                  ),
                ),
                style: ListTileStyle.list,
                trailing: isLoading && _activeIndex == index
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: GlobalColor.primary,
                          strokeWidth: 2,
                        ),
                      )
                    : Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: GlobalColor.primary,
                      ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                dense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
