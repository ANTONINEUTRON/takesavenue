import 'package:equatable/equatable.dart';

class TakesState extends Equatable {
  const TakesState({this.isLoading = false});

  final bool isLoading;

  @override
  List<Object> get props => [isLoading];

  TakesState copyWith({bool? isLoading}) {
    return TakesState(isLoading: isLoading ?? this.isLoading);
  }
}
