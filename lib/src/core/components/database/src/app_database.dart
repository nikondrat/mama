import 'package:drift/drift.dart';
import 'package:mama/src/core/components/database/database.dart';
import 'package:mama/src/data.dart';

part 'app_database.g.dart';

/// The drift-managed database configuration
@DriftDatabase()
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? createExecutor());

  @override
  int get schemaVersion => 1;
}
