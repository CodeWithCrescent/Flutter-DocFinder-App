import 'package:doc_finder/constants/colors.dart';
import 'package:flutter/material.dart';


class MainSearchRow extends StatelessWidget {
  const MainSearchRow({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            style: TextStyle(
              color: GlobalColor.black,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            cursorWidth: 1.25,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded),
              prefixIconColor: GlobalColor.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusColor: GlobalColor.primary,
              hintText: 'Search',
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
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 40),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.tune_rounded,
            color: GlobalColor.white,
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(GlobalColor.primary),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.all(12),
            ),
            shape: const MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
