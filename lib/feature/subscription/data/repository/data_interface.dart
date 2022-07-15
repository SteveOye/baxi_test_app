import '../../../subscription/data/model/data_request.dart';
import '../../../subscription/data/model/plans.dart';

abstract class DataInterface {
  Future<List<Plans>> getPlans(var params);
  Future<String> buyData(DataRequest dataRequest);
}
