import 'package:exercise_app/utils/color.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Tập luyện",
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColor.homePageTitle,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
                const SizedBox(width: 10,),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
                const SizedBox(width: 10,),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  "Bài tập của bạn",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageSubtitle,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Chi tiết",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageDetail,
                  ),
                ),
                const SizedBox(width: 5,),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.gradientFirst.withOpacity(0.8),
                    AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight:  Radius.circular(80),
                  bottomLeft: Radius.circular(10),
                  bottomRight:  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(5, 10),
                      blurRadius: 20,
                      color: AppColor.gradientSecond.withOpacity(0.5)
                  ),
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bài tập tiếp theo",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.homePageContainerTextSmall,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    "Săn chắc chân",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.homePageContainerTextSmall,
                    ),
                  ),
                  Text(
                    "và Cơ mông",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.homePageContainerTextSmall,
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 20,
                            color: AppColor.homePageContainerTextSmall,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            "60 phút",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.homePageContainerTextSmall,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.gradientFirst,
                              blurRadius: 10,
                              offset: const Offset(4, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage(""),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
