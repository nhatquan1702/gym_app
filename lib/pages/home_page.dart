import 'dart:convert';
import 'package:exercise_app/pages/video_page.dart';
import 'package:exercise_app/utils/color.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) => info = json.decode(value));
  }
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
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPage()));
                  },
                  child: Text(
                    "Chi tiết",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.homePageDetail,
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPage()));
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
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
            const SizedBox(height: 5,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/card.jpg"),
                        fit: BoxFit.fill
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: const Offset(8, 10),
                          color: AppColor.gradientSecond.withOpacity(0.4)
                        ),
                        BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(-1, -5),
                            color: AppColor.gradientSecond.withOpacity(0.4)
                        ),
                      ]
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 120,
                    margin: const EdgeInsets.only(bottom: 30, left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage("assets/figure.png"),
                        ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 120, top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bạn đang làm rất tốt",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.homePageDetail,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),
                        RichText(text: TextSpan(
                          text: "giữ nó lên\n",
                          style: TextStyle(
                            color: AppColor.homePagePlanColor,
                            fontSize: 14
                          ),
                          children: [
                            TextSpan(
                              text: "kế hoạch của bạn",
                              style: TextStyle(
                                  color: AppColor.homePagePlanColor,
                                  fontSize: 14
                              ),
                            )
                          ]
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Tiêu điểm",
                  style: TextStyle(
                      fontSize: 25,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    itemCount: info.length.toDouble()~/2, //2
                    itemBuilder: (_, i){
                      int a = 2*i; //0, 2,
                      int b = 2*i +1; //1, 3
                      int c=b;
                      if(info.length.isOdd&&(i+1)==info.length){
                        c=info.length;
                        b=c;
                      }
                      return Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 170,
                            margin: const EdgeInsets.only(left:30,bottom: 15, top:15),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        info[a]['img']
                                    )
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(5, 5),
                                      color: AppColor.gradientSecond.withOpacity(0.1)
                                  ),
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(-5, -5),
                                      color: AppColor.gradientSecond.withOpacity(0.1)
                                  )
                                ]
                            ),
                            child: Center(
                                child:Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[a]["title"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColor.homePageDetail
                                    ),
                                  ),
                                )
                            ),
                          ),
                          if(c!=0) Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 170,
                            margin: const EdgeInsets.only(left:30, bottom: 15, top:15),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        info[b]['img']
                                    )
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(5, 5),
                                      color: AppColor.gradientSecond.withOpacity(0.1)
                                  ),
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(-5, -5),
                                      color: AppColor.gradientSecond.withOpacity(0.1)
                                  )
                                ]
                            ),
                            child: Center(
                                child:Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[b]["title"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColor.homePageDetail
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

