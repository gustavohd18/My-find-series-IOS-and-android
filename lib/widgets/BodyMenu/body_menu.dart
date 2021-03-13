import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/controller/home.dart';
import 'package:my_find_series_and_movies/responsive.dart';
import 'package:my_find_series_and_movies/util/constants.dart';

class BodyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Category();
  }
}

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final homeController = HomeController();
  int selectedCategory = 0;
  List<String> categories = [
    "Top 10 popular movies",
    "Top 10 popular tv shows"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
            if (index == 0) {
              homeController.setIsMovie();
            } else {
                homeController.setIsSeries();
            }
          });
        },
        child: Column(
          children: [
            Responsive.isMobile(context)
                ? Text(
                    categories[index],
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: index == selectedCategory
                            ? kTextColor
                            : Colors.black.withOpacity(0.4)),
                  )
                : Text(
                    categories[index],
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.w600,
                        color: index == selectedCategory
                            ? kTextColor
                            : Colors.black.withOpacity(0.4)),
                  ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              height: 6,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == selectedCategory
                      ? Colors.blue
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}
