import 'package:flutter/material.dart';
import '../widgets/qChaptersItem.dart';
import '../data/securityHdg.dart';

class QChapters extends StatelessWidget {
  // final String id, title;
  // const Screen2(this.id, this.title);
  // ...Screens should be passed params as routeArgs vs Constructors

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return qChaptersItem(
              title: qChaptersData[index].title,
              image: qChaptersData[index].imageUrl,
              complexity: qChaptersData[index].complexity,
            );
            //Text(ModelData2[index].title);
          },
          itemCount: qChaptersData.length,
        ),
      ),
    );
  }
}
