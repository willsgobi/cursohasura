// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateProdutoController on _UpdateProdutoControllerBase, Store {
  final _$descricaoAtom = Atom(name: '_UpdateProdutoControllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.context.enforceReadPolicy(_$descricaoAtom);
    _$descricaoAtom.reportObserved();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.context.conditionallyRunInAction(() {
      super.descricao = value;
      _$descricaoAtom.reportChanged();
    }, _$descricaoAtom, name: '${_$descricaoAtom.name}_set');
  }

  final _$selectedCategoriaAtom =
      Atom(name: '_UpdateProdutoControllerBase.selectedCategoria');

  @override
  TipoECategoriaDto get selectedCategoria {
    _$selectedCategoriaAtom.context.enforceReadPolicy(_$selectedCategoriaAtom);
    _$selectedCategoriaAtom.reportObserved();
    return super.selectedCategoria;
  }

  @override
  set selectedCategoria(TipoECategoriaDto value) {
    _$selectedCategoriaAtom.context.conditionallyRunInAction(() {
      super.selectedCategoria = value;
      _$selectedCategoriaAtom.reportChanged();
    }, _$selectedCategoriaAtom, name: '${_$selectedCategoriaAtom.name}_set');
  }

  final _$selectedTipoAtom =
      Atom(name: '_UpdateProdutoControllerBase.selectedTipo');

  @override
  TipoECategoriaDto get selectedTipo {
    _$selectedTipoAtom.context.enforceReadPolicy(_$selectedTipoAtom);
    _$selectedTipoAtom.reportObserved();
    return super.selectedTipo;
  }

  @override
  set selectedTipo(TipoECategoriaDto value) {
    _$selectedTipoAtom.context.conditionallyRunInAction(() {
      super.selectedTipo = value;
      _$selectedTipoAtom.reportChanged();
    }, _$selectedTipoAtom, name: '${_$selectedTipoAtom.name}_set');
  }

  final _$valorAtom = Atom(name: '_UpdateProdutoControllerBase.valor');

  @override
  String get valor {
    _$valorAtom.context.enforceReadPolicy(_$valorAtom);
    _$valorAtom.reportObserved();
    return super.valor;
  }

  @override
  set valor(String value) {
    _$valorAtom.context.conditionallyRunInAction(() {
      super.valor = value;
      _$valorAtom.reportChanged();
    }, _$valorAtom, name: '${_$valorAtom.name}_set');
  }

  final _$updateProdutoAtom =
      Atom(name: '_UpdateProdutoControllerBase.updateProduto');

  @override
  ProdutoTipoCategoriaProdutoDto get updateProduto {
    _$updateProdutoAtom.context.enforceReadPolicy(_$updateProdutoAtom);
    _$updateProdutoAtom.reportObserved();
    return super.updateProduto;
  }

  @override
  set updateProduto(ProdutoTipoCategoriaProdutoDto value) {
    _$updateProdutoAtom.context.conditionallyRunInAction(() {
      super.updateProduto = value;
      _$updateProdutoAtom.reportChanged();
    }, _$updateProdutoAtom, name: '${_$updateProdutoAtom.name}_set');
  }

  final _$salvarAsyncAction = AsyncAction('salvar');

  @override
  Future<bool> salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  final _$_UpdateProdutoControllerBaseActionController =
      ActionController(name: '_UpdateProdutoControllerBase');

  @override
  dynamic setDescricao(String _desc) {
    final _$actionInfo =
        _$_UpdateProdutoControllerBaseActionController.startAction();
    try {
      return super.setDescricao(_desc);
    } finally {
      _$_UpdateProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    final _$actionInfo =
        _$_UpdateProdutoControllerBaseActionController.startAction();
    try {
      return super.setSelectedCategoria(_selectedCategoria);
    } finally {
      _$_UpdateProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    final _$actionInfo =
        _$_UpdateProdutoControllerBaseActionController.startAction();
    try {
      return super.setSelectedTipo(_selectedTipo);
    } finally {
      _$_UpdateProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValor(String _valor) {
    final _$actionInfo =
        _$_UpdateProdutoControllerBaseActionController.startAction();
    try {
      return super.setValor(_valor);
    } finally {
      _$_UpdateProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'descricao: ${descricao.toString()},selectedCategoria: ${selectedCategoria.toString()},selectedTipo: ${selectedTipo.toString()},valor: ${valor.toString()},updateProduto: ${updateProduto.toString()}';
    return '{$string}';
  }
}
