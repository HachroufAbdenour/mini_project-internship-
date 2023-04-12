import 'package:flutter/material.dart';
import 'package:mini_projet/constant/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant/constant.dart';
import '../../Data/model/user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key, required this.e});
  final User e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.kSecondaryColor,
        title: Text("${e.username}"),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: 100.0,
            height: 150.0,
            decoration: BoxDecoration(
              color: MyColors.kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(kDefaultPadding * 2),
                bottomRight: Radius.circular(kDefaultPadding * 2),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 50.0,
                  minRadius: 50.0,
                  backgroundColor: MyColors.kSecondaryColor,
                  backgroundImage: AssetImage('assets/images/profi.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text("${e.name?.firstname}  ${e.name?.lastname}",
                        style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            title: Text(
              "${e.id}",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.nature),
            iconColor: Colors.blueAccent,
          ),
          ListTile(
            title: Text(
              "${e.email}",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.email),
            iconColor: Colors.blueAccent,
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            title: Text(
              "${e.password} ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.lock),
            iconColor: Colors.blueAccent,
          ),
          ListTile(
            title: Text(
              "${e.address?.city} ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.location_city_outlined),
            iconColor: Colors.blueAccent,
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            title: Text(
              "${e.address?.street} ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.streetview),
            iconColor: Colors.blueAccent,
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            title: Text(
              "${e.address?.zipcode} ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.zoom_in_map),
            iconColor: Colors.blueAccent,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
                width: 30.0,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "${e.phone}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(Icons.phone_android),
                        iconColor: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: MyColors.kPrimaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      ),
                      onPressed: () async {
                        final Uri url = Uri(
                          scheme: 'tel',
                          path: "${e.phone}",
                        );
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("can't lanchuer this url");
                        }
                      },
                      child: Text("Call"),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 100.0,
          ),
          Card(
            color: MyColors.kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 46,
                  color: Colors.cyan,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Get User Loaction",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                TextButton(
                  onPressed: () {
                    /*. open location postition on google maps ..*/
                  },
                  child: Text(
                    "Get currrnt location",
                    style: TextStyle(
                      fontSize: 20.0,
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
