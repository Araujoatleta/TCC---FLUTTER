import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formas de Pagamento'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Add New Card Button
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add-card');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add),
                SizedBox(width: 8),
                Text('Adicionar novo cartão'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Saved Cards
          const Text(
            'Cartões salvos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildCardItem(
            'Visa ****1234',
            'Expira em 12/25',
            Icons.credit_card,
          ),
          _buildCardItem(
            'Mastercard ****5678',
            'Expira em 08/24',
            Icons.credit_card,
          ),

          const SizedBox(height: 24),

          // Other Payment Methods
          const Text(
            'Outras formas de pagamento',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildPaymentMethodItem(
            'Pix',
            'Pagamento instantâneo',
            Icons.qr_code,
          ),
          _buildPaymentMethodItem(
            'Dinheiro',
            'Pague na hora',
            Icons.attach_money,
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Text('Editar'),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('Remover'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodItem(String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}