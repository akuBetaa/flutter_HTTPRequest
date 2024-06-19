import 'package:flutter/material.dart';
import 'PostResultModel.dart';

class ContohPost extends StatefulWidget {
  const ContohPost({super.key});

  @override
  State<ContohPost> createState() => _ContohPostState();
}

class _ContohPostState extends State<ContohPost> {
  PostResultModel? postResultModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Contoh API Post - Beta"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text((postResultModel != null)
                    ? "${postResultModel!.id} | ${postResultModel!.name} | ${postResultModel!.job} | ${postResultModel!.dibuatPada}"
                    : "Tidak ada data"),
                ElevatedButton(
                  onPressed: () {
                    PostResultModel.hubungkanAPI("Beta", "Mahasiswa")
                        .then((value) {
                      setState(() {
                        postResultModel = value;
                      });
                    });
                  },
                  child: Text("POST"),
                ),
              ],
            ),
          )),
    );
  }
}
