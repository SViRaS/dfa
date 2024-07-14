import 'package:dfa_media_example/src/constants/app_images.dart';
import 'package:dfa_media_example/src/features/home/presentation/view/main_page.dart';
import 'package:dfa_media_example/src/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Widget> pages = [
      const MainPage(),
      const Center(
        child: Text('Доставка'),
      ),
      const Center(
        child: Text('Магазины'),
      ),
      const Center(
        child: Text('Связаться'),
      ),
    ];
    final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
    return ValueListenableBuilder<int>(
      valueListenable: currentIndexNotifier,
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBarWidget(
            currentIndex: currentIndexNotifier.value,
            onTap: (value) {
              currentIndexNotifier.value = value;
            },
          ),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.profileIcon),
                    const SizedBox(
                      width: 8,
                    ),
                     Text('Анна', style: theme.textTheme.titleMedium,)
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.markIcon),
                    const SizedBox(
                      width: 8,
                    ),
                    SvgPicture.asset(AppImages.notificationIcon),
                  ],
                )
              ],
            ),
          ),
          body: pages[value],
        );
      },
    );
  }
}
