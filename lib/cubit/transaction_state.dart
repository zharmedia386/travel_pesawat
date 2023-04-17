part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transactions;

  TransactionSuccess(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionFailed extends TransactionState {
  final String error;

  TransactionFailed(this.error);

  // List<Object> get props => [id, email, name, hobby, balance]: In this case, the return type of props is a list of non-nullable objects (Object). This means that the individual elements in the list will always be an instance of the Object class and cannot be null.
  @override
  List<Object> get props => [error];
}
