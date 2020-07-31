import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myFindMovies/model/FavoriteList.dart';

class FavoriteDatabase {
  static final _databaseName = "find.db";
  static final _databaseVersion = 1;

  static final table = 'favorites';

  static final columnId = 'id';
  static final columnTitle = 'title';
  static final columnPosterPath = 'posterPath';
  static final columnAverage = 'voteAverage';
  static final columnVideo = 'video';
  static final columnOverview = 'overview';
  static final columnIsMovie = 'isMovie';

  // make this a singleton class
  FavoriteDatabase._privateConstructor();
  static final FavoriteDatabase instance =
      FavoriteDatabase._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId TEXT PRIMARY KEY,
            $columnTitle TEXT NOT NULL,
            $columnOverview TEXT NOT NULL,
            $columnPosterPath TEXT NOT NULL,
            $columnAverage TEXT,
            $columnVideo TEXT,
            $columnIsMovie TEXT
          )
          ''');
  }

  Future<void> insertFavorite(FavoriteList favorite) async {
    // Get a reference to the database.
    final Database db = await database;

    await db.insert(
      'favorites',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<FavoriteList>> getFavorites() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return FavoriteList(
          id: maps[i]['id'],
          title: maps[i]['title'],
          overview: maps[i]['overview'],
          voteAverage: maps[i]['voteAverage'],
          posterPath: maps[i]['posterPath'],
          isMovie: maps[i]['isMovie']);
    });
  }

  Future<void> delete(String id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
