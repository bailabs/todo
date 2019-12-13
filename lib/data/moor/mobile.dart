import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;

import 'base.dart';
import 'database.dart';

class Mobile extends Base {
  @override
  Database constructDb() {
    final executor = LazyDatabase(() async {
      final dir = await paths.getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'db.sqlite'));
      return VmDatabase(file);
    });
    return Database(executor);
  }
}
