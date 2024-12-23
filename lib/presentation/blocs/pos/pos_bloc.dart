import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store_hub/common/enum_state.dart';
import 'package:my_store_hub/domain/entity/cart.dart';
import 'package:my_store_hub/domain/entity/product.dart';
import 'package:my_store_hub/domain/usecases/cart/add_product_quantitiy.dart';
import 'package:my_store_hub/domain/usecases/cart/add_product_to_cart.dart';
import 'package:my_store_hub/domain/usecases/cart/clear_cart.dart';
import 'package:my_store_hub/domain/usecases/cart/get_all_cart_map.dart';
import 'package:my_store_hub/domain/usecases/cart/reduce_product_quantity.dart';

part 'pos_event.dart';
part 'pos_state.dart';

class PosBloc extends Bloc<PosEvent, PosState> {
  final AddProductToCart addProductToCart;
  final AddProductQuantity addProductQuantity;
  final ReduceProductQuantity reduceProductQuantity;
  final ClearCart clearCart;
  final GetAllCartsMap getAllCartsMap;

  PosBloc({
    required this.addProductToCart,
    required this.addProductQuantity,
    required this.reduceProductQuantity,
    required this.clearCart,
    required this.getAllCartsMap,
  }) : super(PosState.initial()) {
    on<OnClearCart>((event, emit) async {
      await clearCart.execute();
      emit(PosState.initial());
    });

    on<OnAddProductToCart>((event, emit) async {
      final result = await addProductToCart.execute(event.product);
      emit(
        state.copyWith(
          cart: result,
          actionState: PosActionState.noAction,
        ),
      );
    });

    on<OnAddProductQuantity>((event, emit) async {
      final result = await addProductQuantity.execute(event.product);
      emit(
        state.copyWith(
          cart: result,
          actionState: PosActionState.noAction,
        ),
      );
    });

    on<OnReduceProductQuantity>((event, emit) async {
      final result = await reduceProductQuantity.execute(event.product);
      emit(
        state.copyWith(
          cart: result,
          actionState: PosActionState.noAction,
        ),
      );
    });

    on<OnPosAction>((event, emit) async {
      final result = await getAllCartsMap.execute();
      if (result.containsValue(0)) {
        emit(
          state.copyWith(
            actionState: PosActionState.failed,
          ),
        );
      } else {
        emit(
          state.copyWith(
            actionState: PosActionState.success,
            cartMap: result,
          ),
        );
      }
    });
  }
}
