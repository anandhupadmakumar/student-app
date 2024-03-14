import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/home_controller.dart';
import 'package:student_app/view/home/location_screen.dart';

import '../../../model/search_university.dart';
import '../university/university_search_result_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    homeController.getDashBoardData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(120.w, 120.h),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Student App',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(

                  onTap: (){


                     showSearch(context: context, delegate: CustomSearchDelegate());




                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Center(
                        child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 18.sp,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text('find courses'),
                      ],
                    )),
                  ),
                )
              ],
            )),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              commonWidget(
                  icon: Icons.account_balance, title: 'Top Institutions'),
              SizedBox(
                height: 15.h,
              ),
              commonListViewWidget(),
              SizedBox(
                height: 15.h,
              ),
              commonWidget(icon: Icons.school, title: 'Popular Courses'),
              SizedBox(
                height: 15.h,
              ),
              commonListViewWidget(isCourse: true),
              SizedBox(
                height: 15.h,
              ),
              commonWidget(icon: Icons.location_on, title: 'Popular Places'),
              SizedBox(
                height: 15.h,
              ),
              locationListViewWidget(
                
                
               ),

              SizedBox(
                height: 15.h,
              ),
              // commonWidget(
              //     icon: Icons.my_library_books_rounded,
              //     title: 'Trending Subjects'),
              // SizedBox(
              //   height: 15.h,
              // ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Wrap(
              //     spacing: 20.w,
              //     runSpacing: 20.h,
              //     children: List.generate(
              //       5,
              //       (index) => Container(
              //         margin: EdgeInsets.only(left: 15.w),
              //         padding: EdgeInsets.all(15.sp),
              //         width: 180.w,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20.r),
              //             color: Colors.white),
              //         child: Center(
              //           child: Text('Computer Science'),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 15.h,
              ),
              // commonWidget(
              //     icon: Icons.account_balance, title: 'Top Institutions'),
              // SizedBox(
              //   height: 15,
              // ),
              // commonListViewWidget(),
              // SizedBox(
              //   height: 15,
              // ),
              // commonWidget(
              //     icon: Icons.account_balance, title: 'Top Institutions'),
              // SizedBox(
              //   height: 15,
              // ),
              // commonListViewWidget(),
              // SizedBox(
              //   height: 15,
              // ),
              // commonWidget(
              //     icon: Icons.account_balance, title: 'Top Institutions'),
              // SizedBox(
              //   height: 15,
              // ),
              // commonListViewWidget(),
              // SizedBox(
              //   height: 15,
              // ),
              // commonWidget(
              //     icon: Icons.account_balance, title: 'Top Institutions'),
              // SizedBox(
              //   height: 15,
              // ),
              // commonListViewWidget(),
              // SizedBox(
              //   height: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox locationListViewWidget(
     ) {
    return SizedBox(
      height: 250.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
             homeController.  locationDataList.length,
            (index) => InkWell(
                  onTap: () {
                    // print(countryNameList[index]);

                    Get.to(() => LocationScreen(
                      description: homeController. locationDataList[index]['description'],
                          title: homeController. locationDataList[index]['country_name'],
                          imgUrl:  homeController. locationDataList[index]['img_url'],
                          // universityCount: universityCountList[index],
                        ));
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 80.r,
                            backgroundColor: Colors.amber,
                            backgroundImage: AssetImage( homeController.  locationDataList[index]['img_url']),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            homeController.  locationDataList[index]['country_name'],
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          // Text('${universityCountList[index]} universities'),
                        ],
                      )),
                )),
      ),
    );
  }

  Container commonListViewWidget({ bool isCourse=false}) {
    return Container(
        width: Get.width,
        height: 100.h,
        child: GetBuilder<HomeController>(
          builder: (data) {
            return ListView(
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
            
              children: List.generate(
                isCourse==true?data. universityCourseDataList.length: data.universityListData.length,
                  (index) => GetBuilder<HomeController>(builder: (universityData) {
                        return InkWell(
                          onTap: ()async {
                            universityData.courseDetails=null;


                            if(isCourse==true){
                           await   homeController.getCourseDetails(courseName:universityData.universityCourseDataList[index]
                                              .courseName ??
                                          '' );


                                           
                            }else{
                              // Get.to(() =>const  UniversityResultScreen());

                            }



                            
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15.w),
                            child: Card(
                              surfaceTintColor: Colors.white,
                              elevation: 5,
                              child: Container(
                                margin: EdgeInsets.only(left: 15.w),
                                width: 200.w,
                                // height: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image(
                                    //     width: 20.w,
                                    //     height: 20.h,
                                    //     image: AssetImage(universityData
                                    //         .universityListData[index].!)),
                                    // SizedBox(
                                    //   height: 10.h,
                                    // ),
                                    Text(isCourse==true?universityData.universityCourseDataList[index]
                                              .courseName ??
                                          '':
                                      universityData.universityListData[index]
                                              .universityName ??
                                          '',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
            
                                   
                                    Text(
                                      isCourse==true?universityData
                                            .universityCourseDataList[index].universityName ??
                                        '':
                                      
                                      universityData
                                            .universityListData[index].countryName ??
                                        ''),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
            );
          }
        ));
  }

  commonWidget({required IconData icon, required String title}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 18.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(title),
            ],
          ),
          IconButton(
              onPressed: () async {
                // await homeController.getUniversities();

                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 16.sp,
              ))
        ],
      ),
    );
  }
}
