import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  @override
  _SearchFilter createState() => _SearchFilter();
}

enum SortMethod { Experience, Location, Rating }

class _SearchFilter extends State<SearchFilter> {
  List<String> services = ["Cuidador(a)", ""];
  List<String> specialties = ["...", "Dermatológica", "Osbstétrica", "Neonatologista", "Esteticista", "Saúde mental", "Acumputurista"];
  List<String> distances = ["...", '5', '10', '15', '20'];

  String _specialty = "...";
  String _distance = "...";
  bool _credit = true, _debit = true, _money = true;
  SortMethod sort = SortMethod.Rating;

  Widget buildOptions({String label, List<String> items, Function(String) onChanged}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: [
          Text("$label:   ", style: TextStyle(fontSize: 18)),
          DropdownButton(
              value: '...',
              items: items.map<DropdownMenuItem<String>>((e) => new DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
              onChanged: onChanged)
        ],
      ),
    );
  }

  Widget buildPayment() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Métodos de pagamento",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: [
              Checkbox(
                  value: _credit,
                  onChanged: (v) {
                    setState(() {
                      _credit = v;
                    });
                  }),
              Text('Crédito'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: _debit,
                  onChanged: (v) {
                    setState(() {
                      _debit = v;
                    });
                  }),
              Text("Débito"),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: _money,
                  onChanged: (v) {
                    setState(() {
                      _money = v;
                    });
                  }),
              Text('Dinheiro')
            ],
          )
        ],
      ),
    );
  }

  Widget buildSort() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ordenar por:'),
            ListTile(
              title: Text('Experiência'),
              leading: Radio(
                  value: SortMethod.Experience,
                  groupValue: sort,
                  onChanged: (v) {
                    setState(() {
                      sort = v;
                    });
                  }),
            ),
            ListTile(
              title: Text('Avaliação'),
              leading: Radio(
                  value: SortMethod.Rating,
                  groupValue: sort,
                  onChanged: (v) {
                    setState(() {
                      sort = v;
                    });
                  }),
            ),
            ListTile(
              title: Text('Location'),
              leading: Radio(
                  value: SortMethod.Location,
                  groupValue: sort,
                  onChanged: (v) {
                    setState(() {
                      sort = v;
                    });
                  }),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: Text('Search'),
          centerTitle: true,
          actions: [],
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                labelText: 'Serviço',
                //hintText: 'meuemail@empresa.com',
              )),
              buildOptions(
                  label: 'Especialidade',
                  items: specialties,
                  onChanged: (String v) {
                    if (v == null) return;
                    setState(() {
                      _specialty = v;
                    });
                  }),
              buildOptions(
                  label: 'Distância máxima (Km)',
                  items: distances,
                  onChanged: (String v) {
                    if (v == null) return;
                    setState(() {
                      _distance = v;
                    });
                  }),
              buildPayment(),
              buildSort()
            ],
          ),
        ));
  }
}
