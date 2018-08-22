
import 'package:flutter_mvp_example/conection/Api.dart';
import 'package:flutter_mvp_example/domain/Book/Book.dart';
import 'package:flutter_mvp_example/domain/Book/BookRepository.dart';
import 'package:flutter_mvp_example/injection/Injector.dart';

abstract class BookViewContract {
  void onLoadBooksComplete(List<Book> items);
  void onLoadError();
}

class HomePresenter{

  BookViewContract _view;
  BookRepository _bookRepository;

  HomePresenter(this._view){
    _bookRepository = new Injector().repository.getBookRepository();
  }

  void loadBooks(){
    assert(_view != null);
    print("loadBooks");
    _bookRepository.get()
        .then((books) => _view.onLoadBooksComplete(books))
        .catchError((onError) {

          print(onError);

          if(onError is FetchDataException){
            print("codigo: ${onError.code()}");
          }
          
          _view.onLoadError();
        });
  }

}