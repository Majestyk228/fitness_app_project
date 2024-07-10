import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();

    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          const SizedBox(height: 40,),
          _categorySection(),
          const SizedBox(height: 40,),
          _dietSection(),
          const SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Popular',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ListView.separated(
                itemCount: popularDiets.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(left:20, right: 20),
                separatorBuilder: (context, index) => SizedBox(height: 25,),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                      boxShadow: popularDiets[index].boxIsSelected ? [
                        BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        offset: const Offset(0,10),
                        blurRadius: 40,
                        spreadRadius: 0
                      ),
                      ] : []
                    ),child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(popularDiets[index].iconPath,
                        height: 65,
                        width: 65,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black
                              ),),
                              Text(
                                '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Color(0xff7B6F72)
                                ),
                              )
                          ],
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: SvgPicture.asset('assets/icons/button.svg',
                          height: 30,
                          width: 30,),
                        )
                      ],
                    ),
                  );
                }
              ),
            ],
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }

  Column _categorySection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 120,
              //color: Colors.green,
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                itemBuilder: (context,index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: categories[index].boxColor.withOpacity(0.3)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                      ),
                  );
                },
              ),
            ),
          ],
        );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Recommandation \nfor Diet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 240,
              //color: Colors.green,
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                itemBuilder: (context,index) {
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: diets[index].boxColor.withOpacity(0.3)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(diets[index].iconPath),
                          ),
                        Column(
                          children: [
                            Text(
                              diets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected ? Color(0xff9DCEFF) : Colors.transparent,
                                diets[index].viewIsSelected ? Color(0xff92A3FD) : Colors.transparent
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: diets[index].viewIsSelected ?  Colors.white : Color(0xffC58BF2),
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              )
                            ),
                          ),
                        ),
                      ],
                      ),
                  );
                },
              ),
            ),
          ],
        );
  }

// ========================================================

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0),
      ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search Pancake',
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 0.1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/icons/filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfast',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: GestureDetector(
        //onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/backback_arrow.svg',
              height: 20, width: 20),
        ),
      ),
      actions: [
        GestureDetector(
          //onTap: {},
          child: Container(
            width: 37,
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset('assets/icons/options_dots.svg',
                height: 25, width: 35),
          ),
        )
      ],
    );
  }
}
