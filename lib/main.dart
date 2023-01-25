import 'package:educationalweb/models/globals.dart';
import 'package:educationalweb/views/screens/web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Educationalweb(),
      "web": (context) => Webview(),
    },
    // home: Educationalweb(),
  ));
}

class Educationalweb extends StatefulWidget {
  const Educationalweb({super.key});

  @override
  State<Educationalweb> createState() => _EducationalwebState();
}

class _EducationalwebState extends State<Educationalweb> {
  InAppWebViewController? inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Educational Web"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          ...websites.map((e) => GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, "web", arguments: e);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey, boxShadow: [
                    BoxShadow(
                        offset: Offset.zero,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 5,
                        spreadRadius: 2)
                  ]),
                  height: 130,
                  margin: EdgeInsets.all(10),
                  width: 130,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.asset(e["image"]),
                            ),
                            Text(
                              e["name"],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )
                      ]),
                ),
              ))
        ]),
      ),
    );
  }
}
