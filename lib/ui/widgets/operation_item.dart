import 'package:favorfood/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';

class OperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  const OperationItem(this._icon,this._title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        SizedBox(
          width: SizeFit.setPx(5.0),
        ),
        Text(
            _title,
            style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
