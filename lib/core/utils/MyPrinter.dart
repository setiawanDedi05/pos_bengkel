import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/services.dart';
import 'package:pos_bengkel/core/extensions/date_time_ext.dart';
import 'package:pos_bengkel/core/extensions/int_ext.dart';
import 'package:pos_bengkel/core/extensions/string_ext.dart';
import '../../presentation/home/models/order_item.dart';
// import 'package:image/image.dart';

class MyPrint {
  MyPrint._init();

  static final MyPrint instance = MyPrint._init();

  Future<List<int>> printOrder(List<OrderItem> products, int totalQuantity,
      int totalPrice, String paymentMethod, int nominalBayar, int serviceFee) async {
    List<int> bytes = [];

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    final ByteData data = await rootBundle.load('assets/logo.png');
    final Uint8List bytesImage = data.buffer.asUint8List();
    // final Image? image = decodeImage(bytesImage);

    bytes += generator.reset();
    // bytes += generator.image(image!);
    // bytes += generator.text('Pada Jaya Motor',
    //     styles: const PosStyles(
    //       bold: true,
    //       align: PosAlign.center,
    //       height: PosTextSize.size1,
    //       width: PosTextSize.size1,
    //     ));

    bytes += generator.text(
        'Kp. Pacet Beunying, Desa. Cipendawa, Kec. Pacet, Kabupaten Cianjur, Jawa Barat 43253',
        styles: const PosStyles(bold: true, align: PosAlign.center));
    bytes += generator.text('Date : ${DateTime.now().toFormattedTime}',
        styles: const PosStyles(bold: false, align: PosAlign.center));
    // bytes += generator.text('Start 12 Desember 2023',
    //     styles: const PosStyles(bold: false, align: PosAlign.center));

    bytes += generator.feed(1);
    bytes += generator.text('Pesanan:',
        styles: const PosStyles(bold: false, align: PosAlign.center));
    //for from data
    for (final product in products) {
      bytes += generator.text(product.product.name,
          styles: const PosStyles(align: PosAlign.left));

      bytes += generator.row([
        PosColumn(
          text: '${product.product.price} x ${product.quantity}',
          width: 8,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text:
              "${(product.product.price.toIntegerFromText * product.quantity).currencyFormatRp})",
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }

    bytes += generator.feed(1);

    bytes += generator.row([
      PosColumn(
        text: 'Biaya Service',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: serviceFee.currencyFormatRp,
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        text: 'Total',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: (totalPrice + serviceFee).currencyFormatRp,
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        text: 'Bayar',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: nominalBayar.currencyFormatRp,
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        text: 'Pembayaran',
        width: 8,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: paymentMethod,
        width: 4,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.feed(1);
    bytes += generator.text('Terima kasih',
        styles: const PosStyles(bold: false, align: PosAlign.center));
    bytes += generator.feed(3);

    return bytes;
  }
}
