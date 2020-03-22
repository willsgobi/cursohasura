import 'dart:convert';
import 'package:cursoflutterhasura/app/modules/add_produto/models/tipo_categoria_produto.dart';

class ProdutoTipoCategoriaProdutoDto {
  final List<TipoECategoriaDto> tipoProduto;
  final List<TipoECategoriaDto> categoriaProduto;
  final Produto produto;

  ProdutoTipoCategoriaProdutoDto({
    this.tipoProduto,
    this.categoriaProduto,
    this.produto,
  });

  ProdutoTipoCategoriaProdutoDto copyWith({
    List<TipoECategoriaDto> tipoProduto,
    List<TipoECategoriaDto> categoriaProduto,
    Produto produtoByPk,
  }) =>
      ProdutoTipoCategoriaProdutoDto(
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
        produto: produtoByPk ?? this.produto,
      );

  factory ProdutoTipoCategoriaProdutoDto.fromJson(String str) => ProdutoTipoCategoriaProdutoDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProdutoTipoCategoriaProdutoDto.fromMap(Map<String, dynamic> json) => ProdutoTipoCategoriaProdutoDto(
    tipoProduto: List<TipoECategoriaDto>.from(json["tipo_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
    categoriaProduto: List<TipoECategoriaDto>.from(json["categoria_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
    produto: Produto.fromMap(json["produto_by_pk"]),
  );

  Map<String, dynamic> toMap() => {
    "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
    "categoria_produto": List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
    "produto_by_pk": produto.toMap(),
  };
}

class Produto {
  final String id;
  final String nome;
  final String tipoProdutoId;
  final String valor;
  final TipoECategoriaDto categoriaProduto;
  final TipoECategoriaDto tipoProduto;

  Produto({
    this.id,
    this.nome,
    this.tipoProdutoId,
    this.valor,
    this.categoriaProduto,
    this.tipoProduto,
  });

  Produto copyWith({
    String id,
    String nome,
    String tipoProdutoId,
    String valor,
    TipoECategoriaDto categoriaProduto,
    TipoECategoriaDto tipoProduto,
  }) =>
      Produto(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        tipoProdutoId: tipoProdutoId ?? this.tipoProdutoId,
        valor: valor ?? this.valor,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
        tipoProduto: tipoProduto ?? this.tipoProduto,
      );

  factory Produto.fromJson(String str) => Produto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
    id: json["id"],
    nome: json["nome"],
    tipoProdutoId: json["tipo_produto_id"],
    valor: json["valor"],
    categoriaProduto: TipoECategoriaDto.fromMap(json["categoria_produto"]),
    tipoProduto: TipoECategoriaDto.fromMap(json["tipo_produto"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nome": nome,
    "tipo_produto_id": tipoProdutoId,
    "valor": valor,
    "categoria_produto": categoriaProduto.toMap(),
    "tipo_produto": tipoProduto.toMap(),
  };
}
