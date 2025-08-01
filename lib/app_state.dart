import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _image = await secureStorage.getString('ff_image') ?? _image;
    });
    await _safeInitAsync(() async {
      _supabaseAnnonkey =
          await secureStorage.getString('ff_supabaseAnnonkey') ??
              _supabaseAnnonkey;
    });
    await _safeInitAsync(() async {
      _supabaseUrl =
          await secureStorage.getString('ff_supabaseUrl') ?? _supabaseUrl;
    });
    await _safeInitAsync(() async {
      _currencyValue =
          await secureStorage.getDouble('ff_currencyValue') ?? _currencyValue;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _navBarMenu = false;
  bool get navBarMenu => _navBarMenu;
  set navBarMenu(bool value) {
    _navBarMenu = value;
  }

  String _image = 'fill_1.png';
  String get image => _image;
  set image(String value) {
    _image = value;
    secureStorage.setString('ff_image', value);
  }

  void deleteImage() {
    secureStorage.delete(key: 'ff_image');
  }

  List<String> _image1 = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/momotaro-sdayao/assets/4jn6sci0xdk3/Emoji3.svg',
    'https://picsum.photos/seed/207/600',
    'https://picsum.photos/seed/779/600',
    'https://picsum.photos/seed/21/600',
    'https://picsum.photos/seed/730/600'
  ];
  List<String> get image1 => _image1;
  set image1(List<String> value) {
    _image1 = value;
  }

  void addToImage1(String value) {
    image1.add(value);
  }

  void removeFromImage1(String value) {
    image1.remove(value);
  }

  void removeAtIndexFromImage1(int index) {
    image1.removeAt(index);
  }

  void updateImage1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    image1[index] = updateFn(_image1[index]);
  }

  void insertAtIndexInImage1(int index, String value) {
    image1.insert(index, value);
  }

  LatLng? _origem = LatLng(-15.7050424, -49.36531489999999);
  LatLng? get origem => _origem;
  set origem(LatLng? value) {
    _origem = value;
  }

  LatLng? _destino = LatLng(-15.7050424, -49.36531489999999);
  LatLng? get destino => _destino;
  set destino(LatLng? value) {
    _destino = value;
  }

  int _corridaID = 0;
  int get corridaID => _corridaID;
  set corridaID(int value) {
    _corridaID = value;
  }

  String _selectedPlaceOrigem = '';
  String get selectedPlaceOrigem => _selectedPlaceOrigem;
  set selectedPlaceOrigem(String value) {
    _selectedPlaceOrigem = value;
  }

  String _selectedPlaceOrigemId = '';
  String get selectedPlaceOrigemId => _selectedPlaceOrigemId;
  set selectedPlaceOrigemId(String value) {
    _selectedPlaceOrigemId = value;
  }

  double _classificacao = 0.0;
  double get classificacao => _classificacao;
  set classificacao(double value) {
    _classificacao = value;
  }

  String _keyMaps = 'AIzaSyB02pY9d0TwSf34DHLE3-h9-fD3lp4F0KQ';
  String get keyMaps => _keyMaps;
  set keyMaps(String value) {
    _keyMaps = value;
  }

  String _supabaseAnnonkey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsYndhY21hdm5ndG9uYXV4bnRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg3MTYzMzIsImV4cCI6MjAyNDI5MjMzMn0.IPFL2f8dslKK-jU2lYGJJwHcL0ZqOVmTIiTQK5QzF2E';
  String get supabaseAnnonkey => _supabaseAnnonkey;
  set supabaseAnnonkey(String value) {
    _supabaseAnnonkey = value;
    secureStorage.setString('ff_supabaseAnnonkey', value);
  }

  void deleteSupabaseAnnonkey() {
    secureStorage.delete(key: 'ff_supabaseAnnonkey');
  }

  String _supabaseUrl = 'https://qlbwacmavngtonauxnte.supabase.co';
  String get supabaseUrl => _supabaseUrl;
  set supabaseUrl(String value) {
    _supabaseUrl = value;
    secureStorage.setString('ff_supabaseUrl', value);
  }

  void deleteSupabaseUrl() {
    secureStorage.delete(key: 'ff_supabaseUrl');
  }

  double _currencyValue = 0.0;
  double get currencyValue => _currencyValue;
  set currencyValue(double value) {
    _currencyValue = value;
    secureStorage.setDouble('ff_currencyValue', value);
  }

  void deleteCurrencyValue() {
    secureStorage.delete(key: 'ff_currencyValue');
  }

  List<DocumentReference> _motoristasAguardando = [];
  List<DocumentReference> get motoristasAguardando => _motoristasAguardando;
  set motoristasAguardando(List<DocumentReference> value) {
    _motoristasAguardando = value;
  }

  void addToMotoristasAguardando(DocumentReference value) {
    motoristasAguardando.add(value);
  }

  void removeFromMotoristasAguardando(DocumentReference value) {
    motoristasAguardando.remove(value);
  }

  void removeAtIndexFromMotoristasAguardando(int index) {
    motoristasAguardando.removeAt(index);
  }

  void updateMotoristasAguardandoAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    motoristasAguardando[index] = updateFn(_motoristasAguardando[index]);
  }

  void insertAtIndexInMotoristasAguardando(int index, DocumentReference value) {
    motoristasAguardando.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
