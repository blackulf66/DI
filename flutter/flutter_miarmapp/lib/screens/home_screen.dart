import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/models/post_model.dart';
import 'package:flutter_miarmapp/providers/posts_provider.dart';
import 'package:fluttericon/typicons_icons.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   PostProvider postProvider = new PostProvider();   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFF9F9F9),  
      appBar:AppBar(
      
      backgroundColor: Color(0xFFF9F9F9),  
      title: Container(
        child: SizedBox(
          height: 30.0,
          child: Text("miarmagram", style: TextStyle(color: Colors.black),)
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
            _postsList(),
          ],
        ),          
      ),       
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

  Widget _postsList(){

    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics() ,
        itemCount: postProvider.getPosts().length,
        itemBuilder: (context , i){
          return _Post( postProvider.getPosts()[i] ) ;                         
        },
      ),  
    );
  }

  Widget _Post( Post post ){

    List<Widget> userLikes = [];
    userLikes.add( Text('le gusta a') );

    int count = 1;
    int qtyUserLikes = post.topsLikes.length;

    post.topsLikes.forEach(( user ) {
      Widget _temp = Text( 
        count != qtyUserLikes ? user + "," : user,
        style: TextStyle( 
          fontWeight:  FontWeight.bold
        ),  
      );
      userLikes.add(_temp);
      count == qtyUserLikes ? userLikes.add(Text(' y ')) : null ;
      count == qtyUserLikes ? userLikes.add(Text('${post.likes} personas mas', style: TextStyle( fontWeight: FontWeight.bold , fontSize: 18.0))) : null ;
      count++;
    });


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
                      image: NetworkImage( post.userPhoto ),
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                ),

                Text( 
                  post.userName,
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
            image: NetworkImage( post.postPhoto ),

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
            padding: EdgeInsets.only(left: 17.0, right: 17.0 , bottom: 10.0  ),
            color: Colors.white,
            child: Row(
              children: userLikes,              
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
                        text: "${post.userName} ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        )           
                      ),
                      TextSpan(
                        text: "${post.caption} ",
                        style: TextStyle(
                          color: Colors.black                      
                        )                  
                      ),
                    ]
                  ),
                ),
                 Text(
                        "ver los ${post.comentarios} comentarios",
                        style: TextStyle(
                          color: Colors.grey                      
                        )                  
                      ),

                Container(
                  
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(vertical : 10.0),
                  child: Text( 
                    post.date , style: TextStyle( 
                      color: Colors.grey,
                      fontSize: 13.0
                    ),
                  )
                )
              ],
            )
            
                      ),
        ],
      ),
    );

  }


}