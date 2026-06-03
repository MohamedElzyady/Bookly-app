import 'package:book_app/features/search/presentation/views/widgets/search_body.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SearchBody()),
    );
  }
}