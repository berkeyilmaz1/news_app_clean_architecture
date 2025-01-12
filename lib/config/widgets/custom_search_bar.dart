import 'package:flutter/material.dart';
import 'package:news_app/config/constants/icon_constants.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/config/widgets/page/page_padding.dart';
import 'package:news_app/core/extensions/icon_extensions.dart';
import 'package:news_app/core/utils/border_radius_general.dart';

/// [CustomSearchBar] is a class that extends [StatelessWidget] to provide a custom search bar widget.
final class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    required this.controller,
    required this.onChanged,
    required this.searchButtonPressed,
    required this.searchBarTapped,
    super.key,
    this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChanged;
  final VoidCallback searchBarTapped;
  final VoidCallback searchButtonPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: searchBarTapped,
      validator: validator,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: searchButtonPressed,
          icon: IconConstants.search.toIcon,
        ),
        hintText: StringConstants.searchHint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadiusGeneral.allLow(),
        ),
        contentPadding: const PagePadding.generalCardAll(),
      ),
      onChanged: onChanged,
    );
  }
}
