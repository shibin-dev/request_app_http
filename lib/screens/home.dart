import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_app_http/providers/new_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<NewsProvider>(context, listen: false).getData();
    }).whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isProvide = Provider.of<NewsProvider>(context);
    return Scaffold(
        
        appBar: AppBar(title: Text("News")),
        body: isProvide.state == NotifierState.loading
            ? Center(
                child: CircularProgressIndicator(),
              ) :
            isProvide.failures != null ?
                Text("${isProvide.failures!.message}",style: TextStyle(fontSize: 25),)
            : ListView.builder(
                itemCount: isProvide.model.articles!.length,
                itemBuilder: (context, index) {
                  var model = isProvide.model.articles![index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 5, right: 5, left: 5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black26),
                    child: Column(
                      children: [
                        Text(
                          "${model.source!.name}",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: model.urlToImage == null
                              ? Container()
                              :model.urlToImage!.endsWith('JPG') ?
                              Container():
                          Image.network("${model.urlToImage}")
                        ),
                        Text("${model.title}",
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${model.description}",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${model.content}",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${model.author}",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
