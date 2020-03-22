import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class CustomComboboxWidget extends StatelessWidget {

  final List<Model> items;
  final Function onChange;
  final Model itemSelected;

  const CustomComboboxWidget({Key key, @required this.items, @required this.onChange, @required this.itemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FindDropdown<Model>(
      items: items,
      onChanged: (Model item) => onChange(item),
      selectedItem: itemSelected,
      validate: (Model item) {
        if (item == null)
          return "Este campo é obrigatório";
        else
          return null; //return null to "no error"
      },
      dropdownBuilder: (_, item){
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(width: 2, color: Theme.of(context).primaryColor,)
          ),
          child: item?.id == null ?
          ListTile(
            title: Text("Não selecionado", style: TextStyle(color: Theme.of(context).primaryColor),),
          )
          :
          ListTile(
            title: Text(item.descricao, style: TextStyle(color: Theme.of(context).primaryColor),),
          )
        );
      },
    );
  }
}

class Model {
  final String id;
  final String descricao;

  Model(this.id, this.descricao);

  @override
  String toString() => descricao.toString();

  @override
  operator ==(o) => o is Model && o.id == id;

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;

}
