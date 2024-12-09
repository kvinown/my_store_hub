import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/exception.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/data/datasources/product_local_data_source.dart';
import 'package:my_store_hub/data/models/product_model.dart';
import 'package:my_store_hub/domain/entity/product.dart';
import 'package:my_store_hub/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final result = await localDataSource.getAllProducts();
      return Right(result.map((product) => product.toEntity()).toList());
    } on DatabaseException catch (_) {
      return const Left(DatabaseFailure('Gagal mendapatkan data produk'));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> insertProduct(Product product) async {
    try {
      final result = await localDataSource.insertProduct(
        ProductModel.fromEntity(product),
      );
      return Right(result);
    } on DatabaseException catch (_) {
      return const Left(DatabaseFailure('Gagal menambahkan produk'));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeProduct(Product product) async {
    try {
      final result = await localDataSource.removeProduct(
        ProductModel.fromEntity(product),
      );
      return Right(result);
    } on DatabaseException catch (_) {
      return const Left(DatabaseFailure('Gagal menghapus produk'));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> updateProduct(Product product) async {
    try {
      final result = await localDataSource.updateProduct(
        ProductModel.fromEntity(product),
      );
      return Right(result);
    } on DatabaseException catch (_) {
      return const Left(DatabaseFailure('Gagal update produk'));
    } catch (e) {
      rethrow;
    }
  }
}
