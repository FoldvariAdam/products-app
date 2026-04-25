import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:products_app/core/core.dart';
import 'package:products_app/presentation/home/blocs/home_bloc.dart';
import 'package:products_app/presentation/home/view/view.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();

    if (GetIt.instance.isRegistered<HomeBloc>()) {
      GetIt.instance.unregister<HomeBloc>();
    }
    GetIt.instance.registerSingleton<HomeBloc>(mockHomeBloc);
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      theme: AppThemeFactory.create(),
      home: BlocProvider<HomeBloc>.value(
        value: mockHomeBloc,
        child: const HomePage(),
      ),
    );
  }

  testWidgets('renders loading indicator when HomeLoadingState', (tester) async {
    whenListen(
      mockHomeBloc,
      Stream.value(const HomeLoadingState()),
      initialState: const HomeLoadingState(),
    );

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders error view with message when HomeErrorState', (tester) async {
    const errorMessage = 'Hiba történt';

    whenListen(
      mockHomeBloc,
      Stream.value(const HomeErrorState(errorMessage)),
      initialState: const HomeErrorState(errorMessage),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.text(errorMessage), findsOneWidget);
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });
}