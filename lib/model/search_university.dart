import 'package:flutter/material.dart';

class CustomSearchDelegate  extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: (){}, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
     return Icon(Icons.arrow_back);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
   return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
  
}