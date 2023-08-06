// Thanks to https://codepen.io/maks-the-lessful/pen/OJMLZav
// Modifid this  code as is to make the network diagram
import 'package:flutter/material.dart';
import '../services/auth.dart';

class Network extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home:
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('GP Security - Labs'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              semanticLabel: 'logout',
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: ItemsScene(),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
      //),
    );
  }
}

class ItemsScene extends StatefulWidget {
  @override
  _ItemsSceneState createState() => _ItemsSceneState();
}

class _ItemsSceneState extends State<ItemsScene> {
  List<ItemModel> items = [
    ItemModel(offset: Offset(70, 100), text: 'Internet GW'),
    ItemModel(offset: Offset(200, 100), text: 'EC2-1 (Public Subnet)'),
    ItemModel(offset: Offset(200, 230), text: 'EC2-2 (Pvt Subnet)'),
  ];

  Function onDragStart(int index) => (x, y) {
        setState(() {
          items[index] = items[index].copyWithNewOffset(Offset(x, y));
        });
      };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(
          size: Size(double.infinity, double.infinity),
          painter: CurvedPainter(
            offsets: items.map((item) => item.offset).toList(),
          ),
        ),
        ..._buildItems()
      ],
    );
  }

  List<Widget> _buildItems() {
    final res = <Widget>[];
    items.asMap().forEach((ind, item) {
      res.add(_Item(
        onDragStart: onDragStart(ind),
        offset: item.offset,
        text: item.text,
        key: Key('null'),
      ));
    });

    return res;
  }
}

class _Item extends StatelessWidget {
  _Item({
    required Key key,
    required this.offset,
    required this.onDragStart,
    required this.text,
  });

  final double size = 100;
  final Offset offset;
  final Function onDragStart;
  final String text;

  _handleDrag(details) {
    print(details);
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    onDragStart(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx - size / 2,
      top: offset.dy - size / 2,
      child: GestureDetector(
        onPanStart: _handleDrag,
        onPanUpdate: _handleDrag,
        child: Container(
          width: size,
          height: size,
          child: Text(text),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  CurvedPainter({required this.offsets});

  final List<Offset> offsets;

  @override
  void paint(Canvas canvas, Size size) {
    if (offsets.length > 1) {
      offsets.asMap().forEach((index, offset) {
        if (index == 0) return;
        canvas.drawLine(
          offsets[index - 1],
          offsets[index],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 4,
        );
      });
    }
    // canvas.drawLine(
    //   offsets[0],
    //   offsets[2],
    //   Paint()
    //     ..color = Colors.red
    //     ..strokeWidth = 2,
    // );
  }

  @override
  bool shouldRepaint(CurvedPainter oldDelegate) => true;
}

class ItemModel {
  ItemModel({required this.offset, required this.text});

  final Offset offset;
  final String text;

  ItemModel copyWithNewOffset(Offset offset) {
    return ItemModel(offset: offset, text: text);
  }
}
