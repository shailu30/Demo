import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/remote/remote_book_bloc.dart';
import '../../bloc/remote/remote_book_state.dart';
import '../../widgets/book_tile.dart';

class BookListing extends StatelessWidget {
  const BookListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Books',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteBooksBloc, RemoteBooksState>(
      builder: (_, state) {
        if (state is RemoteBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RemoteBooksError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteBooksDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return BookWidget(book: state.book![index]);
            },
            itemCount: state.book!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
