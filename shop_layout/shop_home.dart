import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/layout/shop_layout/cubit/cubit.dart';
import 'package:project2/layout/shop_layout/cubit/states.dart';
import 'package:project2/modules/shoop_app/login/login_shop_app.dart';
import 'package:project2/modules/shoop_app/search/search_screen.dart';
import 'package:project2/shared/components/components.dart';
import 'package:project2/shared/network/local/cash_helper.dart';

class ShopLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit , ShopAppStates>(
      listener:(context, state) {},
      builder: (context , state)
      {
        var cubit = ShopAppCubit.get(context) ;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0 ,
            title: Text(
                'Salla'
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search
                ),
                onPressed: ()
                {
                  navigateTo(context, SearchScreen()) ;
                },
              ) ,
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              cubit.changeCurrentIndex(index) ;
            },
            currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon : Icon(
                      Icons.home ,
                    ) ,
                  label: 'Home ' ,
                ) ,
                BottomNavigationBarItem(
                    icon : Icon(
                      Icons.apps ,
                    ) ,
                  label: 'Categories ' ,
                ) ,
                BottomNavigationBarItem(
                    icon : Icon(
                      Icons.favorite ,
                    ) ,
                  label: 'Favorites ' ,
                ) ,
                BottomNavigationBarItem(
                    icon : Icon(
                      Icons.settings ,
                    ) ,
                  label: 'Settings' ,
                ) ,
              ] ,
          ),
        );
      },
    );
  }
}
