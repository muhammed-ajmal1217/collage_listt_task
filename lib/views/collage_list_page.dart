import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:softronictask/controller/api_provider.dart';
import 'package:softronictask/model/data_model.dart';
import 'package:softronictask/service/api_service.dart';
import 'package:softronictask/views/details_page.dart';

class CollageListpage extends StatefulWidget {
  const CollageListpage({super.key});

  @override
  State<CollageListpage> createState() => _CollageListpageState();
}

class _CollageListpageState extends State<CollageListpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 39, 39),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 39, 39, 39),
          title: Center(
            child: Text(
              'Collages',
              style: GoogleFonts.poppins(fontWeight:FontWeight.bold,color:Colors.white),
            ),
          ),
        ),
        body: Consumer<ApiProvider>(
            builder: (context, provider, child) =>
                FutureBuilder<List<DataModel>>(
                  future: provider.getDatas(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final List<DataModel> data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          DataModel collageList = data[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              color: index%2==0?Color.fromARGB(255, 43, 43, 53):Color.fromARGB(255, 48, 51, 55),
                              ),
                              width: double.infinity,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(data: collageList,),));
                                  },
                                  child: ListTile(
                                    title: Text(collageList.name!,style: GoogleFonts.raleway(fontWeight:FontWeight.w600,color:Colors.white),),
                                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 14,),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                )));
  }
}
