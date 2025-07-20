part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class FetchProducts extends ProductEvent {
  final int skip;
  final int limit;
  final int total;

  FetchProducts({this.skip = 0, this.limit = 30, this.total = 50});
}
