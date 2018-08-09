
import 'dart:async';
import 'package:flutter_mvp_example/domain/Book/BookRepository.dart';

class Repository {

  final bool _prod;

  Repository(this._prod);

  BookRepository getBookRepository(){
    return new BookRepository(_prod);
  }

}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}