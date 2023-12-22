import '../../../domain/entities/book.dart';

abstract class RemoteBooksState {
  final List<Book>? book;
  final String? error;

  const RemoteBooksState({this.book, this.error});
}

class RemoteBooksLoading extends RemoteBooksState {
  const RemoteBooksLoading();
}

class RemoteBooksDone extends RemoteBooksState {
  const RemoteBooksDone(List<Book> list) : super(book: list);
}

class RemoteBooksError extends RemoteBooksState {
  const RemoteBooksError(String error) : super(error: error);
}
