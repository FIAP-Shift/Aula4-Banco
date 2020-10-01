import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_shift_bd/nosql/dao/bookDao.dart';
import 'package:flutter_shift_bd/nosql/model/book.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

part 'databaseManager.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Book])
abstract class DatabaseManager extends FloorDatabase {
  BookDao get bookDao;
}