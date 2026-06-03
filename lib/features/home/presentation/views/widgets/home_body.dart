import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/home/presentation/views/widgets/best_sellar_listview.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:book_app/features/home/presentation/views/widgets/home_listview.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppbar(),
              ),
              const Gap(30),
              HomeListview(),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('Best saller', style: Style.textStyle18),
              ),
              Gap(20),
            ],
          ),
        ),
        // !مكان الي تحت عادي  SliverToBoxAdapter  ممكن استخدم ويدجت اسمها
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BestSellarListview(),
          ),
        ),
      ],
    );
  }
}
