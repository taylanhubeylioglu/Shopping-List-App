import '../entities/address.dart';

abstract class AddressRepository {
  Stream<List<Address>> get address;
  Future<void> addAddress(Address address);
  Future<void> removeAddress(String userId);
}
