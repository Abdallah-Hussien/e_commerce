class ValidationUtil {
  /// @usage: validate entered Eg phone number based on used regex.
  /// @param phoneNumber A String containing the user's Eg phone number
  /// @return A Boolean value that is determined based on used regex
  static bool isValidEgPhoneNumber(String phoneNumber) {
    final egPhoneNumberRegex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
    return egPhoneNumberRegex.hasMatch(phoneNumber);
  }

  /// @usage: validate entered user email based on email address pattern.
  /// @param userEmail A String containing the user's email
  /// @return A Boolean value that is determined based on used pattern
  static bool isValidUserEmail(String userEmail) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]{1,256}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(userEmail);
  }
}
