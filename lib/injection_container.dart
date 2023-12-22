import 'package:get_it/get_it.dart';

import 'features_book/domain/usecases/get_book.dart';
import 'features_book/presentation/bloc/remote/remote_book_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //UseCases
  sl.registerSingleton<GetBookUseCase>(GetBookUseCase());

  //Blocs
  sl.registerFactory<RemoteBooksBloc>(() => RemoteBooksBloc(sl()));
}
