import 'package:flutter/services.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:sb_myreports/core/utils/thermal_printer/printerenum.dart';

///Test printing
class PrinterController {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  printForUnRegisteredUser(
      String amount, String noOfPassengers, String agentId) async {
    //image max 300px X 300px

    ///image from Asset
    String filename = 'splashscreenbus.png';

    ByteData bytesAsset = await rootBundle.load("assets/images/$filename");
    Uint8List imageBytesFromAsset = bytesAsset.buffer
        .asUint8List(bytesAsset.offsetInBytes, bytesAsset.lengthInBytes);

    bluetooth.isConnected.then((isConnected) {
      if (isConnected == true) {
        bluetooth.printNewLine();
        bluetooth.printCustom("Ticket", Size.boldLarge.val, Align.center.val);
        bluetooth.printNewLine();
        // bluetooth.printImageBytes(
        //   imageBytesFromAsset,
        // ); //image from Asset
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Name", agentId, Size.bold.val);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Ticket Price", amount, Size.bold.val);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("No of Seats", noOfPassengers, Size.bold.val);

        bluetooth.printNewLine();
        bluetooth.printLeftRight(
            "Total",
            (int.parse(amount) * int.parse(noOfPassengers)).toString(),
            Size.bold.val);
        bluetooth.printNewLine();
        bluetooth.printCustom("Thank You", Size.bold.val, Align.center.val);
        bluetooth.printNewLine();
        bluetooth.printQRcode(
            "Insert Your Own Text to Generate", 200, 200, Align.center.val);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth
            .paperCut(); //some printer not supported (sometime making image not centered)
        //bluetooth.drawerPin2(); // or you can use bluetooth.drawerPin5();
      }
    });
  }

  printQrCode(String qrCode) async {
    bluetooth.isConnected.then((isConnected) {
      if (isConnected == true) {
        bluetooth.printQRcode(qrCode, 200, 200, Align.center.val);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();
      }
    });
  }

  printForRegisteredUser(
      String amount, String noOfPassengers, String userName) async {
    //image max 300px X 300px

    ///image from Asset
    String filename = 'splashscreenbus.png';

    ByteData bytesAsset = await rootBundle.load("assets/images/$filename");
    Uint8List imageBytesFromAsset = bytesAsset.buffer
        .asUint8List(bytesAsset.offsetInBytes, bytesAsset.lengthInBytes);

    bluetooth.isConnected.then((isConnected) {
      if (isConnected == true) {
        bluetooth.printNewLine();
        bluetooth.printCustom("Ticket", Size.boldLarge.val, Align.center.val);
        bluetooth.printNewLine();
        // bluetooth.printImageBytes(
        //   imageBytesFromAsset,
        // ); //image from Asset
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Name", userName, Size.bold.val);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Ticket Price", amount, Size.bold.val);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("No of Seats", noOfPassengers, Size.bold.val);

        bluetooth.printNewLine();
        bluetooth.printLeftRight(
            "Total",
            (int.parse(amount) * int.parse(noOfPassengers)).toString(),
            Size.bold.val);
        bluetooth.printNewLine();
        bluetooth.printCustom("Thank You", Size.bold.val, Align.center.val);
        bluetooth.printNewLine();
        bluetooth.printQRcode(
            "Insert Your Own Text to Generate", 200, 200, Align.center.val);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth
            .paperCut(); //some printer not supported (sometime making image not centered)
        //bluetooth.drawerPin2(); // or you can use bluetooth.drawerPin5();
      }
    });
  }
}
