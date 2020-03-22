import 'package:cursoflutterhasura/app/app_module.dart';
import 'package:cursoflutterhasura/app/modules/home/pages/update_produto/update_produto_controller.dart';
import 'package:cursoflutterhasura/app/modules/home/pages/update_produto/update_produto_page.dart';
import 'package:cursoflutterhasura/app/modules/home/repositories/home_repository.dart';
import 'package:cursoflutterhasura/app/modules/home/home_controller.dart';
import 'package:cursoflutterhasura/app/modules/home/repositories/update_produto_repository.dart';
import 'package:cursoflutterhasura/app/modules/widgets/card_produto/card_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cursoflutterhasura/app/modules/home/home_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //controllers
        Bind((i) => CardProdutoController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),

        Bind((i) => UpdateProdutoController(i.get<UpdateProdutoRepository>(), i.params["id"])),

        //repositories
        Bind((i) => UpdateProdutoRepository(AppModule.to.get<HasuraConnect>())),
        Bind((i) => HomeRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/updateproduto/:id', child: (_, args) => UpdateProdutoPage(idProduto: args.params['id'],)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
