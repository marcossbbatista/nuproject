import 'package:flutter/material.dart';

class Nupay extends StatelessWidget {
  const Nupay({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/nupay.jpeg',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 24),
              Text(
                'Oferta de limite adicional para pagar com NuPay',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 16),
              Text(
                'Com o limite adicional, você pode fazer pagamentos no crédito usando NuPay e combiná-lo com o limite disponível do seu cartão de crédito.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: Image.asset(
                  'images/icon_nubank_black.jpg',
                  width: 22,
                  height: 22,
                ),
                title: Text(
                  'O que é o NuPay?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'É a forma segura de pagar do Nu que não utiliza os dados do cartão. Nas lojas parceiras, ao escolher a opção Nubank, você é direcionado para pagar no app do Nu e confirmar com a sua senha.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_bag_outlined,
                ),
                title: Text(
                  'Como funciona o limite adicional para pagar com NuPay?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'O limite adicional é removido no fechamento da fatura e o seu limite volta a ser apenas o limite disponível no seu cartão. Você pode receber novas ofertas de limites adicionais a cada compra com NuPay usando a função crédito',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.receipt_long,
                ),
                title: Text(
                  'Seus pagamentos em um só lugar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Mesmo usando o limite temporário, as compras com NuPay no crédito aparecem notmalmente na sua fatura, junto com as outras compras no seu cartão de crédito.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.only(left: 75, right: 75),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Ver onde posso usar',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
