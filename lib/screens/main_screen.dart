import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // main page text and notifications icon
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "الصفحة الرئيسية",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.notification_important_outlined),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  // make a new post bar
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                          radius: 18,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16,
                              child: Image.asset(
                                "assets/images/social_media_icon.png",
                                scale: 40,
                              )),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextFormField(
                            cursorColor: Colors.lightGreen,
                            decoration: InputDecoration(
                                hintText: "أنشر دعاء.....",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                focusColor: Colors.lightGreen,
                                hoverColor: Colors.lightGreen,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.lightGreen, width: 2))),
                          ),
                        ),
                      ],
                    ),
                  ),

                  _betweenPosts(context),

                  
                  // post 
                  _post(context, "السلام عليكم"),


                  // post
                  _post(context, "اللهم انت الله، لا إله إلا انت، انت الغنيّ، و نحن الفقراء، أنزل علينا الغيث، و أجعل ما أنزلت لنا قوةً و بلاغًا إلي حين. اللهم إني أسألك خيرها و خير ما فيها و خير ما أُرسلت به، و أعوذ بك من شرها، و شر ما فيها. اللهم انت الله لا إله إلا انت."),

                  _post(context, "اي حاجه"),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _betweenPosts(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Container(
        color: const Color(0xFFEBF0FF),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
    ],
  );
}

Widget _post(BuildContext context, String postText) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // user name, picture and post time
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightGreen,
                radius: 18,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Image.asset(
                      "assets/images/social_media_icon.png",
                      scale: 40,
                    )),
              ),
              title: Text(
                "محمد أحمد",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              subtitle: Text("منذ 5 دقائق"),
              trailing: const Icon(
                Icons.more_horiz_outlined,
                color: Colors.black,
              ),
            ),

            // the post
            Text(
              postText,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),



            // like, comment and share
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // like
                Container(
                  height:
                  MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.handshake_outlined),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                      Text("إعجاب")
                    ],
                  ),
                ),

                // comment
                Container(
                  height:
                  MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.message_outlined),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                      Text("تعليق")
                    ],
                  ),
                ),

                // share
                Container(
                  height:
                  MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share_outlined),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                      Text("مشاركة")
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                Text("35"),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                Icon(Icons.thumb_up_alt_outlined, size: 20, color: Colors.blue,),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                Icon(Icons.heart_broken, size: 20, color: Colors.red,),
              ],
            ),

            // make a comment
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  radius: 18,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 16,
                      child: Image.asset(
                        "assets/images/social_media_icon.png",
                        scale: 40,
                      )),
                ),
                title: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    cursorColor: Colors.lightGreen,
                    decoration: InputDecoration(
                        hintText: "أكتب تعليقًا.....",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        focusColor: Colors.lightGreen,
                        hoverColor: Colors.lightGreen,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Colors.lightGreen, width: 2)
                        )),
                  ),
                ),

              ),

            ),
          ],
        ),
      ),



      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),

      // quick responses
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.lightGreen,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("  إرسال رسالة  ", style: TextStyle(color: Colors.lightGreen),)
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.lightGreen,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("  صلي الله عليه و سلم  ", style: TextStyle(color: Colors.lightGreen),)
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.lightGreen,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("  ممكن أساعدك  ", style: TextStyle(color: Colors.lightGreen),)
          ),
        ],
      ),


      _betweenPosts(context),
    ],
  );
}
