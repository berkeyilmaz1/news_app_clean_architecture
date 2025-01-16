part of '../view/news_view.dart';

/// [SearchBarWithHistory] is a StatelessWidget that is responsible for displaying the search bar with history.
/// This includes the search bar, the search button, and the search history.
final class SearchBarWithHistory extends StatelessWidget {
  const SearchBarWithHistory({
    required this.searchController,
    required this.isHistoryVisible,
    required this.state,
    required this.searchBarTapped,
    required this.searchButtonPressed,
    required this.searchBarOnChanged,
    required this.changeVisibility,
    required this.onTapOutside,
    super.key,
  });

  final TextEditingController searchController;
  final bool isHistoryVisible;
  final NewsState state;
  final VoidCallback searchBarTapped;
  final VoidCallback searchButtonPressed;
  final void Function(String) searchBarOnChanged;
  final VoidCallback changeVisibility;
  final void Function(PointerDownEvent)? onTapOutside;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const PagePadding.allWithoutBottom(),
          child: CustomSearchBar(
            onTapOutside: onTapOutside,
            searchBarTapped: searchBarTapped,
            searchButtonPressed: searchButtonPressed,
            controller: searchController,
            validator: (value) => Validators(value).validateFormValueLength(
              StringConstants.searchHint,
            ),
            onChanged: searchBarOnChanged,
          ),
        ),
        if (isHistoryVisible)
          _History(
            state: state,
            searchController: searchController,
            changeVisibility: changeVisibility,
          ),
      ],
    );
  }
}

final class _History extends StatelessWidget {
  const _History({
    required this.state,
    required this.searchController,
    required this.changeVisibility,
  });

  final NewsState state;
  final TextEditingController searchController;
  final VoidCallback changeVisibility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allWithoutTop(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadiusGeneral.allLow(),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: state.searchHistory?.length ?? 0,
          itemBuilder: (context, index) {
            final searchHistory = state.searchHistory?.reversed.toList();
            if (searchHistory == null) {
              return const SizedBox.shrink();
            }
            return ListTile(
              leading: IconConstants.history.toIcon,
              title: Text(searchHistory[index]),
              onTap: () {
                searchController.text = searchHistory[index];
                changeVisibility();
              },
            );
          },
        ),
      ),
    );
  }
}
