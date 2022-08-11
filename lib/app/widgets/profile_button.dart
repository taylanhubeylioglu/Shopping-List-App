import 'package:flutter/material.dart';

import '../pages/profile/profile_view.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileView()));
      },
      child: Icon(
        Icons.account_circle,
        size: 35,
      ),
    );
  }
}
