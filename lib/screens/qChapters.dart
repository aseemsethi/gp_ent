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
    final qChapters = levels[id];
    print('qChapters called with $title and $id...qChapters = $qChapters');

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return qChaptersItem(
              title: qChapters[index].title,
              image: qChapters[index].imageUrl,
              id: qChapters[index].id,
              complexity: qChapters[index].complexity,
              q: qChapters[index].q,
            );
            //Text(ModelData2[index].title);
          },
          itemCount: qChapters.length,
        ),
      ),
    );
  }
}
