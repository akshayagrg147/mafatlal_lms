// import 'package:flutter/material.dart';
// import 'package:flutter_painter/flutter_painter.dart';
//
// class Whiteboard extends StatefulWidget {
//   const Whiteboard({super.key});
//
//   @override
//   _WhiteboardState createState() => _WhiteboardState();
// }
//
// class _WhiteboardState extends State<Whiteboard> {
//   late PainterController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PainterController()
//       ..thickness = 5.0
//       ..backgroundColor = Colors.white
//       ..drawColor = Colors.black;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Whiteboard"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.clear),
//             onPressed: () => _controller.clear(),
//           ),
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: _save,
//           ),
//         ],
//       ),
//       body: Center(
//         child: FlutterPainter(
//           controller: _controller,
//         ),
//       ),
//       bottomNavigationBar: _buildToolBar(),
//     );
//   }
//
//   Widget _buildToolBar() {
//     return BottomAppBar(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             icon: Icon(Icons.brush),
//             onPressed: () => _controller.thickness = 5.0,
//           ),
//           IconButton(
//             icon: Icon(Icons.create),
//             onPressed: () => _controller.thickness = 10.0,
//           ),
//           IconButton(
//             icon: Icon(Icons.eraser),
//             onPressed: () => _controller.drawColor = Colors.white,
//           ),
//           IconButton(
//             icon: Icon(Icons.color_lens),
//             onPressed: () => _pickColor(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _pickColor() async {
//     Color? color = await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Pick a color"),
//         content: SingleChildScrollView(
//           child: BlockPicker(
//             pickerColor: _controller.drawColor,
//             onColorChanged: (color) {
//               Navigator.of(context).pop(color);
//             },
//           ),
//         ),
//       ),
//     );
//     if (color != null) {
//       _controller.drawColor = color;
//     }
//   }
//
//   Future<void> _save() async {
//     // Implement save functionality here
//   }
// }
