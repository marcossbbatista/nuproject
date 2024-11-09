import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:nulimite/motivo_pedido.dart';

class LimiteIdeal extends StatefulWidget {
  final double valorMaximo;

  const LimiteIdeal({super.key, required this.valorMaximo});

  @override
  State<LimiteIdeal> createState() => _LimiteIdealState();
}

class _LimiteIdealState extends State<LimiteIdeal> {
  final TextEditingController _controller = TextEditingController();
  late double novoLimite;
  bool _mostrarBotao = false;

  @override
  void initState() {
    super.initState();
    novoLimite = widget.valorMaximo;
    _controller.addListener(_verificarValor);
  }

  void _verificarValor() {
    setState(() {
      final valorInserido = double.tryParse(_controller.text
          .replaceAll('R\$', '')
          .replaceAll('.', '')
          .replaceAll(',', '.')) ??
          0;
      _mostrarBotao =
          valorInserido > widget.valorMaximo || novoLimite > widget.valorMaximo;
    });
  }

  void _adicionarValor(double valor) {
    setState(() {
      novoLimite += valor;
      _controller.value = TextEditingValue(
        text: formatoReal.format(novoLimite),
        selection: TextSelection.fromPosition(
          TextPosition(offset: formatoReal.format(novoLimite).length),
        ),
      );
    });
    _verificarValor();
  }

  final NumberFormat formatoReal = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  void _abrirMotivoPedido() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MotivoPedido(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Qual é o limite ideal para você?',
                  style: TextStyle(fontSize: 26),
                ),
                SizedBox(height: 20),
                Text(
                  'Seu limite atual é ' + formatoReal.format(novoLimite),
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: _controller,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    FormatadorTextoMoeda(),
                  ],
                  decoration: InputDecoration(
                    hintText: formatoReal.format(novoLimite),
                    hintStyle: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () => _adicionarValor(100),
                      child: Text(
                        "+ R\$ 100",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 0.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () => _adicionarValor(250),
                      child: Text(
                        "+ R\$ 250",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 0.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () => _adicionarValor(500),
                      child: Text(
                        "+ R\$ 500",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 0.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _mostrarBotao ? _abrirMotivoPedido : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _mostrarBotao ? Colors.purple : Colors.grey,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
                child: Icon(
                  Icons.arrow_right_alt,
                  color: _mostrarBotao ? Colors.white : Color(0xFFE4DFE3),
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormatadorTextoMoeda extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue valorAntigo, TextEditingValue novoValor) {
    if (novoValor.text.isEmpty) {
      return novoValor.copyWith(text: '');
    }

    String texto = novoValor.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (texto.isNotEmpty) {
      double valor = double.parse(texto) / 100;
      String novoTexto = NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2).format(valor);

      return novoValor.copyWith(
        text: novoTexto.replaceAll('R\$ ', ''),
        selection: TextSelection.collapsed(offset: novoTexto.length),
      );
    }

    return novoValor;
  }
}
