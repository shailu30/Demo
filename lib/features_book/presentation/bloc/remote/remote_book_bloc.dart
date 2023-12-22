import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/features_book/presentation/bloc/remote/remote_book_state.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../domain/usecases/get_book.dart';
import 'remote_book_event.dart';

class RemoteBooksBloc extends Bloc<RemoteBooksEvent, RemoteBooksState> {
  final GetBookUseCase _getArticleUseCase;

  RemoteBooksBloc(this._getArticleUseCase) : super(const RemoteBooksLoading()) {
    on<GetBooks>(onGetBooks);
  }

  void onGetBooks(GetBooks event, Emitter<RemoteBooksState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteBooksDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteBooksError(dataState.error!));
    }
  }
}
