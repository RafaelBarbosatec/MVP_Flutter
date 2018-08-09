
import 'dart:async';
import 'package:flutter_mvp_example/conection/Api.dart';
import 'package:flutter_mvp_example/domain/Book/Book.dart';

class BookRepository{

  final api = Api();
  final bool prod;

  BookRepository(this.prod);

  Future<List<Book>> get() async {

      return prod ? _server() : _local();

  }

  Future<List<Book>> _server() async{

    final List books = await api.get("books.json");

    return books.map( (book) => new Book.fromMap(book)).toList();

  }

  List<Book> _local() {

    List<Book> list = List<Book>();

    Book book = Book("1", "Nome", "data", "", "breve descricao");

    list.add(book);
    list.add(book);
    list.add(book);
    list.add(book);
    list.add(book);

    return list;

  }


}