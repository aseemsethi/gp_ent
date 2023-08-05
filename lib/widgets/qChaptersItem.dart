import 'package:flutter/material.dart';
import '../models/qChaptersModel.dart';

class qChaptersItem extends StatelessWidget {
  final String title;
  final Image image;
  final String id;
  final Complexity complexity;
  final dynamic q;

  qChaptersItem({
    required this.title,
    required this.image,
    required this.id,
    required this.complexity,
    required this.q,
  });

  void onTapCall(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/questions',
      arguments: {
        'title': title,
        'id': id,
        'q': q,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapCall(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: image,
                  // child: Image.network(
                  //   image,
                  //   height: 150,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(width: 6),
                      Text(complexity.name),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(width: 6),
                      Text((complexity.name).contains('Simple')
                          ? '10min'
                          : (complexity.name).contains('Hard')
                              ? '20min'
                              : '30min'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
