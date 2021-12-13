import 'package:authentication_demo/services/firebase_service.dart';
import 'package:authentication_demo/utils/app_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FireBaseService fireBaseService = FireBaseService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(),
      body: _homeBody(),
    ));
  }

  PreferredSizeWidget? _appBar() => AppBar(
        title: Text(AppString.homeAppBar),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      );

  Widget? _homeBody() => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                UserCredential data = await fireBaseService.signInWithGoogle();
                // print("Data ==> ${data}");
                Modular.to.pushReplacementNamed(AppString.secondPage,
                    arguments: data);
              },
              child: Text(
                AppString.googleSignIn,
                style: const TextStyle(color: Colors.blue),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: const BorderSide(
                    width: 1.0, color: Colors.blue, style: BorderStyle.solid),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                UserCredential data =
                    await fireBaseService.signInWithFacebook();
                print("Data ==> ${data}");
                Modular.to.pushReplacementNamed(AppString.secondPage,
                    arguments: data);
              },
              child: Text(
                AppString.facebookSignIn,
                style: const TextStyle(color: Colors.blue),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: const BorderSide(
                    width: 1.0, color: Colors.blue, style: BorderStyle.solid),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                UserCredential data =
                await fireBaseService.signInWithGitHub(context);
                print("Data ==> ${data}");
                Modular.to.pushReplacementNamed(AppString.secondPage,
                    arguments: data);
              },
              child: Text(
                AppString.githubSignIn,
                style: const TextStyle(color: Colors.blue),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: const BorderSide(
                    width: 1.0, color: Colors.blue, style: BorderStyle.solid),
              ),
            ),
          ],
        ),
      );
}
