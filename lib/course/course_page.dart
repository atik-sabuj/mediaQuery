import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:screen_design/custom/main_app_bar.dart';
// import 'package:screen_design/helper/helper_constant.dart';
// import 'package:screen_design/models/course_model.dart';
// import 'package:screen_design/provider/course_provider.dart';
import 'package:provider/provider.dart';
// import 'package:screen_design/provider/trainer_provider.dart';
// import '../custom/home_page_drawer.dart';
// import '../helper/helper_method.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'course_model.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<String> coursesByDate = [
    'Upcoming courses',
    'Ongoing courses',
    'Collaborated courses',
    'Old courses',
    'All courses'
  ];
  // late CourseProvider courseProvider;
  // late TrainerProvider trainerProvider;
  // late List<CourseModel> courseModelList;
  int check = 0;
  List<String> favoriteList = [];

  addToFavorite() async {
    final SharedPreferences favoritePrefs =
        await SharedPreferences.getInstance();
    favoriteList = favoritePrefs.getStringList('items') ?? [];
  }

  @override
  void initState() {
    addToFavorite();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    courseProvider = Provider.of(context);
    //trainerProvider = Provider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (check == HelperConstant.UPCOMINGCOURSE) {
      courseModelList = courseProvider.upcomingCourseList;
    }

    if (check == HelperConstant.ONGOINGCOURSE) {
      courseModelList = courseProvider.ongoingCoursesList;
    }

    if (check == HelperConstant.COLLABORATEDCOURSE) {
      courseModelList = courseProvider.collaboratedCourseList;
    }

    if (check == HelperConstant.OLDCOURSE) {
      courseModelList = courseProvider.oldCoursesList;
    }

    if (check == HelperConstant.FULLCOURSE) {
      courseModelList = courseProvider.fullCourseList;
    }

    return Scaffold(
      appBar: MainAppBar(title: 'Course'),
      drawer: HomePageDrawer(),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (contex, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          check = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            border: check == index
                                ? Border.all(color: Colors.red)
                                : Border.all(color: Color(0xffDDDDDD))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            coursesByDate[index],
                            style: GoogleFonts.poppins(
                                color: Color(0xff262626),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: coursesByDate.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            courseModelList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: courseModelList.length,
                        itemBuilder: (context, index) {
                          String trainerName =
                              trainerProvider.getMyCourseTrainerName(
                                  int.parse(courseModelList[index].trainerId!));

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  'course_module_page',
                                  arguments: courseModelList[index]);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(19),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          imageUrl:
                                              'https://pencilbox.edu.bd/${courseModelList[index].trainingImage}',
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                  'images/placeholder.png',
                                                  fit: BoxFit.fill,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: Text(
                                                        courseModelList[index]
                                                            .trainingName!,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Text(
                                                      trainerName,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xff716F6F),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '${courseModelList[index].trainingPrice!}/-BDT',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.red),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.access_time,
                                                          color:
                                                              Color(0xff808080),
                                                          size: 13,
                                                        ),
                                                        const SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          '${courseModelList[index].hours} h',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color(
                                                                0xff808080),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.date_range,
                                                          color:
                                                              Color(0xff808080),
                                                          size: 13,
                                                        ),
                                                        const SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          HelperMethod.getDateFormat(
                                                              'dd-MM-yyyy',
                                                              DateTime.parse(
                                                                  courseModelList[
                                                                          index]
                                                                      .startDate!)),
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color(
                                                                0xff808080),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              top: -15,
                                              right: -10,
                                              child: IconButton(
                                                  onPressed: () {
                                                    final course =
                                                        courseModelList[index];
                                                    addOrRemoveFromFavList(
                                                        course);
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .favorite_border_outlined,
                                                    color:
                                                        favoriteList.contains(
                                                                courseModelList[
                                                                        index]
                                                                    .id
                                                                    .toString())
                                                            ? Colors.red
                                                            : Colors.black,
                                                    size: 13,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }

  void addOrRemoveFromFavList(CourseModel course) async {
    if (favoriteList.contains(course.id.toString())) {
      favoriteList.remove(course.id.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Removed from your favourite list')));
    } else {
      favoriteList.add(course.id.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Added to your favourite list')));
    }

    final SharedPreferences favoritePrefs =
        await SharedPreferences.getInstance();
    Set<String> stringSet = Set<String>();
    stringSet.addAll(favoriteList);
    favoriteList.clear();
    favoriteList.addAll(stringSet);
    await favoritePrefs.setStringList('items', favoriteList);
    setState(() {});
  }
}
