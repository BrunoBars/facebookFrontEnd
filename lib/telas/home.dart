import 'package:facebook_aula/componentes/area_criar_post.dart';
import 'package:facebook_aula/componentes/areas_estorias.dart';
import 'package:facebook_aula/componentes/bot%C3%A3o_circulo.dart';
import 'package:facebook_aula/componentes/cartao_postagem.dart';
import 'package:facebook_aula/componentes/lista_contatos.dart';
import 'package:facebook_aula/componentes/lista_opcoes.dart';
import 'package:facebook_aula/dados/dados.dart';
import 'package:facebook_aula/modelos/postagem.dart';
import 'package:facebook_aula/uteis/paleta_cores.dart';
import 'package:facebook_aula/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
final TrackingScrollController _scrollController = TrackingScrollController();

@override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Responsivo(
            mobile: HomeMobile(scrollController: _scrollController,),
            desktop:  HomeDesktop(scrollController: _scrollController,),
          )
      ),
    );
  }
}


class HomeMobile extends StatelessWidget {

  final TrackingScrollController scrollController;


  const HomeMobile({Key? key,
  required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: Text(
            'Brunobook',
            style: TextStyle(
                color: Paletacores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2
            ),
          ),
          actions: [
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
        ),

        SliverToBoxAdapter(
          child: AreaCriarPostagem(
            usuario: usuarioAtual,
          ),
        ),
        SliverPadding(
          padding:EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaStoria(
              usuario: usuarioAtual,
              estoria: estorias,
            ),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(

                (context, indice){
              Postagem postagem = postagens[indice];
              return CartaoPostagem(
                  postagem: postagem
              );

            },
            childCount: postagens.length
        )
        )

      ],
    );
  }
}
class HomeDesktop extends StatelessWidget {

  final TrackingScrollController scrollController;

  const HomeDesktop({Key? key,
  required this.scrollController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ListaOpcoes(
                usuario: usuarioAtual,
              ),
            )
            ),
        Spacer(),
        Flexible(
          flex: 5,
          child: CustomScrollView(
            controller: scrollController,

            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: AreaStoria(
                    usuario: usuarioAtual,
                    estoria: estorias,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: AreaCriarPostagem(
                  usuario: usuarioAtual,
                ),
              ),

              SliverList(delegate: SliverChildBuilderDelegate(

                      (context, indice) {
                    Postagem postagem = postagens[indice];
                    return CartaoPostagem(
                        postagem: postagem
                    );
                  },
                  childCount: postagens.length
              )
              )

            ],
          ),
        ),
        Spacer(),
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ListaContatos(
                  usuarios: usuariosOnline)
            )
        ),
      ],
    );
  }
}

