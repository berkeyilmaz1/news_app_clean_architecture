import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/news/presentation/providers/news_state_notifier.dart';
import 'package:news_app/features/news/presentation/views/news_view.dart';

mixin NewsViewMixin on ConsumerState<NewsView> {
  late final TextEditingController _searchController;
  TextEditingController get searchController => _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  void searchButtonPressed() {
    ref.read(newsNotifierProvider.notifier).getNews(searchController.text);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
