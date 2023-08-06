import 'package:flutter/material.dart';
import 'package:gp_ent/data/securityHdg.dart';
//import '../screens/screen2.dart';

class SecurityHdgItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const SecurityHdgItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return Screen2(id, title);
    // }));
    var movetoPage = levels[id];
    print("SecurityHdgs - Move to $id");
    Navigator.of(ctx).pushNamed(
      '/$id',
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // GestreDetector with Ripple effect
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.9),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
