import 'package:facebook_aula/telas/home.dart';
import 'package:facebook_aula/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'facebook',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Paletacores.scaffold
    ),
    home: Home(),
  ));
}