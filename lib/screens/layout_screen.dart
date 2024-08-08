import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/screens/home/booking_tabs_view.dart';
import 'package:doc_finder/screens/home/chats_screen.dart';
import 'package:doc_finder/screens/home/explore_screen.dart';
import 'package:doc_finder/screens/home/profile_screen.dart';
import 'package:doc_finder/screens/home/home_screen.dart';
import 'package:doc_finder/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class AppLayoutScreen extends StatefulWidget {
  const AppLayoutScreen({super.key});

  @override
  State<AppLayoutScreen> createState() => _AppLayoutScreenState();
}

class _AppLayoutScreenState extends State<AppLayoutScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        // Ensure TabController is initialized only once
        if (!_tabController.indexIsChanging) {
          _tabController = TabController(length: 3, vsync: this);
        }
      }
    });
  }

  final List<TabItem> _items = [
    const TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    const TabItem(
      icon: Icons.location_pin,
      title: 'Explore',
    ),
    const TabItem(
      icon: Icons.calendar_month,
      title: 'Bookings',
    ),
    const TabItem(
      icon: Icons.message_outlined,
      title: 'Chat',
    ),
    const TabItem(
      icon: Icons.person,
      title: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 3 tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
      appBar: _selectedIndex == 1 || _selectedIndex == 4
          ? null
          : _selectedIndex == 2
              ? AppBar(
                  title: const Text(
                    'My Bookings',
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
                  actions: [
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: const Icon(
                        Icons.search,
                      ),
                    ),
                  ],
                  bottom: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Upcoming',
                      ),
                      Tab(
                        text: 'Completed',
                      ),
                      Tab(
                        text: 'Cancelled',
                      ),
                    ],
                  ),
                )
              : PreferredSize(
                  preferredSize: const Size.fromHeight(120),
                  child: HomeAppBar(searchController: _searchController),
                ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomeScreen(),
           ExploreScreen(searchController: _searchController),
          BookingsTabsView(tabController: _tabController),
          const ChatsScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: SizedBox(
          width: double.infinity,
          child: BottomBarFloating(
            items: _items,
            backgroundColor: GlobalColor.white,
            color: GlobalColor.muted,
            colorSelected: GlobalColor.primary,
            indexSelected: _selectedIndex,
            onTap: _onItemTapped,
            paddingVertical: 15,
            iconSize: 25,
            animated: true,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: GlobalColor.black.withOpacity(0.2),
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
