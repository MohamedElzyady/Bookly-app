import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:book_app/features/search/presentation/views/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _submitSearch(BuildContext context) {
    context.read<SearchCubit>().fetchSearchBooks(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onSubmitted: (_) => _submitSearch(context),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              hintText: 'Search',
              suffixIcon: IconButton(
                onPressed: () => _submitSearch(context),
                icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 19),
              ),
            ),
          ),
          const Gap(10),
          const Text('Search Result', style: Style.textStyle18),
          const Gap(10),
          const Expanded(child: SearchResult()),
        ],
      ),
    );
  }
}
