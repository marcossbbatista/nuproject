import 'package:flutter/material.dart';

class MotivoPedido extends StatefulWidget {
  const MotivoPedido({super.key});

  @override
  State<MotivoPedido> createState() => _MotivoPedidoState();
}

class _MotivoPedidoState extends State<MotivoPedido> {
  String? _motivoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Qual o motivo do pedido?',
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(height: 20),
            _listaMotivo(
              'Viagem',
              Icons.airplanemode_on,
            ),
            SizedBox(height: 10),
            _listaMotivo(
              'Quero fazer uma compra específica',
              Icons.shopping_cart_outlined,
            ),
            SizedBox(height: 10),
            _listaMotivo(
              'Meu limite é incompatível com minha renda',
              Icons.money,
            ),
            SizedBox(height: 10),
            _listaMotivo(
              'Quero gastar mais',
              Icons.shopping_bag_outlined,
            ),
            SizedBox(height: 10),
            _listaMotivo(
              'Gastos pontuais não previstos',
              Icons.build_outlined,
            ),
            SizedBox(height: 10),
            _listaMotivo(
              'Outros',
              Icons.border_all,
            ),
            Divider(height: 60),
            ElevatedButton(
              onPressed: _motivoSelecionado == null ? null : () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _motivoSelecionado == null ? Colors.grey : Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                "Escolha o motivo",
                style: TextStyle(
                  fontSize: 15,
                  color:
                      _motivoSelecionado == null ? Colors.grey : Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listaMotivo(String motivo, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      leading: CircleAvatar(
        child: Icon(icon, color: Colors.black),
        backgroundColor: Color(0xFFE4DFE3),
        radius: 25,
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              style: TextStyle(
                fontSize: 15
              ),
              motivo,
              softWrap: true,
            ),
          ),
          SizedBox(width: 4.0),
          Transform.scale(
            scale: 1.5,
            child: Radio<String>(
              value: motivo,
              groupValue: _motivoSelecionado,
              onChanged: (value) {
                setState(() {
                  _motivoSelecionado = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}