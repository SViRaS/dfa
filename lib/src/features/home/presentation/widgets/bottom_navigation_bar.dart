import 'package:dfa_media_example/src/constants/app_images.dart';
import 'package:dfa_media_example/src/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppImages.homeIcon,
            color:
                currentIndex == 0 ? Palette.colorE50D32 : Palette.color1F2029,
          ),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppImages.bagIcon,
            color:
                currentIndex == 1 ? Palette.colorE50D32 : Palette.color1F2029,
          ),
          label: 'Доставка',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppImages.shopIcon,
            color:
                currentIndex == 2 ? Palette.colorE50D32 : Palette.color1F2029,
          ),
          label: 'Магазины',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppImages.messageIcon,
            color:
                currentIndex == 3 ? Palette.colorE50D32 : Palette.color1F2029,
          ),
          label: 'Связаться',
        ),
      ],
    );
  }
}
