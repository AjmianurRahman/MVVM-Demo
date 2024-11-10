import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/colors.dart';


class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;
  RoundButton({super.key, required this.title, required this.loading, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        child: Center(child: loading? CircularProgressIndicator() : Text(title, style: TextStyle(color: Colors.white, fontSize: 16),)),
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
