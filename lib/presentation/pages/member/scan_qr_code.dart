import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:my_store_hub/common/routes.dart';
import 'package:my_store_hub/data/models/cart_model.dart';

class ScanQrCodePage extends StatelessWidget {
  const ScanQrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
      ),
      body: MobileScanner(
        onDetect: (barcode) {
          final result = barcode.barcodes;
          if (result.first.rawValue != null) {
            try {
              final cartMap =
                  jsonDecode(result.first.rawValue!) as Map<String, dynamic>;
              final cart = CartModel.fromMap(cartMap).toEntity();
              Navigator.pushReplacementNamed(
                context,
                memberCheckoutRoute,
                arguments: cart,
              );
            } catch (e) {
              debugPrint(e.toString());
            }
          }
        },
      ),
    );
  }
}
