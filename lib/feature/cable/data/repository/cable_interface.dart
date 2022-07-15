import 'package:baxi_app/feature/cable/data/model/cable_request.dart';
import 'package:baxi_app/feature/cable/data/model/packages.dart';
import 'package:baxi_app/feature/cable/data/model/user.dart';

abstract class CableInterface {
  Future<User> validateCard(Map<String, dynamic> params);
  Future<List<Package>> getPackages(var params);
  Future<String> buyCable(CableRequest cableRequest);
}
