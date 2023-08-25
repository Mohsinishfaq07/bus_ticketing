import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sb_myreports/core/utils/globals/snack_bar.dart';
import 'package:sb_myreports/core/utils/thermal_printer/printer_controller.dart';

class CustomThermalPrinter {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
  static CustomThermalPrinter instance = CustomThermalPrinter();
  PrinterController printerController = PrinterController();
  static BluetoothDevice? _device;
  bool connected = false;

  Future<void> initPlatformState() async {
    var statusLocation = Permission.location;
    if (await statusLocation.isGranted != true) {
      await Permission.location.request();
    }
    if (await statusLocation.isGranted) {
      // ...
    } else {
      return;
    }
    bool? isConnected = await bluetooth.isConnected;
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("object");
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          connected = true;
          print("bluetooth device state: connected");
          break;
        case BlueThermalPrinter.DISCONNECTED:
          connected = false;
          print("bluetooth device state: disconnected");
          break;
        case BlueThermalPrinter.DISCONNECT_REQUESTED:
          connected = false;
          print("bluetooth device state: disconnect requested");

          break;
        case BlueThermalPrinter.STATE_TURNING_OFF:
          connected = false;
          print("bluetooth device state: bluetooth turning off");

          break;
        case BlueThermalPrinter.STATE_OFF:
          connected = false;
          print("bluetooth device state: bluetooth off");

          break;
        case BlueThermalPrinter.STATE_ON:
          connected = false;
          print("bluetooth device state: bluetooth on");

          break;
        case BlueThermalPrinter.STATE_TURNING_ON:
          connected = false;
          print("bluetooth device state: bluetooth turning on");

          break;
        case BlueThermalPrinter.ERROR:
          connected = false;
          print("bluetooth device state: error");

          break;
        default:
          print(state);
          break;
      }

      if (isConnected == true) {
        connected = true;
      }
    });
    print(devices.length);
    devices.map((e) => e.name);
    for (var i = 0; i < devices.length; i++) {
      if (devices[i].name == "BlueTooth Printer") {
        _device = devices[i];
        break;
      }
    }
    // _device = devices.firstWhere((element) => element.name);
  }

  void connect() {
    if (_device != null) {
      bluetooth.isConnected.then((isConnected) {
        if (isConnected == false) {
          bluetooth.connect(_device!).catchError((error) {
            connected = false;
            print(error);
          });
          connected = true;
        } else {
          ShowSnackBar.show('No device selected');
        }
      });
    }
  }

  void _disconnect() {
    bluetooth.disconnect();
    connected = false;
  }

  void dispose() {
    if (connected) {
      _disconnect();
    }
  }
}
