import 'package:dallal_proj/core/shared/components/app_cards/package_card/entities/package_type.dart';
import 'package:dallal_proj/core/constants/app_defs.dart';
import 'package:dallal_proj/core/shared/widgets/helpers/widgets_helper.dart';
import 'package:intl/intl.dart';

class PckgInfEntity {
  final PackageType type;
  final DateTime startDate;

  const PckgInfEntity({required this.type, required this.startDate});

  /// Formatted start date
  String get startDateStr => DateFormat(kDefDateFormat).format(startDate);

  /// Computed end date
  DateTime get endDate =>
      startDate.add(Duration(days: WidH.strToint(type.frame)));

  /// Formatted end date
  String get endDateStr => DateFormat(kDefDateFormat).format(endDate);

  /// Remaining days from today to endDate
  String get remainingDays {
    final now = DateTime.now();
    final remaining = endDate.difference(now).inDays;
    return remaining > 0 ? remaining.toString() : '0';
  }
}
