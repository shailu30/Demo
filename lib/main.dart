import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/features_book/presentation/bloc/remote/remote_book_event.dart';
import 'package:interview_task/injection_container.dart';

import 'features_book/presentation/bloc/remote/remote_book_bloc.dart';
import 'features_book/presentation/pages/home/book_listing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteBooksBloc>(
      create: (context) => sl()..add(const GetBooks()),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          // onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: BookListing()),
    );
  }
}
