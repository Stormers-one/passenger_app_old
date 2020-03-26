import 'package:flutter/material.dart';
import 'package:o_k/Menu/Timing/timing.dart';
import 'package:o_k/shared/constants.dart';

class BusSearch extends SearchDelegate<String> {
  String fromto;
  TextEditingController controller = new TextEditingController();
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
          if(fromto == "From"){
            selectedTimingStringFrom = selectedString; 
          }
          else if(fromto == "To"){
            selectedTimingStringTo = selectedString;
          }
          close(context, null);
          controller.text = selectedString;
          return controller;       
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

  BusSearch(String fromTo, TextEditingController controller){
    this.fromto = fromTo;
    this. controller = controller;
  }

  
}