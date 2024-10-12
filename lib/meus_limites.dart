import 'package:flutter/material.dart';

class MeusLimites extends StatefulWidget {
  const MeusLimites({super.key});

  @override
  State<MeusLimites> createState() => _MeusLimitesState();
}

class _MeusLimitesState extends State<MeusLimites> {
  double valorEscolhido = 557;
  double valorMinimo = 0;
  double valorMaximo = 1800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meus limites",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(Icons.close, color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Center(
              child: Text(
                "R\$ " + valorEscolhido.toStringAsFixed(2).replaceAll('.', ','),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "R\$ ${valorEscolhido.toStringAsFixed(2).replaceAll('.', ',')} de limite disponível",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "R\$ " +
                        valorMinimo.toStringAsFixed(2).replaceAll('.', ','),
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "R\$ " +
                        valorMaximo.toStringAsFixed(2).replaceAll('.', ','),
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Slider(
              value: valorEscolhido,
              max: valorMaximo,
              min: valorMinimo,
              activeColor: Colors.green,
              inactiveColor: Color(0xFFddfada),
              onChanged: (double valor) {
                setState(() {
                  valorEscolhido = valor;
                });
              },
            ),
            SizedBox(height: 30),
            Text(
              "Confira os detalhes do seu limite",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text(
                "R\$ " + valorMaximo.toStringAsFixed(2).replaceAll('.', ','),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Limite aprovado no cartão"),
              trailing: Icon(Icons.chevron_right),
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            ListTile(
              title: Text(
                "Limites Adicionais",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.help_outline_outlined),
            ),
            ListTile(
              subtitle: Text(
                  "Para compras online, boletos ou PIX. Esses valores não alteram seu limite pré-aprovado do cartão."),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text(
                "Limite para NuPay",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: Container(
                      padding:
                          EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: GestureDetector(
                        child: Text(
                          "Conheça",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
