part of 'register_cubit.dart';

class RegisterState {
  final bool isLoading;
  final bool hasError;
  final bool hasData;
  final String? error;

  RegisterState(
      {required this.isLoading,
      required this.hasError,
      required this.hasData,
      this.error});

  RegisterState copyWith({isLoading, hasError, hasData, error}) {
    return RegisterState(
        isLoading: this.isLoading,
        hasError: this.hasError,
        hasData: this.hasData,
        error: this.error);
  }
}
