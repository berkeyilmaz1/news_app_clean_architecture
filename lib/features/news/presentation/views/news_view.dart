import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/config/constants/icon_constants.dart';
import 'package:news_app/config/constants/lottie_constants.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/config/widgets/custom_search_bar.dart';
import 'package:news_app/config/widgets/page/page_padding.dart';
import 'package:news_app/config/widgets/widget_sizes.dart';
import 'package:news_app/core/extensions/icon_extensions.dart';
import 'package:news_app/core/utils/border_radius_general.dart';
import 'package:news_app/core/utils/validators.dart';
import 'package:news_app/features/news/domain/entities/news_entitiy.dart';
import 'package:news_app/features/news/presentation/providers/news_state_notifier.dart';
import 'package:news_app/features/news/presentation/views/mixin/news_view_mixin.dart';
import 'package:news_app/features/news/presentation/widgets/search_button.dart';
import 'package:news_app/features/news_detail/view/news_detail_view.dart';

part '../widgets/news_card.dart';

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
              Padding(
                padding: const PagePadding.all(),
                child: Row(
                  spacing: WidgetSizes.spacingMid,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomSearchBar(
                        controller: searchController,
                        validator: (value) =>
                            Validators(value).validateFormValueLength(
                          StringConstants.searchHint,
                        ),
                        onChanged: (value) {
                          formKey.currentState!.validate();
                        },
                      ),
                    ),
                    SearchButton(
                      onPressed: searchButtonPressed,
                      child: IconConstants.search.toIcon,
                    ),
                  ],
                ),
              ),
              if (state.isLoading && state.news == null)
                Center(
                  child: Lottie.asset(
                    LottieConstants.loading,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                )
              else if (state.errorMessage != null)
                Text(state.errorMessage!)
              else if (state.news != null)
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: state.news!.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.news!.length) {
                        return state.isLoading
                            ? Center(
                                child: Lottie.asset(
                                  LottieConstants.loading,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                              )
                            : const SizedBox.shrink();
                      }
                      final news = state.news![index];
                      if (news.title == '[Removed]' ||
                          news.urlToImage == null) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const PagePadding.allSmall(),
                        child: NewsCard(
                          news: news,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute<NewsDetailView>(
                              builder: (context) => NewsDetailView(news: news),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
