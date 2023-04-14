import 'package:flutter/material.dart';
import 'package:mini_projet/UI/widget/map_widget.dart';
import 'package:mini_projet/constant/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant/constant.dart';
import '../../Data/model/user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key, required this.e, required this.context});
  final User e;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.kSecondaryColor,
        title: Text("${e.username}"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            width: 100.0,
            height: 150.0,
            decoration: BoxDecoration(
              color: MyColors.kPrimaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(kDefaultPadding * 2),
                bottomRight: Radius.circular(kDefaultPadding * 2),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  maxRadius: 50.0,
                  minRadius: 50.0,
                  backgroundColor: MyColors.kSecondaryColor,
                  backgroundImage: AssetImage('assets/images/profi.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text("${e.name?.firstname}  ${e.name?.lastname}",
                        style: const TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            title: Text(
              "${e.id}",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.nature),
            iconColor: Colors.blueAccent,
          ),
          ListTile(
            title: Text(
              "${e.email}",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.email),
            iconColor: Colors.blueAccent,
          ),
          const SizedBox(
            height: 2,
          ),
          ListTile(
            title: Text(
              "${e.password} ",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.lock),
            iconColor: Colors.blueAccent,
          ),
          ListTile(
            title: Text(
              "${e.address?.city} ",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.location_city_outlined),
            iconColor: Colors.blueAccent,
          ),
          const SizedBox(
            height: 2,
          ),
          ListTile(
            title: Text(
              "${e.address?.street} ",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.streetview),
            iconColor: Colors.blueAccent,
          ),
          const SizedBox(
            height: 2,
          ),
          ListTile(
            title: Text(
              "${e.address?.zipcode} ",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.zoom_in_map),
            iconColor: Colors.blueAccent,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
                width: 30.0,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "${e.phone}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: const Icon(Icons.phone_android),
                        iconColor: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: MyColors.kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 12),
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
                      child: const Text("Call"),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 100.0,
          ),
          _showMaps()
        ],
      ),
    );
  }

  Card _showMaps() {
    return Card(
      color: MyColors.kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on,
            size: 46,
            color: Colors.cyan,
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            "Get User Loaction",
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          TextButton(
            onPressed: () {
              /*. open location position on google maps ..*/

              double latitude =
                  double.parse(e.address!.geolocation!.lat ?? '0');
              double longitude =
                  double.parse(e.address?.geolocation?.lat ?? '0');

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MapsWidget(
                          // try testing real latlag in location bousaada (lat=35.2133123) and (lan=4.1809702)

                          latitude: latitude,
                          longitude: longitude)));
            },
            child: const Text(
              "Get currrnt location",
              style: TextStyle(
                fontSize: 20.0,
                backgroundColor: Colors.cyan,
              ),
            ),
          )
        ],
      ),
    );
  }
}
