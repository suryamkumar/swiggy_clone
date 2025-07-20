import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product_model.dart';
import '../view_model/repository/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo repo;

  ProductBloc(this.repo) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final product = await repo.fetchProduct(
          skip: event.skip,
          limit: event.limit,
          total: event.total,
        );
        emit(ProductLoaded(product));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
