import 'package:authentication_demo/utils/app_string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SecondPage extends StatefulWidget {
  final UserCredential? userData;

  const SecondPage({Key? key,this.userData}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: _secondBody(),
      ),
    );
  }

  PreferredSizeWidget? _appBar() => AppBar(
    title: Text(AppString.secondAppBar),
    backgroundColor: Colors.blue,
    elevation: 5.0,
    actions: [
      IconButton(onPressed: () async {
        await FacebookAuth.instance.logOut();
        // await GoogleSignIn().signOut();
        Modular.to.navigate(AppString.homePage);
      }, icon: const Icon(Icons.logout))
    ],
  );

  Widget? _secondBody() => Container(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
            imageUrl: widget.userData!.user!.photoURL!,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Text("Email : ${widget.userData!.user!.email}"),
        Text("Uid : ${widget.userData!.user!.uid}"),
        Text("Display Name : ${widget.userData!.user!.displayName}"),
        Text("Phone Number : ${widget.userData!.user!.phoneNumber}"),
        Text("UserName : ${widget.userData!.additionalUserInfo!.username}"),
      ],
    ),
  );

}
