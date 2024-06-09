import 'package:flutter/material.dart';
class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final String label;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isPressed = false;
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Column(
      children: [
        Material(
          shape: const CircleBorder(),
          color: _isPressed ? Colors.blue : Colors.blue.withOpacity(0.2),
          elevation: 10,
          child: IconButton(
            onPressed: () {
              setState(() {
                _isPressed = !_isPressed;
              });
              _ShowModal().then((_){
                setState(() {
                  _isPressed = false;
                });
              });
            },
            icon: Icon(widget.icon),
            iconSize: 28,
            color: themeData.colorScheme.inverseSurface, 
          ),
        ),
        const SizedBox(height: 7.2),
        Text(
          widget.label,
          style: TextStyle(color: themeData.colorScheme.inverseSurface), 
        ),
      ],
    );
  }
  Future<void> _ShowModal() async{
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Container(
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 20, top: 20),
                    
                    child: Text(''),//mostrar os numeros do numpad aqui
                  ),
                  //numpad
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: List.generate(9, (index) => InkWell(
                    )),
                  )
                ],
              )
            ]
          ),
          
        );
      }
    );
  }
}