part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {

}

class PostFetched extends PostState {
  final List<PostApiResponse> post;

  const PostFetched(this.post,);

  @override
  List<Object> get props => [post];
}

class PostFetchError extends PostState {
  final String message;
  const PostFetchError(this.message);

  @override
  List<Object> get props => [message];
}