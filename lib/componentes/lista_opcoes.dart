import 'package:facebook_aula/componentes/botao_imagem_perfil.dart';
import 'package:facebook_aula/modelos/modelos.dart';
import 'package:facebook_aula/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
class ListaOpcoes extends StatelessWidget {


  final Usuario usuario;
  final List<List> _opcoes = const [
    [LineIcons.userFriends, Paletacores.azulFacebook, 'Amigos'],
    [LineIcons.facebookMessenger, Paletacores.azulFacebook, 'Mensagens'],
    [LineIcons.flag, Colors.orange, 'Página'],
    [LineIcons.users, Paletacores.azulFacebook, 'Grupos'],
    [Icons.storefront_outlined, Paletacores.azulFacebook, 'Marketplace'],
    [Icons.ondemand_video, Colors.red, 'Assistir'],
    [LineIcons.calendar, Colors.deepPurple, 'Eventos'],
    [LineIcons.chevronCircleDown, Colors.black45, 'Ver mais'],

  ];

  const ListaOpcoes({Key? key,
  required this.usuario
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount:  1 +  _opcoes.length,
          itemBuilder: (context, indice){

            if(indice == 0){
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                child:  BotaoImagemPerfil(
                  usuario: usuario,
                  onTap: (){},
                ),
              );
            }
            List item = _opcoes[indice - 1];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),

              child: Opcao(
                  icone: item[0],
                  cor: item[1],
                  texto: item[2],
                  ontap: (){},
              ),

            );
          }
      ),
    );
  }
}


class Opcao extends StatelessWidget {

  final IconData icone;
  final Color cor;
  final String texto;
  final VoidCallback ontap;


  const Opcao({Key? key,
  required this.icone,
    required this.cor,
    required this.texto,
    required this.ontap

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, color: cor, size: 36,),
          SizedBox(width: 4,),
          Flexible(child: Text(texto, style: TextStyle(
            fontSize: 16,
          ),
            overflow: TextOverflow.ellipsis,
          )
          )
        ],
      ),
    );
  }
}
