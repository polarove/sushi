import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/constants/size.dart';
import 'package:sushi/constants/theme.dart';
import 'package:sushi/pages/detail_page.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final List foodMenu = [
    Food(
        image: Image.asset("lib/images/sushi.png"),
        rating: "2.4",
        price: 22.5,
        name: "Salmon Sushi"),
    Food(
        image: Image.asset("lib/images/sushi-2.png"),
        rating: "4.4",
        price: 21.5,
        name: "Tex Sushi"),
    Food(
        image: Image.asset("lib/images/sushi-3.png"),
        rating: "5.0",
        price: 12.5,
        name: "Sora Sushi"),
    Food(
        image: Image.asset("lib/images/sushi-4.png"),
        rating: "3.2",
        price: 18.2,
        name: "Wumini Sushi"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Sushi"),
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Sizes.extraLarge),
            child: InkWell(
                borderRadius: BorderRadius.circular(Sizes.extraLarge),
                onTap: () => {},
                child: const Padding(
                  padding: EdgeInsets.all(Sizes.small),
                  child: Icon(Icons.shopping_cart),
                )),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.extraLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Discount(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.giant),
              child: SearchField(),
            ),
            Text(
              "Food Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: Sizes.giant),
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodMenu.length,
                    padding: const EdgeInsets.symmetric(vertical: Sizes.large),
                    itemBuilder: (context, index) {
                      final food = foodMenu[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FoodDetailPage(food: food))),
                        child: FoodTile(
                          food: food,
                        ),
                      );
                    })),
            const Favorite()
          ],
        ),
      ),
    );
  }
}

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 134,
      padding: const EdgeInsets.all(Sizes.medium),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(Sizes.extraLarge)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Get 32% off now",
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white, fontSize: Sizes.extraLarge),
              ),
              SizedBox(
                height: Sizes.giant * 2,
                child: FilledButton(
                    onPressed: () => {},
                    style: FilledButton.styleFrom(backgroundColor: buttonColor),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Redeem",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: Sizes.large,
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    )),
              ),
            ],
          ),
          Image.asset("lib/images/sushi.png")
        ],
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<StatefulWidget> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.large))),
        hintText: "Search here...",
      ),
    );
  }
}

class Food {
  Image image;
  String rating;
  double price;
  String name;

  Food(
      {required this.image,
      required this.rating,
      required this.price,
      required this.name});
}

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.giant)),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.giant),
      margin: const EdgeInsets.only(right: Sizes.giant),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.large),
            child: food.image,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.large),
            child: Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: Sizes.extraLarge),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${food.price}"),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: Sizes.extraLarge,
                    color: Colors.yellow[800],
                  ),
                  const SizedBox(
                    width: Sizes.small,
                  ),
                  Text(food.rating)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  void addFavorite() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.giant, vertical: Sizes.medium),
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.giant)),
      margin: const EdgeInsets.only(bottom: Sizes.giant),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('lib/images/sushi-3.png'),
              const SizedBox(
                width: Sizes.giant,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Salmon Eggs",
                    style:
                        GoogleFonts.dmSerifDisplay(fontSize: Sizes.extraLarge),
                  ),
                  const Text("\$20.23")
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () => addFavorite(),
            child: Icon(Icons.favorite_outline,
                color: Colors.grey[600], size: Sizes.giant * 1.5),
          )
        ],
      ),
    );
  }
}
