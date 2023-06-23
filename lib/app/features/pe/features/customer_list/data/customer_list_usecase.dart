import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/models/customer_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class CustomerListUseCase {
  CustomerListUseCase(this._httpDataSource, this._snackBarService);

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<CustomerDto>?, String?>> getCustomers(final int garageId) async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Customer/GetCustomersByGarageId?PageNumber=1&PageSize=10000&Property=Id&Asc=false&garageId=$garageId",
      );

      final customers = (result.data as List<dynamic>)
          .map((final customer) => CustomerDto.fromJson(customer as Map<String, dynamic>))
          .toList();

      return Result.success(customers);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
