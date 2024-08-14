import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/views/widgets/popups/custom_pop_ups.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlineTextField extends StatefulWidget {
   const OutlineTextField({super.key, required this.hintText,required this.controller,required this.icon, this.onDone,
     this.isPassword=false});
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final VoidCallback? onDone;
  @override
  State<OutlineTextField> createState() => _OutlineTextFieldState();
}

class _OutlineTextFieldState extends State<OutlineTextField> {
  bool showPassword=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.primaryColor),
        color: AppColors.secondaryColor
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 8.w,),
          Icon(widget.icon,color: AppColors.primaryColor,size:20.sp,),
          SizedBox(width: 8.w,),
          Flexible(
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.isPassword? !showPassword:false,
              onEditingComplete: (){
                if(!widget.isPassword){
                  if(widget.controller.text.isNotEmpty){
                    Focus.of(context).nextFocus();
                  }else{
                    CustomPopUps.showSnackBar(context,"Please Enter ${widget.hintText}",Colors.white,Colors.redAccent);
                  }
                }else{
                  Focus.of(context).unfocus();
                  widget.onDone!();
                }
                },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black.withOpacity(0.7),fontSize: 16.sp)
              ),
            ),
          ),
          Visibility(
            visible: widget.isPassword,
              child: IconButton(onPressed: (){
                if(widget.isPassword){
                  showPassword=!showPassword;
                  setState(() {});
                }
              }, icon: Icon(showPassword?Icons.visibility_off: Icons.visibility,color: AppColors.primaryColor,size: 20.sp,)))
        ],
      ),
    );
  }
}
