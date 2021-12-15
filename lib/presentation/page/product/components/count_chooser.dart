import 'package:flutter/material.dart';

class CountChooser extends StatefulWidget {
  final int initialValue, min, max;
  final void Function(int)? onValueChanged;

  const CountChooser({
    this.initialValue = 0,
    this.min = 0,
    this.max = 10,
    this.onValueChanged,
    Key? key,
  })  : assert(initialValue <= max && initialValue >= min,
            'Initial value mus be less than max value and more than min value'),
        super(key: key);

  @override
  State<CountChooser> createState() => _CountChooserState();
}

class _CountChooserState extends State<CountChooser> {
  late int _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildButton(const Icon(Icons.remove), () {
          _setNewValue(_selectedValue + -1);
        }),
        const SizedBox(
          width: 4,
        ),
        Text('$_selectedValue'),
        const SizedBox(
          width: 4,
        ),
        _buildButton(const Icon(Icons.add), () {
          _setNewValue(_selectedValue + 1);
        }),
      ],
    );
  }

  Widget _buildButton(Icon icon, VoidCallback onTap) {
    return ClipOval(
      child: SizedBox(
        width: 30,
        height: 30,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

  void _setNewValue(int value) {
    if (value <= widget.max && value >= widget.min) {
      setState(() {
        _selectedValue = value;
      });
      _callCallback(value);
    }
  }

  void _callCallback(int number) {
    if (widget.onValueChanged != null) {
      widget.onValueChanged!(number);
    }
  }
}
