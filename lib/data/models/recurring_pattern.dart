// Export the Drift-generated class
export '../database/database.dart' show RecurringPattern;

// Define the enum manually since we store it as text in Drift
enum RecurrenceType { daily, weekly, monthly, yearly, custom }
