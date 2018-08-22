

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Book extends StatelessWidget{

  final String _cod;
  final String _nome;
  final String _data;
  final String _img;
  final String _descricao;

  const Book(this._cod, this._nome, this._data, this._img, this._descricao);

  Book.fromMap(Map<String, dynamic>  map) :
        _cod = map['cod'],
        _nome = map['nome'],
        _data = map['data'],
        _img = map['img'],
        _descricao = map['descricao'];

  @override
  Widget build(BuildContext context) {

    return new Container(
      height: 95.0,
      margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: new Card(
        elevation: 4.0,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getImage(_img),
            _getColumText(_nome,_data,_descricao),
          ],
        ),
      ),
    );

  }

  Widget _getColumText(tittle,date, description){

    return new Expanded(
        child: new Container(
          margin: new EdgeInsets.only(left: 20.0, right: 10.0, bottom: 10.0, top: 10.0),
          child: new Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              _getTitleWidget(tittle),
              _getDateWidget(date),
              _getDescriptionWidget(description)],
          ),
        )
    );
  }

  Widget _getTitleWidget(String curencyName){
    return new Text(
      curencyName,
      maxLines: 1,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _getDescriptionWidget(String description){
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(description,maxLines: 2,),
    );
  }

  Widget _getDateWidget(String date){
    return new Text(date,
      style: new TextStyle(color: Colors.grey,fontSize: 10.0),);
  }

  Widget _getImage(String img) {

    return FadeInImage.memoryNetwork(placeholder: kTransparentImage,image: _img,fit: BoxFit.cover,width: 60.0,height: 95.0);

  }

}