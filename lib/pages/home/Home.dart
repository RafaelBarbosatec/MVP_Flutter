import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvp_example/domain/Book/Book.dart';
import 'package:flutter_mvp_example/localization/Localizations.dart';
import 'package:flutter_mvp_example/pages/home/HomePresenter.dart';

class Home extends StatefulWidget {

  final state = new _HomePageState();

  @override
  _HomePageState createState() => state;

}

class _HomePageState extends State<Home> implements BookViewContract{

  MyLocalizations stringLocations ;
  HomePresenter _presenter;
  bool _isLoading = false;
  List _books = new List();

  _HomePageState() {
    _presenter = new HomePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadBooks();
  }

  @override
  Widget build(BuildContext context) {

    stringLocations = MyLocalizations.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: Text(stringLocations.trans('tittle_home')),
      ),
      body: new Container(
        child: _isLoading? _getProgress() : _getListViewWidget(),
      ),
    );

  }

  Widget _getProgress(){

    return new Container(
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }

  Widget _getListViewWidget(){

    var list = new ListView.builder(
        itemCount: _books.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index){
          return _books[index];
        }
    );

    RefreshIndicator refreshIndicator = new RefreshIndicator(
        onRefresh: myRefresh,
        child: list
    );

    return refreshIndicator;

  }

  Future<Null> myRefresh() async{

    _presenter.loadBooks();

    return null;
  }

  @override
  void onLoadBooksComplete(List<Book> items) {
    setState(() {
      _isLoading = false;
      _books = items;
    });
  }

  @override
  void onLoadError() {
    print("onLoadError");
  }

}
