import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/bloc/post_bloc/post_bloc.dart';
import 'package:flutter_miarmapp/models/postApi_model.dart';
import 'package:flutter_miarmapp/repository/postApi_repository.dart';
import 'package:flutter_miarmapp/repository/postApi_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/ui/widgets/error_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttericon/typicons_icons.dart';


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
      child: Scaffold(
      backgroundColor: Color(0xFFF9F9F9),  
      appBar:AppBar(
      
      backgroundColor: Color(0xFFF9F9F9),  
      title: Padding(
        padding: const EdgeInsets.only(right:10.0),
        child: SizedBox(
          height: 30.0,
          child: Image.asset("assets/images/logo_miarmapp.png")
        ),
      ) ,     
      
      actions: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon( Icons.h_plus_mobiledata , color: Colors.black ,size: 28.0 ),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon( Icons.tv , color: Colors.black ,size: 28.0 ),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon( Icons.ac_unit, color: Colors.black, size: 28.0  ),
        ),
      ],
    ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _parteabajo(),                
            Divider(color: Colors.grey, thickness: 0.5 , height: 0.0),
            _createPopular(context),
          ],
        ),          
      ),       
    )
    );
  }

   Widget _parteabajo() {
    return Container(
      margin: EdgeInsets.only( top: 5.0, left: 14.0, right: 14.0 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
      ),
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
    final contentHeight =MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20.0, right: 16.0),
        ),
        SizedBox(
          height: contentHeight,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _createPopularViewItem(context, post[index]);
            },
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            scrollDirection: Axis.vertical,
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
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[

          Container(
            color: Colors.white,
            child: Row(              
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(top: 12.0 , left: 18.0, bottom: 12.0, right: 12.0 ),
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(50.0),
                    child: Image(
                      image: NetworkImage(post.imagen.replaceFirst('localhost', '10.0.2.2')),
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                ),

                Text( 
                  post.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                ),

                Expanded(child: SizedBox()),

                IconButton(
                  icon: Icon( Icons.more_vert ),
                  iconSize: 30.0,
                  onPressed: (){},
                ),                
              ],
            ),
          ),

          Image(
            image: NetworkImage(post.imagen.replaceFirst('localhost', '10.0.2.2')),

          ),

          Container( 
            padding: EdgeInsets.only(top:5.0, left: 7.0, right: 7.0, bottom: 0.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Typicons.heart),
                    ),
        
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Icon(Typicons.comment),
                     ),
                     
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Icon(Typicons.search_outline),
                     ),
                  ],
                ),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Icon(Typicons.star),
                 ),    
              ],
            ),
          ),
          

          Container(           
            color: Colors.white,
            width: double.infinity,            
            padding: EdgeInsets.only(left: 17.0, right: 17.0 , bottom: 10.0  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(                  
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${post.username} ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        )           
                      ),
                      TextSpan(
                        text: "${post.titulo} ",
                        style: TextStyle(
                          color: Colors.black                      
                        )                  
                      ),
                    ]
                  ),
                ),
            
              ],
            )
            
                      ),
        ],
      ),
    );

  }
}