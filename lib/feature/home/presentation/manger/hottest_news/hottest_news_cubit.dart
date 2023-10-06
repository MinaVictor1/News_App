import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp/feature/home/data/newsmodel/newsmodel.dart';
import 'package:newsapp/feature/home/data/repo/home_repo.dart';

part 'hottest_news_state.dart';

class HottestNewsCubit extends Cubit<HottestNewsState> {
  HottestNewsCubit(this.homeRepo) : super(HottestNewsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchHottestNews() async {
    emit(HottestNewsLoading());
    var result = await homeRepo.fetchHottestNews();

    result.fold(
      (faliure) {
        emit(HottestNewsFaliure(faliure.errMessage));
      },
      (news) {
        emit(HottestNewsSuccess(news));
      },
    );
  }
}
