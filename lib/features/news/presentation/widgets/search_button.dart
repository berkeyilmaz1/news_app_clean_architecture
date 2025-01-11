import 'package:flutter/material.dart';

final class SearchButton extends StatelessWidget {
  const SearchButton({required this.onPressed, required this.child, super.key});
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}
