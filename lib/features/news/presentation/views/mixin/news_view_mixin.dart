import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/news/presentation/providers/news_state_notifier.dart';
import 'package:news_app/features/news/presentation/views/news_view.dart';

mixin NewsViewMixin on ConsumerState<NewsView> {
  late final TextEditingController _searchController;
  TextEditingController get searchController => _searchController;
  late final ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(newsNotifierProvider.notifier).loadNews(searchController.text);
    }
  }

  void searchButtonPressed() {
    if (_formKey.currentState!.validate()) {
      ref.read(newsNotifierProvider.notifier).getNews(searchController.text);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
