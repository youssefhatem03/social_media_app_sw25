import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}


class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  SizedBox(height: 16,),


                  // back button, profile picture and settings
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_right_alt_outlined),
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
                        Icon(Icons.settings),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height *0.02,),


                  // user name, followers + following count
                  Center(child: Text("محمد أحمد",)),
                  SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("50  متابعًا"),
                      SizedBox(width: MediaQuery.of(context).size.width *0.04,),
                      Text("50  يتابع"),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height *0.01,),



                  // follow and dm buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // follow
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          border: Border.all(
                            color: Colors.lightGreen,
                          ),
                          borderRadius: BorderRadius.circular(12),
                  ),
                          child: Text("  متابعة  ", style: TextStyle(color: Colors.white),)
                      ),


                      SizedBox(width: MediaQuery.of(context).size.width *0.02,),

                      // dm
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightGreen,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text("  إرسال رسالة  ", style: TextStyle(color: Colors.lightGreen),),
                              SizedBox(width: MediaQuery.of(context).size.width *0.01,),
                              Icon(Icons.email_outlined, color: Colors.lightGreen,),
                              SizedBox(width: MediaQuery.of(context).size.width *0.01,),


                            ],
                          )
                      ),
                    ],
                  ),


                  SizedBox(height: MediaQuery.of(context).size.height *0.02,),

                  // posts and comments bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.lightGreen), top: BorderSide(color: Colors.grey))
                        ),
                        child: Center(
                          child: Text("المنشورات"),
                        ),

                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey), right: BorderSide(color: Colors.grey),  bottom: BorderSide(color: Colors.grey))
                        ),
                        child: Center(
                          child: Text("التعليقات"),
                        ),


                      )

                    ],
                  ),

                  _betweenPosts(context),

                  _post(context, "اللهم انت الله، لا إله إلا انت، انت الغنيّ، و نحن الفقراء، أنزل علينا الغيث، و أجعل ما أنزلت لنا قوةً و بلاغًا إلي حين. اللهم إني أسألك خيرها و خير ما فيها و خير ما أُرسلت به، و أعوذ بك من شرها، و شر ما فيها. اللهم انت الله لا إله إلا انت."),
                  _post(context, "اللهم انت الله، لا إله إلا انت، انت الغنيّ، و نحن الفقراء، أنزل علينا الغيث، و أجعل ما أنزلت لنا قوةً و بلاغًا إلي حين. اللهم إني أسألك خيرها و خير ما فيها و خير ما أُرسلت به، و أعوذ بك من شرها، و شر ما فيها. اللهم انت الله لا إله إلا انت."),


                ],
              )
          ),
        ),
      ),
    );
  }
}



Widget _betweenPosts(BuildContext context) {
  return Column(
    children: [
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



      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),

      _betweenPosts(context),
    ],
  );
}

