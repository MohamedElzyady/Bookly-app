import 'package:book_app/features/favorite/presentation/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestsellar_text.dart';
import 'package:lottie/lottie.dart';

class ItemBookMarker extends StatefulWidget {
  const ItemBookMarker({super.key, required this.book});
  final BookModel book;

  @override
  State<ItemBookMarker> createState() => _ItemBookMarkerState();
}

class _ItemBookMarkerState extends State<ItemBookMarker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isLottieLoaded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate(bool isBookmarked) {
    if (!_isLottieLoaded) return;
    _controller.animateTo(
      isBookmarked ? 0.5 : 0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoritesCubit>();

    return BlocListener<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        final isBookmarked = cubit.isBookBookmarked(widget.book);
        _animate(isBookmarked);
      },
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final isBookmarked = cubit.isBookBookmarked(widget.book);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                BestsellarText(book: widget.book),

                Positioned(
                  top: -16,
                  left: 40,
                  child: GestureDetector(
                    onTap: () {
                      cubit.toggleBook(widget.book);
                    },
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Lottie.asset(
                        'assets/animation/BOOKMARK.json',
                        controller: _controller,
                        repeat: false,
                        onLoaded: (composition) {
                          _controller.duration = composition.duration;
                          _isLottieLoaded = true;

                          /// اضبط الفريم مرة واحدة بس
                          _controller.value = isBookmarked ? 0.5 : 0.0;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}