import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_aula/componentes/imagem_perfil.dart';
import 'package:facebook_aula/modelos/postagem.dart';
import 'package:facebook_aula/uteis/paleta_cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CartaoPostagem extends StatelessWidget {

  final Postagem postagem;
  const CartaoPostagem({
    Key? key,
    required this.postagem

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),

      child:  Column(
        children: [
          //Cabeçalho
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CabecalhoPostagem(postagem: postagem),
                Text(postagem.descricao)
              ],
            ),
          ),
          //imagem postagem
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(imageUrl: postagem.urlImagem,),
            ),
          //area de estátisticas
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
            child: EstatisticaPostagem(
              postagem: postagem,
            ),
    ),
        ],
      )
    );
  }
}



class EstatisticaPostagem extends StatelessWidget {

  final Postagem postagem;


  const EstatisticaPostagem({

    Key? key,
  required this.postagem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Paletacores.azulFacebook,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.thumb_up,
                size: 17,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4,),
            Expanded(
              child: Text(
                '${postagem.curtidas}',
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
            ),
            Text(
              '${postagem.comentarios} comentarios',
              style: TextStyle(
                  color: Colors.grey
              ),
            ),
            SizedBox(width: 10,),

            Text(
              '${postagem.compartilhamentos} compartilhamentos',
              style: TextStyle(
                  color: Colors.grey
              ),
            )
          ],

        ),
        Divider(thickness: 1.2,),
        Row(
          children: [
            
            BotaoPostagem(
                icone: Icon(
                  LineIcons.thumbsUpAlt,
                  color: Colors.grey,
                )
                ,
                texto: 'Curtir',
                ontap: (){}
            ),
            BotaoPostagem(
                icone: Icon(
                  LineIcons.alternateCommentAlt,
                  color: Colors.grey,
                )
                ,
                texto: 'Comentar',
                ontap: (){}
            ),
            BotaoPostagem(
                icone: Icon(
                  LineIcons.share,
                  color: Colors.grey,
                )
                ,
                texto: 'Compartilhar',
                ontap: (){}
            ),

          ],
        ),
      ],
    );
  }
}


class BotaoPostagem extends StatelessWidget {
  final Icon icone;
  final String texto;
  final VoidCallback ontap;
  const BotaoPostagem({
    Key? key,
  required this.icone,
  required this.texto,
  required this.ontap

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:  Material(
          child: InkWell(
            onTap: ontap,
            child: Container(
              child: Row(
                children: [
                  icone,
                  SizedBox(width: 4,),
                  Text(
                    texto,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),
                  )


                ],
              ),
            ),
          ),
        )
    );
  }
}






class CabecalhoPostagem extends StatelessWidget {

  final Postagem postagem;

  const CabecalhoPostagem({
    Key? key,
    required this.postagem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
            urlImagem: postagem.usuario.urlImagem,
          foiVisualizado: true,
        ),
    SizedBox(width: 8,),

       Expanded(
         child:
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(postagem.usuario.nome, style: TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.bold
           ),),

           Row(
             children: [
               Text('${postagem.tempoAtras} - ', ),
               Icon(Icons.public, size: 12, color: Colors.grey,)
             ],
           )

         ],
       ),),



        IconButton(
          onPressed: (){},
          icon: Icon(Icons.more_horiz),
        )
      ],
    );
  }
}
