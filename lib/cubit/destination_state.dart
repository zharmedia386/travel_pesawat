part of 'destination_cubit.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationSuccess extends DestinationState {
  final List<DestinationModel> destinations;

  DestinationSuccess(this.destinations);

  @override
  List<Object> get props => [destinations];
}

class DestinationFailed extends DestinationState {
  final String error;

  DestinationFailed(this.error);

  // List<Object> get props => [id, email, name, hobby, balance]: In this case, the return type of props is a list of non-nullable objects (Object). This means that the individual elements in the list will always be an instance of the Object class and cannot be null.
  @override
  List<Object> get props => [error];
}
