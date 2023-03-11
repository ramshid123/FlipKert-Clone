import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final pgcont = PageController();
  int i = 0;

  void listen() async {
    while (true) {
      await Future.delayed(Duration(seconds: 2));
      if (i <= 3) {
        pgcont.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
        i++;
      } else {
        pgcont.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
        i = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // listen();
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarCustom(context),
        preferredSize: Size(0, 140),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey[800],
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            groupHorizontal(),
            groupSlide(pgcont),
            group1(),
            group2(Colors.blue),
            group3(),
            group2(Colors.pink[200]),
            group1(),
          ],
        ),
      ),
    );
  }
}

Widget AppBarCustom(BuildContext context) {
  return Container(
    color: Colors.blue[700],
    child: Column(
      children: [
        Container(height: 25, color: Colors.blue[700]),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 80,
                color: Colors.blue[700],
                child: Center(
                  child: Text(
                    'Flipkart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 80,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Grocery',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          color: Colors.blue[700],
          child: Row(
            children: [
              Icon(Icons.home, size: 30),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey, size: 30),
                        Expanded(
                            child: Text(
                          'Search for Products Brands and ..',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )),
                        Icon(Icons.mic, size: 30, color: Colors.blue[700]),
                        SizedBox(width: 10),
                        Icon(Icons.camera_alt,
                            size: 30, color: Colors.blue[700])
                      ],
                    ),
                  ),
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget group1() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sponsored',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            child1(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC_Nd0xiyrN9Z48TMmglVBYhRouqzzVp9SJQ&usqp=CAU',
                'Realme 9 pro 5G',
                'From \$499'),
            child1(
                'https://telugu.samayam.com/thumb/93822351/noise-buds-vs102-plus-launched-in-india-93822351.jpg?imgsize=33544&width=1200&height=900&resizemode=75',
                'Buds VS102 plus',
                'sale on 29th Aug'),
            child1(
                'https://www.india.com/wp-content/uploads/2022/09/Flipkart-Big-Billion-Days-2.jpg',
                'Big Sale',
                'Upto 80% off')
          ],
        )
      ],
    ),
  );
}

Widget child1(String image_url, String title1, String title2) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(color: Colors.grey),
          top: BorderSide(color: Colors.grey),
          right: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        )),
    height: 130,
    child: Column(
      children: [
        Image.network(
          image_url,
          width: (Get.width / 3) - 20,
          height: 90,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 2),
        Text(title1),
        Text(title2, style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
  );
}

Widget group2(Color? clr) {
  return Container(
    color: clr,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Picks',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right))
            ],
          ),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              child2(
                  'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1634932865-68d2f4a5-dfd4-452f-9603-3b38cc05a861.cf0fed763f80c2c117c4b7d7b1c05436.jpg',
                  'Toys and more',
                  'Min. 50% Off'),
              child2(
                'https://rukminim1.flixcart.com/image/800/800/xif0q/computer/7/d/i/zl12-business-laptop-infinix-original-imagm83gc6xr8sau.jpeg?q=90',
                'Electronics and more',
                'Min. 25% Off',
              ),
              child2(
                'https://rukminim1.flixcart.com/image/612/612/xif0q/mixer-grinder-juicer/a/4/x/klove-kenstar-original-imaggcw98fj7fdn8.jpeg?q=70',
                'Home Appliances',
                'Min. 30% Off',
              ),
              child2(
                'https://rukminim1.flixcart.com/image/300/300/krxtrww0/battery-charger/b/t/y/swift-dual-coconut-original-imag5mkgyma8qzyh.jpeg?q=90',
                'Mobile Accessories',
                'Min. 80% Off',
              )
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    ),
  );
}

Widget child2(String image_url, String title1, String title2) {
  return Container(
    padding: const EdgeInsets.all(5.0),
    margin: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    height: 100,
    child: Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 2,
          child: Image.network(
            image_url,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                title1,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                title2,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget group3() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggested for you',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(height: 10),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: 260,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                          left: BorderSide(color: Colors.grey),
                          top: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                        )),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.network(
                            'https://img.etimg.com/thumb/width-1200,height-900,imgsize-34218,resizemode-1,msid-89613545/news/how-to/realme-launches-9-pro-9-pro-here-are-price-details-sale-date-and-discount-offer.jpg',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'Real me 9 pro 5G',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'from \$499',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    child1(
                        'https://telugu.samayam.com/thumb/93822351/noise-buds-vs102-plus-launched-in-india-93822351.jpg?imgsize=33544&width=1200&height=900&resizemode=75',
                        'Buds VS102 plus',
                        'sale on 29th Aug'),
                    child1(
                        'https://www.india.com/wp-content/uploads/2022/09/Flipkart-Big-Billion-Days-2.jpg',
                        'Big Sale',
                        'Upto 80% off')
                  ],
                )),
          ],
        )
      ],
    ),
  );
}

Widget groupHorizontal() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        childHorizontal(
          Colors.red,
          'Electronics',
          'https://th.bing.com/th/id/R.b0dd389bc010f9b524c10f4e977bc282?rik=2bXFXchqkwhysA&riu=http%3a%2f%2fpluspng.com%2fimg-png%2flaptop-png-laptop-notebook-png-image-image-6746-1153.png&ehk=6byFAarnH09NpQkcILADyXHoQI1AG%2bVFwkFkGcmpSnQ%3d&risl=&pid=ImgRaw&r=0',
        ),
        childHorizontal(
          Colors.blue,
          'Appliances',
          'https://th.bing.com/th/id/R.b7a150b0bde7b4ab6522f40ad55c217e?rik=DVtLtG0Ty5vToA&riu=http%3a%2f%2fpluspng.com%2fimg-png%2ftv-hd-png-sle-24f55m4-full-hd-led-television-1300.png&ehk=zkBJNwjlnDkQViXmOYa9UY%2bVDKsjqzOKp84XfkZQ%2b74%3d&risl=&pid=ImgRaw&r=0',
        ),
        childHorizontal(
          Colors.purple,
          'Toys',
          'https://th.bing.com/th/id/R.b5484b6f2c9cc9658e82db0959b24570?rik=XbXh%2fK3uuZ1kjg&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f4%2fPlush-Toy-PNG-Transparent-Image.png&ehk=viKP2Ygv4UR%2bryhuQ5YKPfa7SzLba5XrDUtHWmkytis%3d&risl=&pid=ImgRaw&r=0',
        ),
        childHorizontal(
          Colors.orange,
          'Fashion',
          'https://www.pngarts.com/files/3/Hooded-Jacket-Men-PNG-Transparent-Image.png',
        ),
        childHorizontal(
          Colors.green,
          'Grocery',
          'https://th.bing.com/th/id/R.dbbe194912067408873b4bda100dfd41?rik=LdkTv2N2RN5z6Q&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f7%2fGrocery-Transparent-Background.png&ehk=Y4692gM%2bT91FBFMHIxqolwN1EWCGiPq8JmmGHu2jSEI%3d&risl=&pid=ImgRaw&r=0',
        ),
        childHorizontal(
          Colors.cyan,
          'Mobiles',
          'https://www.myitshop.com.au/wp-content/uploads/iphone-x-transparent.png',
        ),
      ],
    ),
  );
}

Widget childHorizontal(MaterialColor clr, String title, String image_url) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    height: 110,
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            Expanded(child: SizedBox()),
            Container(
                height: 70,
                width: 100,
                decoration: BoxDecoration(
                    color: clr[300], borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Text(
                      title,
                      style: TextStyle(
                          color: clr[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                )),
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 37,
              backgroundColor: clr[900],
              child: CircleAvatar(
                radius: 33,
                backgroundColor: clr[100],
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    image_url,
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox())
          ],
        ),
      ],
    ),
  );
}

Widget groupSlide(PageController cont) {
  return SizedBox(
    height: 200,
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PageView(
          controller: cont,
          children: [
            childSlide(
                'https://images.moneycontrol.com/static-mcnews/2020/06/EaNrqHfU4AA6iAa-e1591863110148.jpg'),
            childSlide('https://pbs.twimg.com/media/EAx5LoQVUAAjf5T.jpg'),
            childSlide('https://pbs.twimg.com/media/DpEWJDRWkAA01Jd.jpg'),
            childSlide('https://pbs.twimg.com/media/EBXOlS2U8AAkSVI.jpg'),
          ],
        ),
        Column(
          children: [
            Expanded(child: SizedBox()),
            slideIndicator(cont),
            SizedBox(height: 10),
          ],
        )
      ],
    ),
  );
}

Widget childSlide(String image_url) {
  return Image.network(
    image_url,
    width: double.infinity,
    fit: BoxFit.fill,
  );
}

Widget slideIndicator(PageController cont) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(20)),
      child: SmoothPageIndicator(
          controller: cont,
          count: 4,
          effect: WormEffect(
              dotColor: Color.fromARGB(255, 105, 105, 105),
              activeDotColor: Colors.white,
              dotWidth: 10,
              dotHeight: 10),
          onDotClicked: (index) {}));
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
