import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {}

class SuccessState<T> implements BaseState {
  final T data;

  const SuccessState(this.data);

  @override
  List<Object?> get props => [data];

  @override
  bool get stringify => false;
}

class LoadState implements BaseState {
  const LoadState();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class EmptyState implements BaseState {
  final String? message;

  const EmptyState({this.message});

  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}
