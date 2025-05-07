import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yoseph_ephrem/core/platform/network_info.dart';
import 'package:yoseph_ephrem/features/product/data/datasoruces/product_local_data_source.dart';
import 'package:yoseph_ephrem/features/product/data/datasoruces/product_remote_data_source.dart';
import 'package:yoseph_ephrem/features/product/data/repositories/product_repository_impl.dart';

class MockRemoteDataSource extends Mock implements ProductRemoteDataSource {}

class MockLocalDataSource extends Mock implements ProductLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ProductRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
