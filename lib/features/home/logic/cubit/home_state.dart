import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.articalsLoading() = HomeArticalsLoading;
  const factory HomeState.search() = HomeSearch;
  const factory HomeState.stopSearch() = HomeStopSearch;
  const factory HomeState.articalsSearchedLoading() =
      HomeArticalsSearchedLoading;
  const factory HomeState.articalsSearchedError({required String error}) =
      HomeArticalsSearchedError;
  const factory HomeState.success(T data) = HomeSuccess<T>;
  const factory HomeState.error({required String error}) = HomeError;
}
