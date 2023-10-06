import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/newsmodel/newsmodel.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<NewsModel>>> fetchSearchNews(String category);
}
