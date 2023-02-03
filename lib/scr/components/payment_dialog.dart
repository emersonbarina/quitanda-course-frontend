import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/models/order_model.dart';
import 'package:quitanda/scr/services/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({Key? key, required this.order}) : super(key: key);

  final OrderModel order;

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              tPaymentTile,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            // QR Code
            QrImage(
              data: "1234567890",
              version: QrVersions.auto,
              size: 200.0,
            ),

            // Vencimento
            Text(
              '$tPaymentDate: ${utilsServices.formatDateTime(order.overdueDateTime)}',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            // Total
            Text(
              '$tOrderTotal ${utilsServices.priceToCurrency(order.total)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Botão copia e cola
          ],
        ),
      ),
    );
  }
}
