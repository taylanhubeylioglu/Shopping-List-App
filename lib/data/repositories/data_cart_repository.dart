import 'dart:async';

import 'package:alisveris_app_homework2/domain/entities/cart.dart';
import 'package:alisveris_app_homework2/domain/repositories/cart_repository.dart';
import 'package:flutter/material.dart';

class DataCartRepository implements CartRepository {
  static final _instance = DataCartRepository._internal();
  DataCartRepository._internal();

  factory DataCartRepository() => _instance;

  bool isCartFetched = false;

  final List<Cart> _CartList = [];
  StreamController<List<Cart>> _streamController = StreamController.broadcast();

  void _initCart() {
    try {
      _streamController.add(_CartList);
      isCartFetched = true;
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> addCart(Cart cart) async {
    _CartList.add(cart);
    _streamController.add(_CartList);
  }

  @override
  Stream<List<Cart>> get carts {
    try {
      if (!isCartFetched) _initCart();
      Future.delayed(Duration.zero)
          .then((value) => _streamController.add(_CartList));
      return _streamController.stream;
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> removeCart(String userId) async {
    try {
      _CartList.remove(
          _CartList.firstWhere((element) => element.userId == userId));
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }
}
