import 'package:cursoflutterhasura/app/modules/add_produto/models/tipo_categoria_produto.dart';
import 'package:cursoflutterhasura/app/modules/home/repositories/update_produto_repository.dart';
import 'package:mobx/mobx.dart';

import '../../models/produto_tipo_categoria_produto_dto.dart';

part 'update_produto_controller.g.dart';

class UpdateProdutoController = _UpdateProdutoControllerBase
    with _$UpdateProdutoController;

abstract class _UpdateProdutoControllerBase with Store {
  final UpdateProdutoRepository updateProdutoRepository;
  final String idProduto;

  _UpdateProdutoControllerBase(this.updateProdutoRepository, this.idProduto) {
    updateProdutoRepository
        .getProdutoTipoCategoriaProduto(idProduto)
        .then((data) {
      updateProduto = data;
      valor = updateProduto.produto.valor;
      descricao = updateProduto.produto.nome;
      selectedCategoria = updateProduto.produto.categoriaProduto;
      selectedTipo = updateProduto.produto.tipoProduto;
    });
  }

  @observable
  String descricao = "";

  @action
  setDescricao(String _desc) {
    descricao = _desc;
  }

  @observable
  TipoECategoriaDto selectedCategoria;

  @action
  setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    selectedCategoria = _selectedCategoria;
  }

  @observable
  TipoECategoriaDto selectedTipo;

  @action
  setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    selectedTipo = _selectedTipo;
  }

  @observable
  String valor = "";

  @action
  setValor(String _valor) {
    valor = _valor;
  }

  @observable
  ProdutoTipoCategoriaProdutoDto updateProduto;

  @action
  Future<bool> salvar() async {
    if (descricao != null &&
        valor != null &&
        selectedTipo.descricao != null &&
        selectedCategoria.descricao != null) {
      return await updateProdutoRepository.updateProduto(
          idProduto: idProduto,
          descricao: descricao,
          valor: valor,
          selectedCategoria: selectedCategoria.id,
          selectedTipo: selectedTipo.id
      );
    }
    return false;
  }
}
