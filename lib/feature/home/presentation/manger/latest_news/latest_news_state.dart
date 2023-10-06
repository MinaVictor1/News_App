part of 'latest_news_cubit.dart';

sealed class LatestNewsState extends Equatable {
  const LatestNewsState();

  @override
  List<Object> get props => [];
}

final class LatestNewsInitial extends LatestNewsState {}

final class LatestNewsSuccess extends LatestNewsState {
  final List<NewsModel> books;

  const LatestNewsSuccess(this.books);
}

final class LatestNewsLoading extends LatestNewsState {}

final class LatestNewsFaluire extends LatestNewsState {
  final String errMessage;

  const LatestNewsFaluire(this.errMessage);
}
