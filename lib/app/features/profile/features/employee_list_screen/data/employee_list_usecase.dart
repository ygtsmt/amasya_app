import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/profile/features/employee_list_screen/data/models/employee_list_short_dto.dart";
import "package:revogarageapp/core/core.dart";

@injectable
class EmployeeListUseCase {
  EmployeeListUseCase(this._httpDataSource, this._snackBarService);

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;

  Future<Result<List<EmployeeListShortDto>?, String?>> getEmployees(final int garageId) async {
    try {
      final garageId = getIt<AppBloc>().state.garage?.id;
      final result = await _httpDataSource.request(
        RequestMethod.get,
        "/api/Account/GetAccountsByGarageId?PageNumber=1&PageSize=1000&Property=Id&Asc=false&garageId=$garageId",
      );

      final employees = (result.data as List<dynamic>)
          .map((final employee) => EmployeeListShortDto.fromJson(employee as Map<String, dynamic>))
          .where((final employee) => employee.type == AccountType.employee)
          .toList();

      return Result.success(employees);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
