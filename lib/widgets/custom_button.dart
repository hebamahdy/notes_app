import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({super.key,this.onTap,this.isLoading=false});

  //width:double.Infinity
    final  void Function()? onTap;
    final bool isLoading;
@override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: kPrimaryColor),
        child:  Center(
          child:  isLoading ? const SizedBox(
              width: 24,
              height: 24,
              child:  CircularProgressIndicator(color: Colors.black,)) : const Text(
            'Add',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
