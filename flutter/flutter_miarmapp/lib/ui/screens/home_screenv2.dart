import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/bloc/post_bloc/post_bloc.dart';
import 'package:flutter_miarmapp/models/postApi_model.dart';
import 'package:flutter_miarmapp/repository/postApi_repository.dart';
import 'package:flutter_miarmapp/repository/postApi_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/ui/widgets/error_page.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Homev2Screen extends StatefulWidget {
  const Homev2Screen({ Key? key }) : super(key: key);

  @override
  _Homev2ScreenState createState() => _Homev2ScreenState();
}

class _Homev2ScreenState extends State<Homev2Screen> {
  late PostApiRepository postApiRepository;

  @override
  void initState() {
    super.initState();
    postApiRepository = PostApiRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) { return PostBloc(postApiRepository)..add(FetchPost()); },
      child: Scaffold(body: _createPopular(context)),
    );
  }

Widget _createPopular(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostFetchError) {
          return ErrorPage(
            message: state.message,
            retry: () {
              context.watch<PostBloc>().add(FetchPost());
            },
          );
        } else if (state is PostFetched) {
          return _createPopularView(context, state.post);
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  Widget _createPopularView(BuildContext context, List<PostApiResponse> post) {
    final contentHeight = 4.0 * (MediaQuery.of(context).size.width / 2.4) / 3;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20.0, right: 16.0),
          height: 48.0,
          child: Row(
            children: const [
               Expanded(
                flex: 1,
                child: Text(
                  'post',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.red),
            ],
          ),
        ),
        SizedBox(
          height: contentHeight,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _createPopularViewItem(context, post[index]);
            },
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.transparent,
              width: 6.0,
            ),
            itemCount: post.length,
          ),
        ),
      ],
    );
  }

  Widget _createPopularViewItem(BuildContext context, PostApiResponse post) {
    final width = MediaQuery.of(context).size.width / 2.6;
    return Container(
      width: width,
      height: double.infinity,
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 10.0,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SizedBox(
          width: width,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Text('${post.texto}')
          ),
        ),
      ),
    );
  }
}