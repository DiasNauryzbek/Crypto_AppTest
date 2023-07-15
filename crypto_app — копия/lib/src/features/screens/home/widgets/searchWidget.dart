import 'package:crypto_app/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatefulWidget {
  final Function(String) onSearch;
  final Function() onCancel;

  SearchWidget({required this.onSearch, required this.onCancel});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    widget.onCancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 9, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            'assets/svg/search.svg',
            width: 20,
            height: 20,
            color: AppColors.grey,
          ),
          SizedBox(width: 3),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
              onChanged: (value) {
                widget.onSearch(value); // Pass the value to onSearch callback
              },
            ),
          ),
          GestureDetector(
            onTap: _clearSearch,
            child: SvgPicture.asset(
              'assets/svg/close.svg',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}


