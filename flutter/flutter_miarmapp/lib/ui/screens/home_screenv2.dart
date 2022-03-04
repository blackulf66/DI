import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/bloc/bloc_ver_perfil/bloc/user_with_post_bloc.dart';
import 'package:flutter_miarmapp/bloc/post_bloc/post_bloc.dart';
import 'package:flutter_miarmapp/models/postApi_model.dart';
import 'package:flutter_miarmapp/models/userApi_model.dart';
import 'package:flutter_miarmapp/repository/constants.dart';
import 'package:flutter_miarmapp/repository/post_repository/postApi_repository.dart';
import 'package:flutter_miarmapp/repository/post_repository/postApi_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/ui/screens/post_form.dart';
import 'package:flutter_miarmapp/ui/widgets/error_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:image_picker/image_picker.dart';


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
    return BlocProvider(create: (context) { return PostBloc(postApiRepository)..add(FetchPostWithType('public')); },
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
        IconButton(onPressed: (){
                    
                      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PostForm()),
      );

                  }, icon: Icon(Icons.add_box_outlined,color: Colors.black ,size: 28.0 )),
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
    return BlocBuilder<PostBloc, BlocPostState>(
      builder: (context, state) {
        if (state is BlocPostInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostFetchError) {
          return ErrorPage(
            message: state.message,
            retry: () {
              context.watch<PostBloc>().add(FetchPostWithType('public'));
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
    final contentHeight =MediaQuery.of(context).size.height -200 ;
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
                  padding: const EdgeInsets.only(top: 12.0 , left: 18.0, bottom: 12.0, right: 12.0 ),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                ),

                const Expanded(child: SizedBox()),

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
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Typicons.heart),
                    ),
        
                     Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Icon(Typicons.comment),
                     ),
                     
                     Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Icon(Typicons.search_outline),
                     ),
                  ],
                ),

                 const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Icon(Typicons.star),
                 ),    
              ],
            ),
          ),
          

          Container(           
            color: Colors.white,
            width: double.infinity,            
            padding: const EdgeInsets.only(left: 17.0, right: 17.0 , bottom: 10.0  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(                  
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "8000 Me gusta",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        )           
                      ),
                    ]
                  ),
                ),
                RichText(                  
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${post.username} ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        )           
                      ),
                      TextSpan(
                        text: '${post.texto} ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                        )           
                      ),
                    ]
                  ),
                ),
                SizedBox(
                  height:10
                ),
                Text('${post.titulo}' , style: TextStyle(color:Colors.blueAccent)),
                
            
              ],
              
            )
            
                      ),
        ],
      ),
    );

  }

  }
