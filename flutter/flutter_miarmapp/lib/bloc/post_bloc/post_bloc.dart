import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_miarmapp/models/postApi_model.dart';
import 'package:flutter_miarmapp/repository/post_repository/postApi_repository.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostApiRepository postApiRepository;

  PostBloc(this.postApiRepository) : super(PostInitial()) {
    on<FetchPost>(_postsFetched);
  }

  void _postsFetched(FetchPost event, Emitter<PostState> emit) async {
    try {
      final post = await postApiRepository.fetchPosts();
      emit(PostFetched(post));
      return;
    } on Exception catch (e) {
      emit(PostFetchError(e.toString()));
    }
  }
}