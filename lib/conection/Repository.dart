
import 'package:flutter_mvp_example/domain/Book/BookRepository.dart';

//Classe que controla os repositorios disponíveis no projeto
class Repository {

  final bool _prod;

  Repository(this._prod);

  BookRepository getBookRepository(){
    return new BookRepository(_prod);
  }

}