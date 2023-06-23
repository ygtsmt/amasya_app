import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/data/models/create_employee_dto.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/data/models/employee.dart";
import "package:revogarageapp/core/core.dart";

@injectable
class CreateEmployeeUseCase {
  const CreateEmployeeUseCase(
    this._httpDataSource,
    this._snackBarService,
  );

  Future<Result<void, String?>> createEmployee(final CreateEmployeeDto request) async {
    try {
      await _httpDataSource.request(
        RequestMethod.post,
        "/api/Account",
        data: request.toJson(),
      );

      return Result.success(null);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<Employee, String?>> getEmployee(final int employeeId) async {
    try {
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Account/FindAccountById?id=$employeeId",
      );

      return Result.success(Employee.fromJson(result.data as Map<String, dynamic>));
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int?, String?>> deleteEmployee(final int employeeId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.delete,
        "/api/Account?Id=$employeeId",
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> updateEmployee(final CreateEmployeeDto employeeListShortDto) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.patch,
        "/api/Account",
        data: employeeListShortDto.toJson(),
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
