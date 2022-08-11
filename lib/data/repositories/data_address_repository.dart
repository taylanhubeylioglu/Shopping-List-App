import 'dart:async';

import 'package:alisveris_app_homework2/domain/entities/address.dart';
import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';

class DataAddressRepository implements AddressRepository {
  static final _instance = DataAddressRepository._internal();
  DataAddressRepository._internal();

  factory DataAddressRepository() => _instance;

  bool isAddressFetched = false;

  final List<Address> _addressList = [
    Address(
      Id: "1",
      userId: "1",
      userAddress: "Talas/Kayseri",
      date: "08/03/2022",
    ),
    Address(
        Id: "1",
        userId: "1",
        userAddress: "Kocasinan/Kayseri",
        date: "11/03/2022"),
  ];

  StreamController<List<Address>> _streamController =
      StreamController.broadcast();

  void _initAddress() {
    try {
      _streamController.add(_addressList);
      isAddressFetched = true;
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> addAddress(Address address) async {
    _addressList.add(address);
    _streamController.add(_addressList);
  }

  @override
  Stream<List<Address>> get address {
    try {
      if (!isAddressFetched) _initAddress();
      Future.delayed(Duration.zero)
          .then((value) => _streamController.add(_addressList));
      return _streamController.stream;
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> removeAddress(String userId) async {
    try {
      _addressList.remove(
          _addressList.firstWhere((element) => element.userId == userId));
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }
}
