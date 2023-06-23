import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/models/customer_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class CustomerFormUseCase {
  const CustomerFormUseCase(this._httpDataSource, this._snackBarService);

  Future<Result<int, String?>> createCustomers(
    final CustomerDto customer,
  ) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/Customer",
        data: customer.toJson(),
      );
      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> updateCustomers(final CustomerDto customer) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.patch,
        "/api/Customer",
        data: customer.toJson(),
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int?, String?>> deleteCustomer(final int customerId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.delete,
        "/api/Customer?Id=$customerId",
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;
}
