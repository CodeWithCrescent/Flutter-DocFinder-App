import 'package:doc_finder/constants/colors.dart';
import 'package:doc_finder/widgets/main_search_row.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: GlobalColor.white,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/enter-location-manually',
                arguments: {'title': 'Change Your Location'},
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: GlobalColor.primary,
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 95),
                Text(
                  'Makumbusho Stand, Dsm',
                  style: TextStyle(
                    color: GlobalColor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: GlobalColor.black,
                )
              ],
            ),
          )
        ],
      ),
      actions: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: GlobalColor.black.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.notifications_rounded,
            color: GlobalColor.black,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 50,
            right: MediaQuery.of(context).size.width / 50,
            bottom: MediaQuery.of(context).size.height / 50,
          ),
          child: MainSearchRow(searchController: _searchController),
        ),
      ),
    );
  }
}
