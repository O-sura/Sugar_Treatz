import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/products_controller.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchHelper();
  }
}

class SearchHelper extends StatefulWidget {
  const SearchHelper({Key? key}) : super(key: key);

  @override
  State<SearchHelper> createState() => _SearchHelperState();
}

class _SearchHelperState extends State<SearchHelper> {
  TextEditingController editingController = TextEditingController();
  ProductController productController = Get.find();

  var items = [];

  @override
  void initState() {
    productController.loadAllProducts();
    items.addAll(productController.allProducts);
    super.initState();
  }

  void filterSearchResults(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(productController.allProducts);
    if (query.isNotEmpty) {
      List dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(productController.allProducts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: Dimensions.width50,
              height: Dimensions.height50,
              margin: EdgeInsets.only(
                top: Dimensions.height40,
                left: Dimensions.width10,
              ),
              decoration: BoxDecoration(
                color: Colors.pink.shade200,
                borderRadius: BorderRadius.circular(Dimensions.height40),
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: Dimensions.height30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.height25),
                    ),
                    borderSide:
                        BorderSide(color: Colors.pink.shade100, width: 2.0),
                  ),
                  labelText: "Find Your Favourites",
                  labelStyle: TextStyle(
                    color: Colors.pink,
                    fontSize: Dimensions.height16,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.pink,
                    size: Dimensions.height24,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.height25),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                  //bottom: Dimensions.height10,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Dimensions.width10,
                    mainAxisSpacing: Dimensions.height15,
                  ),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/product-detail", arguments: {
                          "name": items[index].name,
                          "imagePath": items[index].imagePath,
                          "rating": items[index].rating,
                          "review_count": items[index].reviewCount,
                          "description": items[index].description,
                          "price": items[index].price,
                          "flavor": items[index].flavor,
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: Dimensions.width290,
                              height: Dimensions.height180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.height10),
                                  topLeft: Radius.circular(Dimensions.height10),
                                ),
                                image: DecorationImage(
                                  image:
                                      AssetImage("${items[index].imagePath}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Text(
                              "${items[index].name}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.height16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade200,
                          border: Border.all(
                            color: Colors.pink.shade100,
                            width: 2,
                          ),
                          borderRadius:
                              BorderRadius.circular(Dimensions.height10),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
