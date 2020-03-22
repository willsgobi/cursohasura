import 'package:cursoflutterhasura/app/modules/widgets/card_produto/card_produto_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'home_module.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  HomeController homeController = HomeModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
              itemCount: homeController.listaProdutos.length,
              itemBuilder: (BuildContext context, int index) {
                return CardProdutoWidget(
                  idProduto: homeController.listaProdutos[index].id,
                  nomeProduto: homeController.listaProdutos[index].nome,
                  valor: "R\$ ${homeController.listaProdutos[index].valor.toStringAsFixed(2).replaceAll('.', ',')}",
                  categoriaProduto: homeController.listaProdutos[index].categoriaProduto.descricao,
                  tipoProduto: homeController.listaProdutos[index].tipoProduto.descricao,
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addproduto');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
