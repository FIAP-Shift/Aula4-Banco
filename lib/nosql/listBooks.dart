import 'package:flutter/material.dart';
import 'package:flutter_shift_bd/nosql/addBook.dart';
import 'package:flutter_shift_bd/nosql/dao/bookDao.dart';
import 'package:flutter_shift_bd/nosql/database/databaseManager.dart';
import 'package:flutter_shift_bd/nosql/model/book.dart';

class ListBooks extends StatefulWidget {
  @override
  _ListBooksState createState() => _ListBooksState();
}

class _ListBooksState extends State<ListBooks> {

  List<Book> listBooks = List();
  BookDao bookDao;

  //ciclo de vida do State. Ele vai ser chamado no início,
  //e apenas uma vez
  @override
  void initState() {
    super.initState();
    openDatabase();
  }

  openDatabase() async{
    final database = await
    $FloorDatabaseManager
        .databaseBuilder('app_database.db')
        .build();
    bookDao = database.bookDao;
    listBooks = await bookDao.findAll();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Livros"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Future<Book> future = Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddBook(),
                    ));
                future.then((book){
                  if (book != null){
                    insertBook(book);
                  }
                });
              },
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: listBooks.length,
          itemBuilder: (context, index) => buildListItem(listBooks[index]),
          separatorBuilder: (context, index) => Divider(
            height: 1,
          ),
        ),
    );
  }

  Widget buildListItem(Book book){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: Text("${book.id}"),
          title: Text(book.name),
          subtitle: Text(book.author),
          onLongPress: (){
            deleteBook(book);
          },
        ),
      ),
    );
  }

  insertBook(Book book){
    bookDao.insertBook(book).then((value) {
        if (value > 0) {
          setState(() {
            book.id = value;
            listBooks.add(book);
          });
        }
      });
  }

  deleteBook(Book book) {
    bookDao.deleteBook(book).then((value){
      if (value == 1){
        setState(() {
          listBooks.remove(book);
        });
      }
    });
  }
}
