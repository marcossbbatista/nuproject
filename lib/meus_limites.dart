import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nulimite/limite_ideal.dart';
import 'package:flutter/services.dart';
import 'package:nulimite/nupay.dart';

class MeusLimites extends StatefulWidget {
  const MeusLimites({super.key});

  @override
  State<MeusLimites> createState() => _MeusLimitesState();
}

class _MeusLimitesState extends State<MeusLimites> {
  double valorEscolhido = 1000;
  double valorMinimo = 0;
  double valorMaximo = 2300;

  final NumberFormat formatoReal = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  final NumberFormat formatoDecimal = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
    decimalDigits: 0,
  );

  @override
  void _abrirLimiteIdeal() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LimiteIdeal(valorMaximo: valorMaximo),
      ),
    );
  }

  void _abrirNuPay() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Nupay()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meus limites",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(Icons.close, color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(),
            Center(
              child: Text(
                formatoReal.format(valorEscolhido),
                style: TextStyle(fontSize: 26),
              ),
            ),
            Divider(indent: 80, endIndent: 80),
            SizedBox(height: 4),
            Center(
              child: Text(
                formatoReal.format(valorEscolhido) + " disponível para uso",
                style: TextStyle(fontSize: 16, color: Color(0xFF008000)),
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatoDecimal.format(valorMinimo),
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    formatoDecimal.format(valorMaximo),
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Slider(
              value: valorEscolhido,
              max: valorMaximo,
              min: valorMinimo,
              divisions: (valorMaximo / 10).round(),
              activeColor: Color(0xFF008000),
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
              title: Text(formatoReal.format(valorMaximo)),
              subtitle: Text("Limite aprovado no cartão"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _abrirLimiteIdeal();
              },
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            ListTile(
              title: Text(
                "Limites Adicionais",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.help_outline_outlined),
            ),
            ListTile(
              subtitle: Text(
                  "Para compras online, boletos ou PIX. Esses valores não alteram seu limite pré-aprovado do cartão."),
            ),
            SizedBox(height: 2),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text(
                "Limite para NuPay",
                style: TextStyle(fontSize: 16),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: GestureDetector(
                        child: Text(
                          "Conheça",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {
                _abrirNuPay();
              },
            ),
          ],
        ),
      ),
    );
  }
}
