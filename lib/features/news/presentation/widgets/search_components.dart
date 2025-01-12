part of '../view/news_view.dart';

final class SearchComponents extends StatelessWidget {
  const SearchComponents({
    required this.searchController,
    required this.searchButtonPressed,
    required this.onChanged,
    super.key,
  });

  final TextEditingController searchController;
  final VoidCallback searchButtonPressed;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Row(
        spacing: WidgetSizes.spacingMid,
        children: [
          Expanded(
            child: CustomSearchBar(
              searchButtonPressed: searchButtonPressed,
              controller: searchController,
              validator: (value) => Validators(value).validateFormValueLength(
                StringConstants.searchHint,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
