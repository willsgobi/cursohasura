import 'package:flutter/material.dart';

class CardProdutoWidget extends StatelessWidget {
  final String nomeProduto;
  final String categoriaProduto;
  final String tipoProduto;
  final String valor;
  final String idProduto;

  const CardProdutoWidget(
      {Key key,
      @required this.nomeProduto,
      @required this.categoriaProduto,
      @required this.tipoProduto,
      @required this.valor, @required this.idProduto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed("/updateproduto/$idProduto");
        print(idProduto);
      },
      child: Card(
        elevation: 15,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 100,
              right: -100,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
                radius: 180,
              ),
            ),
            Positioned(
              top: 150,
              right: 80,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                radius: 150,
              ),
            ),
            Positioned(
              top: 200,
              left: -50,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                radius: 100,
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      nomeProduto,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      categoriaProduto,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          tipoProduto,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "$valor",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
