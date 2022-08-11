import 'package:alisveris_app_homework2/app/pages/user_address_add/user_address_controller.dart';
import 'package:alisveris_app_homework2/data/repositories/data_address_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserAddressView extends View {
  @override
  State<StatefulWidget> createState() {
    return _UserAddressViewState(
      UserAddressController(
        DataAddressRepository(),
      ),
    );
  }
}

class _UserAddressViewState
    extends ViewState<UserAddressView, UserAddressController> {
  _UserAddressViewState(UserAddressController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Add User Address"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ControlledWidgetBuilder<UserAddressController>(
            builder: (context, controller) {
              return Column(
                children: [
                  Center(
                    child: Container(
                      width: size.width * 0.80,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        //obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) => {
                          controller.onContentTextFieldChanged(value),
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'User Address',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  GestureDetector(
                    onTap: () {
                      controller.onAddUserAddressButtonPressed();
                    },
                    child: Container(
                      width: size.width * 0.35,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.deepOrangeAccent,
                      ),
                      child: Center(
                          child: Text(
                        "Save",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
