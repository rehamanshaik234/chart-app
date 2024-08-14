import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key,required this.selectedValue,required this.hintText,required this.idKey,required this.titleKey, required this.data,required this.onSelected});
  final Map<String,dynamic>? selectedValue;
  final String hintText;
  final String idKey;
  final String titleKey;
  final List<Map<String,dynamic>> data;
 final Function(Map<String,dynamic>) onSelected;
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late Map<String,dynamic>? _selectedValue;

  @override
  void initState() {
    _selectedValue=widget.selectedValue;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: PopupMenuButton<Map<String,dynamic>>(
        color: Colors.white,
        elevation: 8,
        onSelected: (Map<String,dynamic> value) {
          setState(() {
            _selectedValue = value;
          });
          widget.onSelected(value);
        },
        itemBuilder: (BuildContext context) {
          List<PopupMenuEntry<Map<String,dynamic>>> data=[];
          for (var map in widget.data) {
            data.add(PopupMenuItem<Map<String,dynamic>>(
              value: map,
              child: Container(
                width: 1.sw,
                margin: const EdgeInsets.all(8.0), // Set the margin here
                child: Text(map[widget.titleKey]),
              ),
            ));
          }
          return data;
        },
        child: Container(
          width: 1.sw,
          padding: const EdgeInsets.all(8.0),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedValue!=null ?_selectedValue![widget.titleKey] ??" " :widget.hintText,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: _selectedValue!=null && _selectedValue![widget.titleKey]!=null? Colors.black:Colors.grey,),
              ),
              Icon(Icons.arrow_drop_down,color: Colors.grey,size: 20.sp ,)
            ],
          ),
        ),
      ),
    );
  }
}