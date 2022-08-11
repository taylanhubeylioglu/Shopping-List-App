import 'package:alisveris_app_homework2/app/pages/profile/profile_controller.dart';
import 'package:alisveris_app_homework2/data/repositories/data_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../address/address_view.dart';
import '../cart/cart_view.dart';

class ProfileView extends View {
  @override
  State<StatefulWidget> createState() {
    return _ProfileViewState(
      ProfileController(
        DataUserRepository(),
      ),
    );
  }
}

class _ProfileViewState extends ViewState<ProfileView, ProfileController> {
  _ProfileViewState(ProfileController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: Row(
          children: [
            SizedBox(width: size.width * 0.19),
            Text("My Profile",
                style: TextStyle(color: Colors.white, fontSize: 24)),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ControlledWidgetBuilder<ProfileController>(
                builder: ((context, controller) {
                  return controller.users != null
                      ? Text(controller.users![0].firstName)
                      : Container();
                }),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Container(
            child: Center(
              heightFactor: 2,
              child: Icon(
                Icons.account_circle_outlined,
                color: Colors.deepOrangeAccent,
                size: size.height * 0.13,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartView()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: size.height * 0.08,
                          color: Colors.deepOrangeAccent,
                        ),
                        Text(
                          "My Shopping List",
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddressView()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.contact_mail,
                          size: size.height * 0.08,
                          color: Colors.deepOrangeAccent,
                        ),
                        Text(
                          "My Address List",
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
