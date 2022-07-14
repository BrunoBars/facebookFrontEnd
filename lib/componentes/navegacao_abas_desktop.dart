import 'package:facebook_aula/componentes/botao_imagem_perfil.dart';
import 'package:facebook_aula/componentes/navegacao_abas.dart';
import 'package:facebook_aula/modelos/usuario.dart';
import 'package:facebook_aula/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'botão_circulo.dart';
class NavegacaoAbasDesktop extends StatelessWidget {

  final Usuario usuario;
  final List<IconData> icones;
  final int indiceAbasSelecionadas;
  final Function(int) onTap;

  const NavegacaoAbasDesktop({Key? key,

    required this.icones,
    required this.usuario,
    required this.indiceAbasSelecionadas,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4
          )
        ]
      ),
      child: Row(
        children: [
          Expanded(child:
          Text(
            'Brunobook',
            style: TextStyle(
                color: Paletacores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -1.2
            ),
          ),

          ),
          Expanded(child:
          navegacaoAbas(
            icones: icones,
            indiceAbasSelecionadas: indiceAbasSelecionadas,
            onTap:onTap,
            indicadorEmbaixo: true,
          ),


          ),
          Expanded(
              child: Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children: [
                  BotaoImagemPerfil(
                      usuario: usuario,
                      onTap: (){}
                      ),
                  BotaoCirculo(
                    icone: Icons.search,
                    iconeTamanho: 30,
                    onPressed: (){

                    },


                  ),

                  BotaoCirculo(
                    icone: LineIcons.facebookMessenger,
                    iconeTamanho: 30,
                    onPressed: (){

                    },


                  )

                ],
              ))
        ],
      ),
    );
  }
}
