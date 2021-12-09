import 'package:disposer/disposer.dart';

import '../../data/datasources/home_data_source.dart';
import '../entities/home_entitie.dart';

abstract class IHomeRepository with Disposable {
  IHomeRepository(this.dataSource);

  final HomeDataSource dataSource;

  @override
  List<Disposable> get disposables => [dataSource];

  Future<HomeEntitie> fetchEntitie();
}
