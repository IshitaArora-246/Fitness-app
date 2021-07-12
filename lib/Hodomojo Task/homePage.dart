import 'package:fitness_app/Hodomojo%20Task/api/apiService.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class HodomojoHomePage extends StatelessWidget {
  HodomojoHomePage({Key key}) : super(key: key);
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: InkWell(
          onTap: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => bottomSheet(),
          ),
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.indigoAccent.shade700,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1531306728370-e2ebd9d7bb99?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
                ),
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "View Bottom sheet",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.7,
      maxChildSize: 0.8,
      builder: (context, scrollController) => FutureBuilder(
          future: ApiService().fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> jsonResponse = snapshot.data["data"];
              List<dynamic> finaldata = jsonResponse["components"];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Scrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: finaldata.length,
                      itemBuilder: (context, index) {
                        if (finaldata[index]["type"] == "image")
                          return Image.network(
                            finaldata[index]["url"],
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.network(
                                      "https://blogs.informatica.com/partners/wp-content/uploads/sites/25/2017/11/Galaxy-Square.jpg"));
                            },
                          );
                        else if (finaldata[index]["type"] == "text") {
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 25, horizontal: 15),
                            color: Colors.yellow.shade100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  finaldata[index]["title"],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  finaldata[index]["desc"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade800,
                                      letterSpacing: 1.09),
                                ),
                              ],
                            ),
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Shimmer.fromColors(
                    direction: ShimmerDirection.ltr,
                    period: Duration(seconds: 2),
                    baseColor: Colors.white,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )),
              );
            }
          }),
    );
  }
}
