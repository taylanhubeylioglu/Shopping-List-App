import 'package:alisveris_app_homework2/app/pages/address/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../data/repositories/data_address_repository.dart';

class AddressView extends View {
  @override
  State<StatefulWidget> createState() {
    return _AddressViewState(
      AddressController(
        DataAddressRepository(),
      ),
    );
  }
}

class _AddressViewState extends ViewState<AddressView, AddressController> {
  _AddressViewState(AddressController controller) : super(controller);

  int addressNo = 0;
  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "My Address List",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          ControlledWidgetBuilder<AddressController>(
            builder: ((context, controller) {
              return controller.address != null
                  ? Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                            horizontal: size.width * 0.04),
                        child: Column(
                          children: [
                            for (int i = 0; i < controller.address!.length; i++)
                              controller.address![i].userId == "1"
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          bottom: size.height * 0.02),
                                      child: Text(
                                        controller.address![i].userAddress,
                                        style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: 25,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      child: Text(
                                        "Boş",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 35,
                                        ),
                                      ),
                                    ),
                          ],
                        ),
                      ),
                    )
                  : Container();
            }),
          ),
        ],
      ),
    );
  }
}
