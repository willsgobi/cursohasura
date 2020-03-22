import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:cursoflutterhasura/app/modules/add_produto/add_produto_module.dart';
import 'package:cursoflutterhasura/app/modules/add_produto/models/tipo_categoria_produto.dart';
import 'package:cursoflutterhasura/app/shared/custom_combobox/custom_combobox_widget.dart';
import 'package:cursoflutterhasura/app/shared/widgets/label/label_widget.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'add_produto_controller.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;

  const AddProdutoPage({Key key, this.title = "Adicionar"}) : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState
    extends ModularState<AddProdutoPage, AddProdutoController> {
  //use 'controller' variable to access controller
  AddProdutoController controller = AddProdutoModule.to.get();

  @override
  Widget build(BuildContext context) {
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
            TextField(
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
                if(controller.tipoProduto == null){
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
                  items: controller.tipoProduto.categoriaProduto.map((data)=>Model(data.id,data.descricao)).toList(),
                  onChange: (tipo) => controller.setSelectedCategoria(TipoECategoriaDto(id: tipo.id, descricao: tipo.descricao)),
                  itemSelected: null,
                );
              },
            ),
            LabelWidget(title: "Tipo"),
            SizedBox(
              height: 10,
            ),
            Observer(
              builder: (BuildContext context) {
                if(controller.tipoProduto == null){
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
                  items: controller.tipoProduto.tipoProduto.map((data)=>Model(data.id,data.descricao)).toList(),
                  onChange: (tipo) => controller.setSelectedTipo(TipoECategoriaDto(id: tipo.id, descricao: tipo.descricao)),
                  itemSelected: null,
                );
              }
            ),
            LabelWidget(title: "Preço"),
            SizedBox(
              height: 10,
            ),
            TextField(
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
