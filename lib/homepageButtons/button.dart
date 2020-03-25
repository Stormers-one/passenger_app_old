import 'package:flutter/material.dart';
import '../homepageButtons/buttonClass.dart';
import '../shared/colors.dart';
import '../homepageButtons/data.dart';

class Button extends StatelessWidget {
  final String image;
  final VoidCallback route;
  final String text;
  BuildContext context;
  int index=0;
  Button({this.image,this.route,this.text, this.context});
  // @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RawMaterialButton(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.transparent)),
          fillColor: Colors.orange[500],
          splashColor: Colors.grey,
          textStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Image.asset(
                  image,
                ),
                height: 100,
                width: 100,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 2.0),
              ),
              Text(text),
            ],
          ),
          onPressed: route,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
  void _navigate(String route){
    Navigator.of(context).pushNamed('/$route');
  }
  
//   Widget _imageAvatar(PostClass post, BuildContext context) {
//     return FloatingActionButton(
//       child: Icon(Icons.person),
//       // child: Container(
//       //   child: Image.asset('asset/user.jpg'),
//       //   height: 25,
//       // ),
//       backgroundColor: raspColor,
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => User()),
//         );
//       },
//     );
//   }

//   Widget _imageBackground(PostClass post) {
//     return Container(
//       constraints: BoxConstraints.expand(),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Image.network(
//           post.image,
//           fit: BoxFit.fitWidth,
//         ),
//       ),
//     );
//   }

//   Widget _nameOfUser(PostClass post) {
//     return Container(
//         child: Text(
//       post.name,
//       style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),
//     ));
//   }

//   Widget _locationOfUser(PostClass post) {
//     return Container(
//         child: Text(
//       post.location,
//       style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),
//     ));
//   }

//   Widget _captionOfUser(PostClass post) {
//     return Container(
//         child: Text(
//       post.caption,
//       style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),
//     ));
//   }
}
typedef VoidNavigate = void  Function(String route);
