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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 39, 39),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [Colors.amber, Colors.orange], 
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.name!,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.country!,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      Text('-'),
                      SizedBox(width: 10),
                      Text(
                        data.alphaCode!,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green),
                      ),
                    ],
                  ),
                  for (var dom in data.domain!) Text(dom),
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
                  Text(data.stateProvince ?? 'State province is not available'),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
loadUrl(String? url)async{
  final link = Uri.parse(url!);
  try {
    if(await canLaunchUrl(link)){
    launchUrl(link);
  }else{
    print('couldnot launch');
  }
  } catch (e) {
    throw Exception("Error$e");
  }
}

}
