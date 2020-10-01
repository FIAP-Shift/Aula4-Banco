// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databaseManager.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorDatabaseManager {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseManagerBuilder databaseBuilder(String name) =>
      _$DatabaseManagerBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseManagerBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseManagerBuilder(null);
}

class _$DatabaseManagerBuilder {
  _$DatabaseManagerBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$DatabaseManagerBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseManagerBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseManager> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$DatabaseManager();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseManager extends DatabaseManager {
  _$DatabaseManager([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookDao _bookDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Book` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `author` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookDao get bookDao {
    return _bookDaoInstance ??= _$BookDao(database, changeListener);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _bookInsertionAdapter = InsertionAdapter(
            database,
            'Book',
            (Book item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'author': item.author
                }),
        _bookDeletionAdapter = DeletionAdapter(
            database,
            'Book',
            ['id'],
            (Book item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'author': item.author
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _bookMapper = (Map<String, dynamic> row) => Book(
      id: row['id'] as int,
      name: row['name'] as String,
      author: row['author'] as String);

  final InsertionAdapter<Book> _bookInsertionAdapter;

  final DeletionAdapter<Book> _bookDeletionAdapter;

  @override
  Future<List<Book>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Book', mapper: _bookMapper);
  }

  @override
  Future<int> insertBook(Book book) {
    return _bookInsertionAdapter.insertAndReturnId(
        book, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteBook(Book book) {
    return _bookDeletionAdapter.deleteAndReturnChangedRows(book);
  }
}
