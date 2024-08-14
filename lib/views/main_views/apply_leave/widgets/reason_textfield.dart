import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ReasonTextField extends StatefulWidget {
  const ReasonTextField({super.key,required this.onFocusChanged});
  final Function(bool) onFocusChanged;

  @override
  State<ReasonTextField> createState() => _ReasonTextFieldState();
}

class _ReasonTextFieldState extends State<ReasonTextField> {
  bool hasFocus=false;
  FocusScopeNode focusNode=FocusScopeNode();
  KeyboardVisibilityController keyboardVisibilityController=KeyboardVisibilityController();


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      keyboardVisibilityController.onChange.listen((val){
        if(!val){
          focusNode.unfocus();
        }
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: KeyboardVisibilityBuilder(
          controller: keyboardVisibilityController,
          builder: (context,val) {
            return FocusScope(
              node: focusNode,
              onFocusChange:widget.onFocusChanged,
              child: TextField(
                maxLines: 5,
                onTap: (){
                  focusNode.requestFocus();
                },
                onTapOutside: (val){
                  focusNode.unfocus();
                  setState(() {

                  });
                },
                decoration: InputDecoration(
                    hintText: "Enter Reason",
                    hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey),
                    border: InputBorder.none
                ),
              ),
            );
          }
      ),
    );
  }
}
