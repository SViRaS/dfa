import 'package:carousel_slider/carousel_slider.dart';
import 'package:dfa_media_example/src/constants/palette.dart';
import 'package:flutter/material.dart';

class SliderCarousel extends StatelessWidget {
  final List<String> imagesList;
  const SliderCarousel({super.key, required this.imagesList});

  @override
  Widget build(BuildContext context) {
    final CarouselController carouselController = CarouselController();
    final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: CarouselSlider(
            items: imagesList.map((imageUrl) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image(
                  image: NetworkImage(imageUrl),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 144,
              padEnds: false,
              scrollPhysics: const BouncingScrollPhysics(),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                currentIndexNotifier.value = index;
              },
            ),
            carouselController: carouselController,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder<int>(
          valueListenable: currentIndexNotifier,
          builder: (context, currentIndex, child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagesList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 32 : 8,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Palette.colorBEBFC8,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
