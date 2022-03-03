import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_miarmapp/models/Post_dto.dart';
import 'package:flutter_miarmapp/models/postApi_model.dart';
import 'package:flutter_miarmapp/repository/post_repository/postApi_repository.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<BlocPostEvent, BlocPostState> {

  final PostApiRepository public;

  PostBloc(this.public) : super(BlocPostInitial()) {
    on<FetchPostWithType>(_PostFetched);
    on<DoPostEvent>(_doPostEvent);
}

void _PostFetched(FetchPostWithType event, Emitter<BlocPostState> emit) async {
    try {
      final post = await public.fetchPosts(event.type);
      emit(PostFetched(post, event.type));
      return;
    } on Exception catch (e) {
      emit(PostFetchError(e.toString()));
    }
  }

  void _doPostEvent(DoPostEvent event, Emitter<BlocPostState> emit) async {
    try {
      final postResponse = await public.createPost(event.postDto, event.imagePath);
      emit(PostSuccessState(postResponse));
      return;
    } on Exception catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
