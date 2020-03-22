import 'package:cursoflutterhasura/app/shared/custom_combobox/custom_combobox_controller.dart';
import 'package:cursoflutterhasura/app/shared/widgets/label/label_controller.dart';
import 'package:cursoflutterhasura/app/modules/add_produto/add_produto_module.dart';
import 'package:cursoflutterhasura/app/modules/widgets/card_produto/card_produto_controller.dart';
import 'package:cursoflutterhasura/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:cursoflutterhasura/app/app_widget.dart';
import 'package:cursoflutterhasura/app/modules/home/home_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CustomComboboxController()),
        Bind((i) => LabelController()),
        Bind((i) => CardProdutoController()),
        Bind((i) => AppController()),

        //outros
        Bind((i) => HasuraConnect("https://loja-hasura-william.herokuapp.com/v1/graphql"))
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/addproduto', module: AddProdutoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
