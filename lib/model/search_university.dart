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
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('search classs list $searchList');

    return GetBuilder<HomeController>(
      builder: (searchData) {
        return Container(
          // color: Colors.amber
          // ,
          // height: 750.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  // height: 630.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                      controller: homeController.searchScrollController,
                      itemBuilder: (context, index) {
                        // homeController.searchScrollController.addListener((){
                  
                        // });
                  
                        return InkWell(
                          onTap: () async {
                            await homeController.getCourseDetails(
                                courseName:  searchData.  searchResultList[index]['Course_Name'] ?? '',courseId:  searchData.  searchResultList[index]['Course_Id']);
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.w),
                            child: Container(
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 5,
                                child: Container(
                                  margin: EdgeInsets.all(15.w),
                                  width: 200.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                      searchData.  searchResultList[index]['Course_Name'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(  searchData.  searchResultList[index]['Country_Name']),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                  
                      // Container(
                      //       child: Text(searchList[index]['Course_Name']),
                      //     ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount:         searchData.  searchResultList.length),
                ),
                    
                    Container(height: 100.h,
                    width: Get.width,
                    // color: Colors.red,
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      
                      children: [IconButton(onPressed: () async{
                        if(homeController.pageNumber.value>1){
                          homeController.pageNumber.value--;
                           final pageStartNumber= (homeController.pageNumber.value*10)-10;
                          final pageEndNumber=    (homeController.pageNumber.value*10);
                    
                    
                           await homeController.getCourseSearchData(pageStart: pageStartNumber,pageEnd: pageEndNumber);
                    
                    print('$pageEndNumber   $pageStartNumber');
                        }
                 
                    
                    
                    
                    
                      }, icon: const Icon(Icons.arrow_back_ios)),Container(
                    
                    
                        
                         height: 30.h,width: 30.w,child:  Center(child: Obx(()=> Text(homeController.pageNumber.toString()))),),    IconButton(onPressed: () async{
                    
                          homeController.pageNumber.value++; 
                          final pageStartNumber= (homeController.pageNumber.value*10)-10;
                          final pageEndNumber=    (homeController.pageNumber.value*10);
                    
                    
                           await homeController.getCourseSearchData(pageStart: pageStartNumber,pageEnd: pageEndNumber);
                    
                    print('$pageEndNumber   $pageStartNumber');
                    
                    
                    
                    
                         }, icon:  Icon(Icons.arrow_forward_ios))],),
                    
                    
                    
                    )
              ],
            ),
          ),
        );
      }
    );
  }
}
