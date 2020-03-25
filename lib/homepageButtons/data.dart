import '../homepageButtons/buttonClass.dart';

class Buttons extends ButtonClass {
  static final List<ButtonClass> items = [
    ButtonClass(
      text: 'Maps',
      route: 'Maps',
      image: 'assets/map.png',
    ),
    ButtonClass(
      text: 'Timing',
      route: 'Timing',
      image: 'assets/route.png',
    ),
    ButtonClass(
      text: 'Tracking',
      route: 'Tracking',
      image: 'assets/position.png',
    ),
    ButtonClass(
      text: 'Booking',
      route: 'Booking',
      image: 'assets/seatbus.png',
    ),
  ];
  static ButtonClass fetchAny() {
    return Buttons.items[0];
  }

  static List<ButtonClass> fetchAll() {
    return Buttons.items;
  }
}
