part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchEmpty extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<NewsModel> books;

  const SearchSuccess(this.books);
}

final class SearchFaliure extends SearchState {
  final String errMessage;

  const SearchFaliure(this.errMessage);
}
