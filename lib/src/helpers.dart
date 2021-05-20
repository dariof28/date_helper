extension DateTimeHelpers on DateTime {
  /// Get the start of the date (midnight)
  DateTime get dayStart => DateTime(this.year, this.month, this.day);

  /// Get the end if the date (23:59 aka 11:59PM)
  DateTime get dayEnd => DateTime(this.year, this.month, this.day, 23, 59);

  /// Determine if is AM
  bool get isAM => this.hour < 12;

  /// Determine if is PM
  bool get isPM => !this.isAM;

  /// Get the day after today
  DateTime get tomorrow => this.add(Duration(days: 1));

  /// Get the day prior today
  DateTime get yesterday => this.subtract(Duration(days: 1));

  /// Get the following weekday
  DateTime following(int weekday) {
    assert(weekday >= DateTime.monday && weekday <= DateTime.sunday);

    int offset = weekday - this.weekday;
    if (offset <= 0) {
      offset += 7;
    }

    return this.add(Duration(days: offset));
  }

  /// Get the previous weekday
  DateTime previous(int weekday) {
    assert(weekday >= DateTime.monday && weekday <= DateTime.sunday);

    int offset = this.weekday - weekday;
    if (offset <= 0) {
      offset += 7;
    }

    return this.subtract(Duration(days: offset));
  }
}
