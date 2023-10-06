import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../home/data/newsmodel/newsmodel.dart';
import '../../../data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchNews({required String category}) async {
    emit(SearchEmpty());

    emit(SearchLoading());
    var result = await searchRepo.fetchSearchNews(category);

    result.fold(
      (faliure) {
        emit(SearchFaliure(faliure.errMessage));
      },
      (news) {
        emit(SearchSuccess(news));
      },
    );
  }
}
