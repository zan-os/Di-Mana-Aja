import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class FailureResponse extends Failure {
  FailureResponse({
    this.message,
    this.statusCode,
    this.exceptionType,
  });

  final String? message;
  final int? statusCode;
  final DioExceptionType? exceptionType;

  @override
  List<Object?> get props => [message];
}
