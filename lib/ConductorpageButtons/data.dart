import '../ConductorpageButtons/buttonClass.dart';

class Buttons extends ButtonClass {
  static final List<ButtonClass> items = [
    ButtonClass(
      text: 'QR Scan',
      route: 'QR_Scan',
      image: 'assets/images/qr-code.png',
    ),
    ButtonClass(
      text: 'Bluetooth',
      route: 'Bluetooth',
      image: 'assets/images/bluetooth.png',
    ),
    ButtonClass(
      text: 'Emergency',
      route: 'Emergency',
      image: 'assets/images/emergency.png',
    ),
    ButtonClass(
      text: 'Passengers',
      route: 'Passengers',
      image: 'assets/images/passengers.png',
    ),
  ];
  static ButtonClass fetchAny() {
    return Buttons.items[0];
  }

  static List<ButtonClass> fetchAll() {
    return Buttons.items;
  }
}
