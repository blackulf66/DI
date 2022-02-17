import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/models/post_model.dart';
import 'package:flutter_miarmapp/providers/posts_provider.dart';


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
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.5),
        child: Container(
          color: Colors.black38,
          height: 0.75,
        ),
      ),
      elevation: 0,
      backgroundColor: Color(0xFFF9F9F9),  
      brightness: Brightness.light,
      centerTitle: true,
      title: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: SizedBox(
          height: 40.0,
          child: Image.asset('assets/img/logo-instagram.png')
        ),
      ) ,     
      leading: IconButton(
        onPressed: (){},
        icon: Icon(Icons.camera, color: Colors.black, size: 30.0 ),
      ),
      actions: <Widget>[
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
            _labels(),                
            Divider(color: Colors.grey, thickness: 0.5 , height: 0.0),
            _posts(),
          ],
        ),          
      ),       
    );
  }

  Widget _labels() {
    return Container(
      margin: EdgeInsets.only( top: 5.0, left: 15.0, right: 15.0 ),
      //margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Stories', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
          Row(                   
            children: <Widget>[                        
              GestureDetector(
                onTap: (){},
                child: Icon(Icons.arrow_right)
              ),
              Text('Watch All', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _posts(){

    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics() ,
        itemCount: postProvider.getPosts().length,
        itemBuilder: (context , i){
          return _createPost( postProvider.getPosts()[i] ) ;                         
        },
      ),
    );
  }

  Widget _createPost( Post post ){

    List<Widget> userLikes = [];
    userLikes.add( Text( 'Liked by ' ) );

    int count = 1;
    int qtyUserLikes = post.topsLikes.length;

    post.topsLikes.forEach(( user ) {
      Widget _temp = Text( 
        count != qtyUserLikes ? user + ", " : user,
        style: TextStyle( 
          fontWeight:  FontWeight.bold
        ),  
      );
      userLikes.add(_temp);
      count == qtyUserLikes ? userLikes.add( Text( ' and  ') ) : null ;
      count == qtyUserLikes ? userLikes.add( Text( '${post.likes} others' , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 18.0))) : null ;
      count++;
    });


    return Container(
      child: Column(
        children: <Widget>[

          Container( //POST USER
            color: Colors.white,
            child: Row(              
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(top: 12.0 , left: 18.0, bottom: 12.0, right: 12.0 ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
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
                  icon: Icon( Icons.more_horiz ),
                  iconSize: 30.0,
                  onPressed: (){},
                ),                
              ],
            ),
          ),

          FadeInImage( //POST IMAGE
            image: NetworkImage( post.postPhoto ),
            placeholder: AssetImage('assets/img/loading.gif'),
          ),

          Container( //ICONS ACTIONS
            padding: EdgeInsets.only(top:5.0, left: 7.0, right: 7.0, bottom: 0.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/img/heart.png'),
                        width: 30.0,
                      ),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/img/comment.png'),
                        width: 28.0,
                      ),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/img/send.png'),
                        width: 29.0,
                      ),
                      onPressed: (){},
                    )
                  ],
                ),

                IconButton(
                  icon: Image(
                    image: AssetImage('assets/img/save_o.png'),
                    width: 27.0,
                  ),
                  onPressed: (){},
                )
                               
              ],
            ),
          ),
          
          Container( // USER LIKES
            padding: EdgeInsets.only(left: 17.0, right: 17.0 , bottom: 10.0  ),
            color: Colors.white,
            child: Row(
              children:  userLikes,              
            ),          
          ),

          Container( // CAPTION            
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

                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(vertical : 10.0),
                  child: Text( 
                    post.date , 
                    style: TextStyle( 
                      color: Colors.grey,
                      fontSize: 18.0
                    ),
                  )
                )
              ],
            )
            
            
            //Text( "${post.userName} ${post.caption}", maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, )           
          ),
        ],
      ),
    );

  }


}