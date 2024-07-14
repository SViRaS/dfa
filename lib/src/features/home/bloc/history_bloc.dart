import 'package:bloc/bloc.dart';
import 'package:dfa_media_example/src/features/home/repository/request_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc(this.historyRepository) : super(ItemsInitial()) {
    on<GetHistoriesEvent>(_getHistoriesEvent);
  }
  final RequestRepository historyRepository;

  void _getHistoriesEvent(
    GetHistoriesEvent event,
    Emitter<ItemsState> emit,
  ) async {
    emit(ItemsLoading());
    try {
      final products = await historyRepository.fetchData('products');
      final stories = await historyRepository.fetchData('story');
      final banners = await historyRepository.fetchData('banners');
      emit(ItemsLoaded(
          products: products, stories: stories, banners: banners));
    } catch (e) {
      emit(ItemsFailure());
    }
  }
}
