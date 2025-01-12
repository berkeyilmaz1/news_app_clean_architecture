import 'package:flutter/widgets.dart';
import 'package:news_app/features/news_detail/view/news_detail_view.dart';

mixin NewsDetailViewMixin on State<NewsDetailView> {
  void onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
    FocusScope.of(context).unfocus();
  }
}
