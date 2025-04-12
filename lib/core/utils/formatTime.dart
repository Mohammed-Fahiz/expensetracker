class FormatTimeFunctions {
  static String convertIsoToDateAndTimeFormatted({required String isoDate}) {
    DateTime dateTime = DateTime.parse(isoDate);

    // Format the date
    String formattedDate =
        "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";

    // Format the time with AM/PM
    int hour = dateTime.hour;
    String period = hour >= 12 ? "PM" : "AM";
    hour = hour % 12 == 0 ? 12 : hour % 12; // Convert to 12-hour format
    String formattedTime =
        "${hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} $period";

    return "$formattedDate $formattedTime";
  }
}
