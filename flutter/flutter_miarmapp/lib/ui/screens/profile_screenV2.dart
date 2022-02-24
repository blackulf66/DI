import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/bloc/bloc_ver_perfil/bloc/user_with_post_bloc.dart';
import 'package:flutter_miarmapp/models/userApi_model.dart';
import 'package:flutter_miarmapp/repository/constants.dart';
import 'package:flutter_miarmapp/repository/user_with_post_repository/user_with_post_repository.dart';
import 'package:flutter_miarmapp/repository/user_with_post_repository/user_with_post_repository_impl.dart';
import 'package:flutter_miarmapp/ui/widgets/error_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenV2 extends StatefulWidget {
  const ProfileScreenV2({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenV2> {
  late UserPostRepository userRepository;

  @override
  void initState() {
    // TODO: implement initState
    userRepository = UserPostRepositoryImpl();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return UserWithPostBloc(userRepository)
            ..add(FetchUserWithType(Constant.nowPlaying));
        },
        child: _createPublics(context));
  }
}

Widget _createPublics(BuildContext context) {
  return BlocBuilder<UserWithPostBloc, UserWithPostState>(
    builder: (context, state) {
      if (state is UserWithPostInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UserFetchedError) {
        return ErrorPage(
          message: state.message,
          retry: () {
            context
                .watch<UserWithPostBloc>()
                .add(FetchUserWithType(Constant.nowPlaying));
          },
        );
      } else if (state is UsersFetched) {
        return _profile(context, state.users);
      } else {
        return const Text('Not support');
      }
    },
  );
}

Widget _profile(BuildContext context, UserApiResponse user) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        "yo",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
      actions: const [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
              ),
            ))
      ],
    ),
    body: Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(user.avatar
                            .toString()
                            .replaceFirst('localhost', '10.0.2.2'))),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: null,
                          child: Text(
                            user.posts.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Text("publicaciones"),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text("777",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                        Text("seguidores"),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text("1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                        Text("siguiendo"),
                      ],
                    ),
                  ],
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(user.nick.toString()),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    user.nick,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                width: 367,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "editar perfil",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:11.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      width: 120,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "herramientas",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      width: 120,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "herramientas",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      width: 120,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "herramientas",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.table_view)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ],
        ),
        const SizedBox(
          width: 20,
        ),

        /*Image(  image: NetworkImage(user.publicaciones.elementAt(0).file.toString().replaceFirst('localhost', '10.0.2.2')),
                        
                        ),*/
        Flexible(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: user.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    color: Colors.white,
                    child: Image(
                      image: NetworkImage(user.posts
                          .elementAt(index)
                          .imagen
                          .toString()
                          .replaceFirst('localhost', '10.0.2.2')),
                      fit: BoxFit.cover,
                    ));
              }),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}
