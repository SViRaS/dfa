part of 'history_bloc.dart';

@immutable
sealed class ItemsEvent extends Equatable {}

class GetHistoriesEvent extends ItemsEvent {
  
  @override
  List<Object?> get props => [];
}
