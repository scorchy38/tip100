part of 'transactions_cubit.dart';

// @immutable
abstract class TransactionsState {}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoaded extends TransactionsState {}

class TransactionsError extends TransactionsState {}
