import 'package:events/views/category.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Theme.of(context).primaryColor,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: Category.categoryList
            .map<Widget>((v) => CategoryItem(category: v))
            .toList(),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(child: Icon(category.icon)),
      tooltip: category.name,
      onPressed: () {},
    );
  }

  final Category category;
}
