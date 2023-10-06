import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../newsmodel/newsmodel.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<NewsModel>>> fetchHottestNews();
  Future<Either<Failures, List<NewsModel>>> fetchLatestNews();
}
