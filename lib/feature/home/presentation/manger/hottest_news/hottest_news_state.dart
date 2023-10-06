part of 'hottest_news_cubit.dart';

sealed class HottestNewsState extends Equatable {
  const HottestNewsState();

  @override
  List<Object> get props => [];
}

final class HottestNewsInitial extends HottestNewsState {}

final class HottestNewsLoading extends HottestNewsState {}

final class HottestNewsFaliure extends HottestNewsState {
  final String errMessage;

  const HottestNewsFaliure(this.errMessage);
}

final class HottestNewsSuccess extends HottestNewsState {
  final List<NewsModel> news;

  const HottestNewsSuccess(this.news);
}
