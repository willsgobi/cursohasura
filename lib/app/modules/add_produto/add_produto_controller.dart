import 'package:cursoflutterhasura/app/modules/add_produto/models/tipo_categoria_produto.dart';
import 'package:cursoflutterhasura/app/modules/add_produto/repositories/add_produto_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoControllerBase
    with _$AddProdutoController;

abstract class _AddProdutoControllerBase with Store {

  final AddProdutoRepository addProdutoRepository;

  _AddProdutoControllerBase(this.addProdutoRepository){
    addProdutoRepository.getTipoCategoriaProduto().then((data){
      tipoProduto = data;
    });
  }

  @observable
  String descricao = "";

  @action
  setDescricao(String _desc){
    descricao = _desc;
  }

  @observable
  TipoECategoriaDto selectedCategoria;

  @action
  setSelectedCategoria(TipoECategoriaDto _selectedCategoria){
    selectedCategoria = _selectedCategoria;
  }

  @observable
  TipoECategoriaDto selectedTipo;

  @action
  setSelectedTipo(TipoECategoriaDto _selectedTipo){
    selectedTipo = _selectedTipo;
  }

  @observable
  String valor = "";

  @action
  setValor(String _valor){
    valor = _valor;
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

  @action
  Future<bool> salvar() async {

    if(descricao!=null && valor!= null && selectedTipo.descricao != null && selectedCategoria.descricao != null){
      return await addProdutoRepository.addProduto(descricao, valor, selectedCategoria.id, selectedTipo.id);
    }
    return false;
  }
}
