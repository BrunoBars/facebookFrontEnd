import 'package:facebook_aula/componentes/navegacao_abas.dart';
import 'package:facebook_aula/componentes/navegacao_abas_desktop.dart';
import 'package:facebook_aula/dados/dados.dart';
import 'package:facebook_aula/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'home.dart';

class principal extends StatefulWidget {
  const principal({Key? key}) : super(key: key);

  @override
  _principalState createState() => _principalState();
}

class _principalState extends State<principal> {

  final List<Widget> _telas = [
    Home(),
    Scaffold(
      backgroundColor: Colors.orange,
    ),
    Scaffold(
      backgroundColor: Colors.yellow,
    ),
    Scaffold(
      backgroundColor: Colors.blue,
    ),
    Scaffold(
      backgroundColor: Colors.red,
    ),
    Scaffold(
      backgroundColor: Colors.black,
    ),
  ];


  List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,


  ];

  int _indiceAbaSelecionada = 0;


  @override
  Widget build(BuildContext context) {

    final bool isDesktop = Responsivo.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
        length: _icones.length,
        child: Scaffold(
          appBar: isDesktop
          ?  PreferredSize(
              child: NavegacaoAbasDesktop(
                usuario: usuarioAtual,

                  icones: _icones,
                  indiceAbasSelecionadas: _indiceAbaSelecionada,
                  onTap: (indice){
                    setState(() {
                      _indiceAbaSelecionada = indice;
                    });
                  },





              ),
              preferredSize: Size(tamanho.width, 100)
          )

          :null ,
          body: TabBarView(
            //para cancelar a troca de abas por arrastar
            //physics: NeverScrollableScrollPhysics(),
              children: _telas,
          ),
            bottomNavigationBar: isDesktop
             ? null
            :navegacaoAbas(
              icones: _icones,
              indiceAbasSelecionadas: _indiceAbaSelecionada,
              onTap: (indice){
                setState(() {
                  _indiceAbaSelecionada = indice;
                });
              },
            ),

        )
    );
  }
}
