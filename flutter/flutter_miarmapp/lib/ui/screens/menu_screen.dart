import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/bloc/bloc_ver_perfil/bloc/user_with_post_bloc.dart';
import 'package:flutter_miarmapp/models/userApi_model.dart';
import 'package:flutter_miarmapp/repository/constants.dart';
import 'package:flutter_miarmapp/repository/user_with_post_repository/user_post_repository.dart';
import 'package:flutter_miarmapp/repository/user_with_post_repository/user_post_repository_impl.dart';
import 'package:flutter_miarmapp/ui/screens/home_screen.dart';
import 'package:flutter_miarmapp/ui/screens/home_screenv2.dart';
import 'package:flutter_miarmapp/ui/screens/profile_screen.dart';
import 'package:flutter_miarmapp/ui/screens/profile_screenV2.dart';
import 'package:flutter_miarmapp/ui/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/ui/widgets/error_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;
  late Future<SharedPreferences> _prefs;


@override
  void initState() {
    _prefs = SharedPreferences.getInstance();
    super.initState();
  }

  List<Widget> pages = [
    const Homev2Screen(),
    const SearchScreen(),
    const ProfileScreenV2()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex], bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildBottomBar() {
    return Container(
        decoration: BoxDecoration(
            border: const Border(
          top: BorderSide(
            color: Color(0xfff1f1f1),
            width: 1.0,
          ),
        )),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Icon(Icons.home,
                  color: _currentIndex == 0
                      ? Colors.black
                      : const Color(0xff999999)),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            GestureDetector(
              child: Icon(Icons.search,
                  color: _currentIndex == 1
                      ? Colors.black
                      : const Color(0xff999999)),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            GestureDetector(
              child: Icon(Icons.person,
                  color: _currentIndex == 2
                      ? Colors.black
                      : const Color(0xff999999)),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
          ],
        ));
  }
  Future getImage() async {
    _prefs.then((SharedPreferences prefs) {
      return prefs.getString('avatar');
    });
  }
}

/*@override
  void initState() {
    userRepository = UserPostRepositoryImpl();
    super.initState();
  }
  List<Widget> pages = [
    const Homev2Screen(),
    const SearchScreen(),
    const ProfileScreenV2()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex], bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildBottomBar() {
    return Container(
        decoration: BoxDecoration(
            border: const Border(
          top: BorderSide(
            color: Color(0xfff1f1f1),
            width: 1.0,
          ),
        )),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Icon(Icons.home,
                  color: _currentIndex == 0
                      ? Colors.black
                      : const Color(0xff999999)),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            GestureDetector(
              child: Icon(Icons.search,
                  color: _currentIndex == 1
                      ? Colors.black
                      : const Color(0xff999999)),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },

              child:BlocProvider(
        create: (context) {
          return UserWithPostBloc(userRepository)
            ..add(FetchUserWithType(Constant.nowPlaying));
        },
        child: _createPublics(context ,_currentIndex)))]));
  }
}

Widget _createPublics(BuildContext context ,_currentIndex) {
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
        return _pintaImagenPerfil(context, state.users ,_currentIndex);
      } else {
        return const Text('Not support');
      }
    },
  );
}
          Widget _pintaImagenPerfil(BuildContext context, UserApiResponse user ,_currentIndex){
            return
             Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: _currentIndex == 2? Colors.black: Colors.transparent, width: 1)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      '${user.avatar}',
                      width: 30,
                    ),
                ),
              );
          }
            
           
*/