import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/book_service.dart';
import '../entities/book.dart';

class GetBookUseCase implements UseCase<DataState<List<Book>>, void> {
  GetBookUseCase();

  @override
  Future<DataState<List<Book>>> call({void params}) async {
    return DataSuccess(await BookService().getBooks());
  }
}
