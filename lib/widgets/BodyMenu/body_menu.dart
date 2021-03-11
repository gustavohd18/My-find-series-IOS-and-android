import 'package:flutter/material.dart';
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
  int selectedCategory = 0;
  List<String> categories = ["Top popular movies", "Top popular tv shows"];
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
          });
        },
        child: Column(
          children: [
            Text(
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
                      ? kSecondaryColor
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}
