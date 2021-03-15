import '../../../../shared/helpers/errors.dart';

abstract class FailureLogin implements Failure {}


class FailureGetEnterprises implements FailureLogin {
  @override
  final String? message;
  FailureGetEnterprises({
    this.message,
  });
}
