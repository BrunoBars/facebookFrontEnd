import 'package:facebook_aula/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
class navegacaoAbas extends StatelessWidget {

  final List<IconData> icones;
  final int indiceAbasSelecionadas;
  final Function(int) onTap;
  final bool indicadorEmbaixo;



  const navegacaoAbas({Key? key,
  required this.icones,
  required this.indiceAbasSelecionadas,
  required this.onTap,
    this.indicadorEmbaixo = false


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
        indicator:  BoxDecoration(
          border: indicadorEmbaixo
              ? Border(
              bottom: BorderSide(
                  color: Paletacores.azulFacebook,
                  width: 5
              )
          ): Border(
              top: BorderSide(
                  color: Paletacores.azulFacebook,
                  width: 5
              )
          )
        ),
        tabs: icones.asMap().map((indice, icone){
          return MapEntry (indice,Tab(
            icon: Icon(icone,
              color: indiceAbasSelecionadas == indice
              ? Paletacores.azulFacebook
              :Colors.black38,
              size:35,
            ),
          ));
        }).values.toList()
    );
  }
}
