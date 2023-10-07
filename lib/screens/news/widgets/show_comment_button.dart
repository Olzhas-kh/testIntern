import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_intern/const/colors.dart';

class ShowCommentButton extends StatefulWidget {
  final Function onPressed ;
  const ShowCommentButton({super.key, required this.onPressed});

  @override
  State<ShowCommentButton> createState() => _ShowCommentButtonState();
}

class _ShowCommentButtonState extends State<ShowCommentButton> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ButtonStyle(
        padding:  MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16,horizontal: 24)),
        backgroundColor: MaterialStateProperty.all(ColorProject.blueButtonColor),
      ),
      onPressed:widget.onPressed(),

       child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text('Show me 64 comments', style: TextStyle(fontSize: 18, fontFamily: GoogleFonts.inter().fontFamily),),
           const Icon(Icons.remove_red_eye,size: 22,)
         ],
       ),
      
    );
  }
}