import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/news/presentation/providers/news_state_notifier.dart';
import 'package:news_app/features/news/presentation/view/news_view.dart';

/// [NewsViewMixin] is a mixin class that contains the logic for the [NewsView].
mixin NewsViewMixin on ConsumerState<NewsView> {
  late final TextEditingController _searchController;
  TextEditingController get searchController => _searchController;
  late final ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  /// Search History
  bool _isHistoryVisible = false;
  bool get isHistoryVisible => _isHistoryVisible;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  /// Search Button Pressed
  void searchButtonPressed() {
    if (_formKey.currentState!.validate()) {
      changeHistoryVisibility(value: false);
      ref.read(newsNotifierProvider.notifier).getNews(searchController.text);
    }
  }

  void changeHistoryVisibility({required bool value}) {
    setState(() {
      _isHistoryVisible = value;
    });
  }

  /// Validation for SearchBar
  void searchBarOnChanged(String value) {
    _formKey.currentState!.validate();
  }

  /// Load More when scrolled to the bottom
  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(newsNotifierProvider.notifier).loadNews(searchController.text);
    }
  }

  ///Open the history when the search bar is tapped
  void searchBarTapped() {
    changeHistoryVisibility(
      value: true,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
