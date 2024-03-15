import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/home_controller.dart';

class CustomSearchDelegate extends SearchDelegate {
  List searchList;
  String queryString;
  CustomSearchDelegate({required this.searchList, required this.queryString});

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () {}, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){

      Get.back();



    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('search classs list $searchList');
    return ListView.separated(
        itemBuilder: (context, index) =>

        InkWell(
                        onTap: () async {
                           await homeController.getCourseDetails(
                                courseName: searchList[index]['Course_Name'] ??
                                    '');


                         
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.w),
                          child: Container(
                        
                            child: Card(
                              
                              surfaceTintColor: Colors.white,
                              elevation: 5,
                              child: Container(
                                margin: EdgeInsets.all( 15.w),
                                width: 200.w,
                             
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                            
                                    Text(searchList[index]['Course_Name'],
                                    
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                            
                                    Text(searchList[index]['Country_Name']),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
        
        
        
        
        // Container(
        //       child: Text(searchList[index]['Course_Name']),
        //     ),
        separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
        itemCount: searchList.length);
  }
}
