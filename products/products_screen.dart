import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/layout/shop_layout/cubit/cubit.dart';
import 'package:project2/layout/shop_layout/cubit/states.dart';
import 'package:project2/models/shop_model/products_model.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit , ShopAppStates>(
      listener: (context ,state ){},
      builder: (context ,state )
      {
        return ConditionalBuilder(
            condition: ShopAppCubit.get(context).homeModel != null ,
            builder: (context) =>productBuilder(ShopAppCubit.get(context).homeModel) ,
          fallback: (context)=> Center(child: CircularProgressIndicator()),
        );
      },
    ) ;
  }

  Widget productBuilder(HomeModel model) => Column(
    children:
    [
      CarouselSlider(
          items:model.data.banners.map((e) =>Image(
            image: NetworkImage('${e.image}'),
            width: double.infinity,
            fit: BoxFit.cover ,
          ) , ).toList() ,
          options: CarouselOptions(
            height: 250.0 ,
            initialPage: 0 ,
            enableInfiniteScroll: true ,
            reverse: false ,
            autoPlay: true ,
            autoPlayInterval: Duration (seconds: 3) ,
            autoPlayAnimationDuration: Duration(seconds: 1) ,
            autoPlayCurve: Curves.fastOutSlowIn ,
            scrollDirection: Axis.horizontal ,
          )) ,
    ],
  );
}
