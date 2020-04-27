import 'package:covid_19/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class InputConverter{
  Either<Failure, String> checker(String str) {
    try {

      if (str.isEmpty) throw FormatException();
      final alphanumeric = RegExp('[a-zA-Z]');
      final response = alphanumeric.hasMatch(str);
      if (!response) throw FormatException();
      return Right(str);
      
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}