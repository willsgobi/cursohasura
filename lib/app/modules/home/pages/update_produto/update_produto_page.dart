import 'package:cursoflutterhasura/app/modules/add_produto/models/tipo_categoria_produto.dart';
import 'package:cursoflutterhasura/app/modules/home/pages/update_produto/update_produto_controller.dart';
import 'package:cursoflutterhasura/app/shared/custom_combobox/custom_combobox_widget.dart';
import 'package:cursoflutterhasura/app/shared/widgets/label/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_module.dart';

class UpdateProdutoPage extends StatefulWidget {
  final String idProduto;
  final String title;
  const UpdateProdutoPage({Key key, this.title = "UpdateProduto", @required this.idProduto})
      : super(key: key);

  @override
  _UpdateProdutoPageState createState() => _UpdateProdutoPageState(idProduto);
}

class _UpdateProdutoPageState
    extends ModularState<UpdateProdutoPage, UpdateProdutoController> {
  _UpdateProdutoPageState(this.id);

  final String id;

  @override
  Widget build(BuildContext context) {
    var controller = HomeModule.to.get<UpdateProdutoController>({"id": id});
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LabelWidget(title: "Nome"),
            SizedBox(
              height: 10,
            ),
            Observer(
              builder: (BuildContext context) {
                return TextField(
                  controller: TextEditingController(text: controller.descricao),
                  onChanged: controller.setDescricao,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                      hintText: "insira o nome",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2))),
                );
              },

            ),
            SizedBox(
              height: 20,
            ),
            LabelWidget(title: "Categoria"),
            SizedBox(
              height: 10,
            ),
            Observer(
              builder: (BuildContext context){
                if(controller.updateProduto == null){
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(width: 2, color: Theme.of(context).primaryColor,)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      )
                  );
                }
                return CustomComboboxWidget(
                  items: controller.updateProduto.categoriaProduto.map((data)=>Model(data.id,data.descricao)).toList(),
                  onChange: (tipo) => controller.setSelectedCategoria(TipoECategoriaDto(id: tipo.id, descricao: tipo.descricao)),
                  itemSelected: controller.selectedCategoria == null ? null : Model(controller.selectedCategoria.id, controller.selectedCategoria.descricao),
                );
              },
            ),
            LabelWidget(title: "Tipo"),
            SizedBox(
              height: 10,
            ),
            Observer(
                builder: (BuildContext context) {
                  if(controller.updateProduto == null){
                    return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(width: 2, color: Theme.of(context).primaryColor,)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        )
                    );
                  }
                  return CustomComboboxWidget(
                    items: controller.updateProduto.tipoProduto.map((data)=>Model(data.id,data.descricao)).toList(),
                    onChange: (tipo) => controller.setSelectedTipo(TipoECategoriaDto(id: tipo.id, descricao: tipo.descricao)),
                    itemSelected: controller.selectedTipo == null ? null : Model(controller.selectedTipo.id, controller.selectedTipo.descricao),
                  );
                }
            ),
            LabelWidget(title: "Preço"),
            SizedBox(
              height: 10,
            ),
            Observer(
              builder: (BuildContext context) {
                return TextField(
                  controller: TextEditingController(text: controller.valor),
                  onChanged: controller.setValor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "R\$ ",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2))),
                );
              },

            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Salvar", style: TextStyle(color: Colors.white, fontSize: 25),),
                ),
                onPressed: () async {
                  var result = await controller.salvar();
                  if(result ==true){
                    Navigator.of(context).pop();
                  } else {
                    showDialog(
                        context: context,
                        child: AlertDialog(
                          content: Text("Ocorreu um erro ao salvar"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Fechar"),
                              onPressed: (){Navigator.of(context).pop();},
                            )
                          ],
                        )
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
