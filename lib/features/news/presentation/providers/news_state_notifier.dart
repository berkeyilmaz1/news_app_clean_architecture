import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/news/presentation/providers/news_notifiers.dart';
import 'package:news_app/features/news/presentation/providers/news_state.dart';
import 'package:news_app/injector.dart';

final newsNotifierProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  return Injector.getIt<NewsNotifier>();
});
