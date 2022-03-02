import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_miarmapp/models/userApi_model.dart';
import 'package:flutter_miarmapp/repository/user_with_post_repository/user_post_repository.dart';

part 'user_with_post_event.dart';
part 'user_with_post_state.dart';

class UserWithPostBloc extends Bloc<UserWithPostEvent, UserWithPostState> {
    final UserPostRepository public;

  UserWithPostBloc(this.public) : super(UserWithPostInitial()) {
    on<FetchUserWithType>(_publicacionesFetched);
}

void _publicacionesFetched(FetchUserWithType event, Emitter<UserWithPostState> emit) async {
    try {
      final user = await public.fetchUsers(event.type);
      emit(UsersFetched(user, event.type));
      return;
    } on Exception catch (e) {
      emit(UserFetchedError(e.toString()));
    }
  }
}
