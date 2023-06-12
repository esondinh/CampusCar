import 'package:CampusCar/service/admin_service.dart';
import 'package:CampusCar/service/vehicle_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => new VehicleService());
  locator.registerLazySingleton(() => new AdminService());
}
