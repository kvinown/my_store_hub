import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store_hub/common/currency_rupiah_extension.dart';
import 'package:my_store_hub/common/routes.dart';
import 'package:my_store_hub/common/styles.dart';
import 'package:my_store_hub/domain/entity/product.dart';
import 'package:my_store_hub/presentation/blocs/product/product_bloc.dart';
import 'package:my_store_hub/presentation/widgets/action_dialog.dart';
import 'package:my_store_hub/presentation/widgets/confirm_delete_dialog.dart';
import 'package:my_store_hub/presentation/widgets/error_dialog.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<ProductBloc>().add(OnFetchAllProducts()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductActionSuccess) {
          _scaffoldMessengerKey.currentState!
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green[400],
              ),
            );
        }

        if (state is ProductActionFailure) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => ErrorDialog(message: state.message),
          );
        }
      },
      child: ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
          backgroundColor: greyColor,
          appBar: AppBar(
            title: const Text('Produk'),
          ),
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (_, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductEmpty) {
                return const Center(
                  child: Text('Data Kosong'),
                );
              } else if (state is ProductFailure) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is AllProductsLoaded) {
                return ListView.builder(
                  itemCount: state.products.length,
                  padding: const EdgeInsets.only(
                    top: 24,
                    left: 24,
                    right: 24,
                    bottom: 4,
                  ),
                  itemBuilder: (_, index) {
                    final product = state.products[index];
                    return _ProductCard(product: product);
                  },
                );
              } else {
                return Container();
              }
            },
          ),
          floatingActionButton: BlocBuilder<ProductBloc, ProductState>(
            buildWhen: (_, current) => current is! ProductLoading,
            builder: (context, _) {
              return FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, productAddUpdateRoute),
                child: const Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => ActionDialog(
              titleUpdateAction: 'Ubah Produk',
              updateActionOnTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  productAddUpdateRoute,
                  arguments: product,
                );
              },
              titleDeleteAction: 'Hapus Produk',
              deleteActionOnTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return ConfirmDeleteDialog(
                      title: 'Hapus Produk',
                      yesOnPressed: () {
                        Navigator.pop(context);
                        context
                            .read<ProductBloc>()
                            .add(OnDeleteProduct(product));
                      },
                    );
                  },
                );
              },
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.memory(
                product.image!,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.category!.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      product.price.intToFormatRupiah,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: blueColor,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
