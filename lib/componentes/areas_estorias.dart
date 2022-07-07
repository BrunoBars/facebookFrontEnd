import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_aula/componentes/imagem_perfil.dart';
import 'package:facebook_aula/dados/dados.dart';
import 'package:facebook_aula/modelos/estoria.dart';
import 'package:facebook_aula/modelos/usuario.dart';
import 'package:facebook_aula/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class AreaStoria extends StatelessWidget {

  final Usuario usuario;
  final List<Estoria> estoria;

  const AreaStoria({
    Key? key,
    required this.usuario,
    required this.estoria

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
          itemCount: 1+ estorias.length,
          itemBuilder:(context,indice){
          if(indice == 0){
            Estoria estoriaUsuario = Estoria(
                usuario: usuarioAtual,
                urlImagem: usuarioAtual.urlImagem
            );
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: CartaoEstoria(
                adcionarEstoria: true,
                estoria: estoriaUsuario,
              ),

            );

          }

          Estoria estoria = estorias[indice - 1];

            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
              child: CartaoEstoria(
                estoria: estoria,
              ),

            );
          } ),
    );
  }
}

class CartaoEstoria extends StatelessWidget {

 final Estoria estoria;
 final bool  adcionarEstoria;

  const CartaoEstoria({
    Key? key,
  required this.estoria,
    this.adcionarEstoria = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: estoria.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),

        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Paletacores.degradeEstoria,
            borderRadius: BorderRadius.circular(12)
          ),
        ),
        Positioned(
          top: 8,
            left: 8,
            child: adcionarEstoria
            ?Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add),
                iconSize: 30,
                color: Paletacores.azulFacebook,
                onPressed: (){},
              ),
            )
                :ImagemPerfil(urlImagem: estoria.usuario.urlImagem,
              foiVisualizado: estoria.foiVisualizado,

            ),

        ),


        Positioned(
          bottom: 8,
          left: 8,
          right: 8,

          child: Text(

            adcionarEstoria ? 'Criar Story': estoria.usuario.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )


      ],

    );
  }
}

