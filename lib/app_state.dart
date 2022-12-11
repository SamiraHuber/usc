import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('ff_name') ?? _name;
    _place = prefs.getString('ff_place') ?? _place;
    _type = prefs.getString('ff_type') ?? _type;
    _image = prefs.getString('ff_image') ?? _image;
    _location = prefs.getString('ff_location') ?? _location;
    _imagePath = prefs.getString('ff_imagePath') ?? _imagePath;
  }

  late SharedPreferences prefs;

  String _name = 'Ruben Hammele';
  String get name => _name;
  set name(String _value) {
    notifyListeners();

    _name = _value;
    prefs.setString('ff_name', _value);
  }

  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _time = _value;
  }

  String _place = 'EASYFITNESS Lübeck';
  String get place => _place;
  set place(String _value) {
    notifyListeners();

    _place = _value;
    prefs.setString('ff_place', _value);
  }

  String _type = 'Fitness';
  String get type => _type;
  set type(String _value) {
    notifyListeners();

    _type = _value;
    prefs.setString('ff_type', _value);
  }

  String _image =
      'https://media-exp1.licdn.com/dms/image/C5603AQHyh9vemZVoUQ/profile-displayphoto-shrink_800_800/0/1615882318335?e=1675296000&v=beta&t=B2Zw2FnTmEK2STyEUcBkeJuPaUxZ7BayJpaKBZ9vRXs';
  String get image => _image;
  set image(String _value) {
    notifyListeners();

    _image = _value;
    prefs.setString('ff_image', _value);
  }

  String _location = 'Innenstadt';
  String get location => _location;
  set location(String _value) {
    notifyListeners();

    _location = _value;
    prefs.setString('ff_location', _value);
  }

  String _imagePath =
      'https://media-exp1.licdn.com/dms/image/C5603AQHyh9vemZVoUQ/profile-displayphoto-shrink_800_800/0/1615882318335?e=1675296000&v=beta&t=B2Zw2FnTmEK2STyEUcBkeJuPaUxZ7BayJpaKBZ9vRXs';
  String get imagePath => _imagePath;
  set imagePath(String _value) {
    notifyListeners();

    _imagePath = _value;
    prefs.setString('ff_imagePath', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
