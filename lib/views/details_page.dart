import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softronictask/model/data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final DataModel data;

  DetailsPage({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 39, 39),
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 39, 39, 39),
      //   foregroundColor: Colors.white,
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient( 
                colors: [
                  Color.fromARGB(255, 57, 57, 57),
                  Color.fromARGB(255, 35, 35, 35)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,color: Colors.white,))),
                ),
                SizedBox(height: 30,),
                Text(
                  data.name!,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 20,color:Colors.white),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.country!,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 20,color:Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text('-',style: TextStyle(color: Colors.white),),
                    SizedBox(width: 10),
                    Text(
                      data.alphaCode!,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                for (var dom in data.domain!) Text(dom,style: TextStyle(color: Colors.white),),
                SizedBox(height: 10,),
                for (var link in data.webPage!)
                  GestureDetector(
                    onTap: () {
                      loadUrl(link);
                    },
                    child: Text(
                      link,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                Text(data.stateProvince ?? 'State province is not available',style: GoogleFonts.poppins(color:Colors.white),),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  loadUrl(String? url) async {
    final link = Uri.parse(url!);
    try {
      if (await canLaunchUrl(link)) {
        launchUrl(link);
      } else {
        print('couldnot launch');
      }
    } catch (e) {
      throw Exception("Error$e");
    }
  }
}
