part of '../view/news_view.dart';

final class SearchBarWithHistory extends StatelessWidget {
  const SearchBarWithHistory({
    required this.searchController,
    required this.isHistoryVisible,
    required this.state,
    required this.searchBarTapped,
    required this.searchButtonPressed,
    required this.searchBarOnChanged,
    required this.changeVisibility,
    super.key,
  });

  final TextEditingController searchController;
  final bool isHistoryVisible;
  final NewsState state;
  final VoidCallback searchBarTapped;
  final VoidCallback searchButtonPressed;
  final void Function(String) searchBarOnChanged;
  final VoidCallback changeVisibility;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SearchComponents(
              searchBarTapped: searchBarTapped,
              searchController: searchController,
              searchButtonPressed: searchButtonPressed,
              onChanged: searchBarOnChanged,
            ),
            if (isHistoryVisible)
              Padding(
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
                      final searchHistory =
                          state.searchHistory?.reversed.toList();
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
              ),
          ],
        ),
      ],
    );
  }
}
