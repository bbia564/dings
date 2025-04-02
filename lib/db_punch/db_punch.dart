
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:punch_in/db_punch/punch_entity.dart';
import 'package:sqflite/sqflite.dart';


class DBPunch extends GetxService {
  late Database dbBase;

  Future<DBPunch> init() async {
    await createPunchDB();
    return this;
  }

  createPunchDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'punch.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createPunchTable(db);
        });
  }

  createPunchTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS punch (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, punchTime TEXT)');
  }

  insertPunch(PunchEntity entity) async {
    final id = await dbBase.insert('punch', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'punchTime': entity.punchTime.toIso8601String(),
    });
    return id;
  }

  updatePunch(PunchEntity entity) async {
    await dbBase.update('punch', {
      'punchTime': entity.punchTime.toIso8601String(),
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanPunchData() async {
    await dbBase.delete('punch');
  }

  Future<List<PunchEntity>> getPunchAllData() async {
    var result = await dbBase.query('punch', orderBy: 'createdTime DESC');
    return result.map((e) => PunchEntity.fromJson(e)).toList();
  }
}
