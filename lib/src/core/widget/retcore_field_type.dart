/// Enum defining the preset types for [RetCoreField].
/// Each type comes with its own default keyboard configuration and validation logic.
enum RetCoreFieldType {
  /// Standard text input with no specific validation.
  text,

  /// Email input with email keyboard and regex validation.
  email,

  /// Phone input with dial pad and numeric validation.
  phone,

  /// URL input with URL keyboard and format validation.
  url,

  /// Numeric input with decimal support and number keyboard.
  number,
}
