import 'package:mockito/annotations.dart';
import 'package:products_app/data/data_sources/data_sources.dart';

@GenerateMocks([
  ProductsRemoteDataSource,
  FavoritesLocalDataSource,
])
@GenerateNiceMocks([
  MockSpec<ProductsResponse>(),
  MockSpec<ProductResponse>(),
])
void main() {}