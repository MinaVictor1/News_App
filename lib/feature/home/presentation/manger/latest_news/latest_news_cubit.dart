import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp/feature/home/data/newsmodel/newsmodel.dart';

import '../../../data/repo/home_repo.dart';

part 'latest_news_state.dart';

class LatestNewsCubit extends Cubit<LatestNewsState> {
  LatestNewsCubit(this.homeRepo) : super(LatestNewsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchLattestNews() async {
    emit(LatestNewsLoading());
    var result = await homeRepo.fetchLatestNews();

    result.fold(
      (faliure) {
        emit(LatestNewsFaluire(faliure.errMessage));
      },
      (news) {
        emit(LatestNewsSuccess(news));
      },
    );
  }
}
