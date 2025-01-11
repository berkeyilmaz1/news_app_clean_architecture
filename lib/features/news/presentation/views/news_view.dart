import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/news/presentation/providers/news_state_notifier.dart';

final class NewsView extends ConsumerWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsNotifierProvider);

    // UI implementation
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(newsNotifierProvider.notifier).getNews('elon musk');
            },
            child: const Text('Get News'),
          ),
          if (state.isLoading)
            const CircularProgressIndicator()
          else if (state.errorMessage != null)
            Text(state.errorMessage!)
          else if (state.news != null)
            Expanded(
              child: ListView.builder(
                itemCount: state.news!.length,
                itemBuilder: (context, index) {
                  final news = state.news![index];
                  if (state.news?[index].title == '[Removed]') {
                    return const SizedBox.shrink();
                  }
                  return ListTile(
                    title: Text(news.title ?? ''),
                    subtitle: Text(news.description ?? ''),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
