import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../elements/custom_text.dart';

import 'layout/body.dart';

class SelectModeView extends StatelessWidget {
  const SelectModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [_popMenu()],
      ),
      body: const SelectModeBody(),
    );
  }

  Widget _popMenu() {
    return PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          size: 20,
          color: Colors.white,
        ),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none),
        itemBuilder: (context) => [
              PopupMenuItem(
                  height: 40,
                  child: CustomText(
                    text: 'English',
                  )),
              PopupMenuItem(
                  height: 40,
                  child: CustomText(
                    text: 'Spanish',
                  ))
            ]);
  }
}
