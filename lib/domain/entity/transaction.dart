import 'package:equatable/equatable.dart';
import 'package:my_store_hub/domain/entity/cart.dart';
import 'package:my_store_hub/domain/entity/user.dart';

class TransactionEntity extends Equatable {
  final User user;
  final Cart cart;
  final int usePoint;
  final int endTotalPrice;
  final String paymentMethod;
  final DateTime createdAt;

  const TransactionEntity({
      required this.user,
      required this.cart,
      required this.usePoint,
      required this.endTotalPrice,
      required this.paymentMethod,
      required this.createdAt,
    });

  @override
  List<Object?> get props => [
        user,
        cart,
        usePoint,
        endTotalPrice,
        paymentMethod,
        createdAt,
      ];
}