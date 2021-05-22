import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_items.dart';

class CategoryFilterEntry {
  const CategoryFilterEntry(this.name);
  final String name;
}

class CategoriesFilter extends StatefulWidget {
  const CategoriesFilter({Key key}) : super(key: key);

  @override
  State createState() => _CategoriesFilterState();
}

class _CategoriesFilterState extends State<CategoriesFilter> {
  final List<CategoryFilterEntry> _cast = <CategoryFilterEntry>[
    const CategoryFilterEntry('Category 1'),
    const CategoryFilterEntry('Category 2'),
    const CategoryFilterEntry('Category 3'),
    const CategoryFilterEntry('Category 4'),
  ];
  final List<String> _filters = <String>[];

  Iterable<Widget> get categoryWidget sync* {
    for (final CategoryFilterEntry category in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(3.5),
        child: FilterChip(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: main, width: 1),
            borderRadius: BorderRadius.circular(100),
          ),
          checkmarkColor: Colors.lightBlue,

          backgroundColor: lightGrey,
          selectedColor: pink2,
          label: Text(category.name),
          selected: _filters.contains(category.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(category.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == category.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
            children: categoryWidget.toList()
      ),
    );
  }

}