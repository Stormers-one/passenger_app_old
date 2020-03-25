import 'package:flutter/material.dart';
import 'package:o_k/Menu/timing.dart';
import 'package:o_k/shared/constants.dart';

class BusSearch extends SearchDelegate<String> {
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
      
  //   );
  // }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
      ), 
      onPressed: (){
        close(context, null);
      }
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentSearch : stops.where((p)=> p.startsWith(query.toUpperCase())).toList();
    return ListView.builder(
      itemBuilder: (context, index)=> ListTile(
        onTap: (){
          selectedString = suggestionList[index];
          if(!recentSearch.contains(selectedString)){
            recentSearch.add(selectedString);
          }
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Timing()));
          close(context, null);        
        },
        leading: Icon(Icons.location_city),
        title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold 
          ),
          children: [
            TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}