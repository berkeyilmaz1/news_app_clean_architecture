import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/config/widgets/custom_loading.dart';
import 'package:news_app/config/widgets/custom_search_bar.dart';
import 'package:news_app/config/widgets/page/page_padding.dart';
import 'package:news_app/config/widgets/widget_sizes.dart';
import 'package:news_app/core/extensions/context_extensions.dart';
import 'package:news_app/core/utils/border_radius_general.dart';
import 'package:news_app/core/utils/validators.dart';
import 'package:news_app/features/news/domain/entities/news_entitiy.dart';
import 'package:news_app/features/news/presentation/providers/news_state.dart';
import 'package:news_app/features/news/presentation/providers/news_state_notifier.dart';
import 'package:news_app/features/news/presentation/view/mixin/news_view_mixin.dart';
import 'package:news_app/features/news_detail/view/news_detail_view.dart';

part '../widgets/news_card.dart';
part '../widgets/news_list.dart';
part '../widgets/search_components.dart';

final class NewsView extends ConsumerStatefulWidget {
  const NewsView({super.key});

  @override
  ConsumerState<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends ConsumerState<NewsView> with NewsViewMixin {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsNotifierProvider);

    return Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SearchComponents(
                searchController: searchController,
                searchButtonPressed: searchButtonPressed,
                onChanged: searchBarOnChanged,
              ),
              if (state.newsStatus == NewsStatus.loading && state.news == null)
                CustomLoading(
                  width: context.width3,
                  height: context.height3,
                ),
              if (state.newsStatus == NewsStatus.error)
                Text(state.errorMessage!),
              if (state.news != null)
                NewsList(scrollController: scrollController, state: state),
            ],
          ),
        ),
      ),
    );
  }
}
