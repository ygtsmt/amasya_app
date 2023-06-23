import "package:equatable/equatable.dart";

class VehicleCostSummary extends Equatable {
  const VehicleCostSummary({
    required this.amount,
    required this.text,
  });
  final double amount;
  final String text;

  @override
  List<Object> get props => [
        amount,
        text,
      ];
}
