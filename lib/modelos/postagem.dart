import 'package:facebook_aula/modelos/usuario.dart';
import 'package:flutter/material.dart';

class Postagem {

  Usuario usuario;
  String descricao;
  String tempoAtras;
  String urlImagem;
  int curtidas;
  int comentarios;
  int compartilhamentos;

  Postagem({
required this.usuario,
required this.descricao,
required this.tempoAtras,
required this.urlImagem,
required this.curtidas,
required this.comentarios,
required this.compartilhamentos,

});
}