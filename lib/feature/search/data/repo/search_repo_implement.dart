import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:newsapp/core/errors/failures.dart';

import 'package:newsapp/feature/home/data/newsmodel/newsmodel.dart';

import '../../../../core/Utils/api_service.dart';
import 'search_repo.dart';

class SearchRepoImplement implements SearchRepo {
  final ApiServise apiService;

  SearchRepoImplement({required this.apiService});

  @override
  Future<Either<Failures, List<NewsModel>>> fetchSearchNews(
      String category) async {
    try {
      var data = await apiService.get(
          endPoint:
              'category=$category&apiKey=c082025dfcc14ccea7f15a05db29a770');

      //here in our API we make a model only for items
      //for that we make it
      //if we took all info API we did not make it
      List<NewsModel> books = [];
      for (var item in data['articles']) {
        books.add(NewsModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }
}
