import 'package:dfa_media_example/src/constants/app_images.dart';
import 'package:dfa_media_example/src/constants/currency.dart';
import 'package:dfa_media_example/src/constants/palette.dart';
import 'package:dfa_media_example/src/features/home/bloc/history_bloc.dart';
import 'package:dfa_media_example/src/features/home/presentation/widgets/slider_carousel.dart';
import 'package:dfa_media_example/src/features/home/repository/request_repository.dart';
import 'package:dfa_media_example/src/utils/get_decoding_text.dart';
import 'package:dfa_media_example/src/utils/get_unit_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const rub = Currency.rub;
    final decodingText = GetDecodingText();
    final getUnit = GetUnitToString();
    final itemsBloc = ItemsBloc(RequestRepository());
    itemsBloc.add(GetHistoriesEvent());
    final List<String> bannersList = [];
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ItemsBloc, ItemsState>(
          bloc: itemsBloc,
          builder: (context, state) {
            if (state is ItemsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ItemsLoaded) {
              for (int i = 0; i < state.banners.length; i++) {
                if (i < state.banners.length) {
                  bannersList.add(state.banners[i].image);
                }
              }
              return Column(
                children: [
                  SizedBox(
                    height: 105,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.stories.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        final story = state.stories[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                                child: Image(
                                    width: 63,
                                    height: 63,
                                    image: NetworkImage(story.image))),
                            SizedBox(
                                height: 36,
                                width: 80,
                                child: Text(
                                  decodingText.decodeText(
                                    story.title,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodySmall?.copyWith(color: Palette.colorE50D32),
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SliderCarousel(imagesList: bannersList),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.fireIcon),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Хит продаж',
                        style: theme.textTheme.titleMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 198,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.products.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemBuilder: (context, index) {
                          final products = state.products[index];
                          return SizedBox(
                            width: 114,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.94)),
                                  child: Image(
                                      image: NetworkImage(
                                          state.products[index].image)),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 44,
                                      child: Text(
                                        decodingText.decodeText(products.title,),
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "${products.price.toString()} $rub/${getUnit.getUnit(products.unit)}", style: theme.textTheme.bodyMedium,),
                                        SvgPicture.asset(AppImages.addCardIcon)
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            }
            if (state is ItemsFailure) {
              return const Center(
                child: Text('Data has failure'),
              );
            } else {
              return const Center(child: Text("We can't found exception"));
            }
          },
        ));
  }
}
