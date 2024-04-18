import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trinity/controller/home_controller.dart';
import 'package:trinity/controller/profile/profile_controller.dart';
import 'package:trinity/view/home/location_screen.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(profileController.appbarWidth.value.h,
              profileController.appbarHeight.value.h),
          child: Container(
              height: profileController.appbarHeight.value,
              // duration: Duration(milliseconds: 1000),

              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.r),
                  bottomRight: Radius.circular(50.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
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
                    onTap: () {
                      // showSearch(
                      //     context: context,
                      // delegate: CustomSearchDelegate(searchList: []));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                          ),
                          GetBuilder<HomeController>(builder: (searchData) {
                            return Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      await homeController.getCourseSearchData(
                                          pageStart: 0, pageEnd: 10);

                                      showSearch(
                                          context: context,
                                          delegate: CustomSearchDelegate(
                                              searchList:
                                                  searchData.searchResultList,
                                              queryString: 'anandhu'));
                                    },
                                    icon: const Icon(Icons.search)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (profileController
                                              .appbarHeight.value ==
                                          350) {
                                        profileController.appbarHeight.value =
                                            180;
                                      } else {
                                        profileController.appbarHeight.value =
                                            350;
                                      }
                                    },
                                    icon: Icon(
                                        Icons.format_align_center_rounded)),
                              ],
                            );
                          })
                        ],
                      )),
                    ),
                  ),
                  Container(
                    // duration: Duration(milliseconds: 5000),

                    child: profileController.appbarHeight.value == 350
                        ? Column(
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              GetBuilder<HomeController>(
                                  builder: (countryData) {
                                return Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: DropdownButtonFormField(
                                      iconDisabledColor: Colors.grey,
                                      iconEnabledColor: Colors.white,
                                      menuMaxHeight: 400.h,
                                      value: countryData
                                                  .dropDownCountryValue.value ==
                                              ''
                                          ? 'Select'
                                          : countryData
                                              .dropDownCountryValue.value,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          height: 1,
                                          color: Colors.white),
                                      dropdownColor: Colors.pink,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          //  contentPadding: EdgeInsets.all(13),
                                          // hintText: data.inspectionDropdownValue.value
                                          //     .isEmpty? 'Location':'',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r))),
                                      onChanged: (value) {
                                        if (value != null) {
                                          countryData.dropDownCountryValue
                                              .value = value;
                                        }
                                      },
                                      hint: Text(
                                        'Select',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white),
                                      ),
                                      items: countryData.dropDownCountryList
                                          .map((e) => DropdownMenuItem(
                                                value: e['Country_Name']
                                                    .toString(),
                                                child: Text(
                                                  e['Country_Name'].toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.white),
                                                ),
                                              ))
                                          .toList()),
                                );
                              }),
                              SizedBox(
                                height: 15.h,
                              ),
                              GetBuilder<HomeController>(builder: (levelData) {
                                return Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: DropdownButtonFormField(
                                      iconDisabledColor: Colors.grey,
                                      iconEnabledColor: Colors.white,
                                      menuMaxHeight: 400.h,
                                      value: levelData
                                                  .dropDownLevelValue.value ==
                                              ''
                                          ? 'Select'
                                          : levelData.dropDownLevelValue.value,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          height: 1,
                                          color: Colors.white),
                                      dropdownColor: Colors.pink,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          //  contentPadding: EdgeInsets.all(13),
                                          // hintText: data.inspectionDropdownValue.value
                                          //     .isEmpty? 'Location':'',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r))),
                                      onChanged: (value) {
                                        if (value != null) {
                                          levelData.dropDownLevelValue.value =
                                              value;
                                        }
                                      },
                                      hint: Text(
                                        'Select',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white),
                                      ),
                                      items: levelData.dropDownLevelList
                                          .map((e) => DropdownMenuItem(
                                                value: e['Level_Detail_Name']
                                                    .toString(),
                                                child: Text(
                                                  e['Level_Detail_Name']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.white),
                                                ),
                                              ))
                                          .toList()),
                                );
                              }),
                              SizedBox(
                                height: 15.h,
                              ),
                              GetBuilder<HomeController>(builder: (intakeData) {
                                return Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: DropdownButtonFormField(
                                      iconDisabledColor: Colors.grey,
                                      iconEnabledColor: Colors.white,
                                      menuMaxHeight: 400.h,
                                      value: intakeData
                                                  .dropDownIntakeValue.value ==
                                              ''
                                          ? 'Select'
                                          : intakeData
                                              .dropDownIntakeValue.value,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          height: 1,
                                          color: Colors.white),
                                      dropdownColor: Colors.pink,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          //  contentPadding: EdgeInsets.all(13),
                                          // hintText: data.inspectionDropdownValue.value
                                          //     .isEmpty? 'Location':'',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r))),
                                      onChanged: (value) {
                                        if (value != null) {
                                          intakeData.dropDownIntakeValue.value =
                                              value;
                                        }
                                      },
                                      hint: Text(
                                        'Select',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white),
                                      ),
                                      items: intakeData.dropDownIntakeList
                                          .map((e) => DropdownMenuItem(
                                                value:
                                                    e['Intake_Name'].toString(),
                                                child: Text(
                                                  e['Intake_Name'].toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.white),
                                                ),
                                              ))
                                          .toList()),
                                );
                              }),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          )
                        : Container(),
                  ),
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
                locationListViewWidget(),

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
      ),
    );
  }

  Container customDropdownHome() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: DropdownButtonFormField(
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Colors.black,
          // value: profileController
          //             .profileGenderDropDownValue
          //             .value ==
          //         ''
          //     ? 'Select'
          //     : profileController
          //         .profileGenderDropDownValue.value,
          style: TextStyle(fontSize: 12.sp, height: 1),
          decoration: InputDecoration(
              isDense: true,
              //  contentPadding: EdgeInsets.all(13),
              // hintText: data.inspectionDropdownValue.value
              //     .isEmpty? 'Location':'',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.r))),
          onChanged: (value) {
            if (value != null) {
              profileController.profileGenderDropDownValue.value = value;
            }
          },
          hint: Text(
            'Select',
            style: TextStyle(fontSize: 12.sp),
          ),
          items: homeController.dropDownCountryList
              .map((e) => DropdownMenuItem(
                    value: e['Country_Name'].toString(),
                    child: Text(
                      e['Country_Name'].toString(),
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
                  ))
              .toList()),
    );
  }

  SizedBox locationListViewWidget() {
    return SizedBox(
      height: 250.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            homeController.locationDataList.length,
            (index) => InkWell(
                  onTap: () {
                    // print(countryNameList[index]);

                    // Get.to(() => LocationScreen(
                    //       description: homeController.locationDataList[index]
                    //           ['description'],
                    //       title: homeController.locationDataList[index]
                    //           ['country_name'],
                    //       imgUrl: homeController.locationDataList[index]
                    //           ['img_url'],
                    //       // universityCount: universityCountList[index],
                    //     ));
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 80.r,
                            backgroundColor: Colors.amber,
                            backgroundImage: AssetImage(homeController
                                .locationDataList[index]['img_url']),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            homeController.locationDataList[index]
                                ['country_name'],
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

  Container commonListViewWidget({bool isCourse = false}) {
    return Container(
        width: Get.width,
        height: 100.h,
        child: GetBuilder<HomeController>(builder: (data) {
          return ListView(
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,

            children: List.generate(
                isCourse == true
                    ? data.universityCourseDataList.length
                    : data.universityListData.length,
                (index) =>
                    GetBuilder<HomeController>(builder: (universityData) {
                      return InkWell(
                        onTap: () async {
                          universityData.courseDetails = null;

                          if (isCourse == true) {
                            await homeController.getCourseDetails(
                                courseName: universityData
                                        .universityCourseDataList[index]
                                        .courseName ??
                                    '',
                                courseId: universityData
                                        .universityCourseDataList[index]
                                        .courseId ??
                                    0);
                          } else {
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
                                  Text(
                                    isCourse == true
                                        ? universityData
                                                .universityCourseDataList[index]
                                                .courseName ??
                                            ''
                                        : universityData
                                                .universityListData[index]
                                                .universityName ??
                                            '',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),

                                  Text(isCourse == true
                                      ? universityData
                                              .universityCourseDataList[index]
                                              .universityName ??
                                          ''
                                      : universityData.universityListData[index]
                                              .countryName ??
                                          ''),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          );
        }));
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

                // showSearch(
                //     context: context,
                //     delegate: CustomSearchDelegate(searchList: []));
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
