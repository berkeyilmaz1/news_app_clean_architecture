import 'package:flutter/material.dart';
import 'package:news_app/config/constants/icon_constants.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/config/widgets/page/page_padding.dart';
import 'package:news_app/core/extensions/icon_extensions.dart';
import 'package:news_app/core/utils/border_radius_general.dart';

final class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    required this.controller,
    required this.onChanged,
    super.key,
    this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: StringConstants.searchHint,
        prefixIcon: IconConstants.search.toIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadiusGeneral.allLow(),
        ),
        contentPadding: const PagePadding.generalCardAll(),
      ),
      onChanged: onChanged,
    );
  }
}
