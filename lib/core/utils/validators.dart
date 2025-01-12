final class Validators {
  Validators(this._value);

  final String? _value;

  String? validateFormValueLength(String fieldName) {
    if (_value == null || _value.isEmpty) return '$fieldName is required';

    return null;
  }
}
