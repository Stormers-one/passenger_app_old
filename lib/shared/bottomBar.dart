import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  Color backColor = Colors.white;
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home),Text('Home')),
    NavigationItem(Icon(MdiIcons.ticket),Text('Bookings')),
    NavigationItem(Icon(Icons.person_outline),Text('Profile')),
  ];
  Widget _buildItem(NavigationItem item , bool isSelected){
      return AnimatedContainer(
        duration: Duration(milliseconds: 270),
        width: isSelected ? 150 : 50,
        padding: isSelected ? EdgeInsets.only(left: 16 , right: 16) : EdgeInsets.only(left: 8 , right: 8),
        height: double.maxFinite/2,
        decoration: isSelected ? BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ): null,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                   IconTheme(
                    data: IconThemeData(
                      size: 24,
                      color: isSelected ? backColor : Colors.black,
                    ),
                    child: item.icon,
                  ), 
                  isSelected ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: 
                    DefaultTextStyle(style: 
                    TextStyle(
                      color: backColor
                    ), 
                      child: item.title),
                  ) : Container(),
              ],
            ),
          ],
        ),
      );
    }
    
    @override
    Widget build(BuildContext context) {
      return Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:[ BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          )
          
          ],
        ),
        padding: EdgeInsets.only(top: 4,bottom: 4,right: 8,left: 8),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item){
            var itemIndex = items.indexOf(item);
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = itemIndex;
                });
              },
              child: _buildItem(item, selectedIndex == itemIndex),
              );
          }).toList(),
        ),
      );
    }
  }
  
  class NavigationItem {
    final Icon icon;
    final Text title;
    NavigationItem(this.icon,this.title);
}
