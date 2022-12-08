import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/layout/shop_layout/cubit/states.dart';
import 'package:project2/models/shop_model/products_model.dart';
import 'package:project2/modules/shoop_app/catigries/catigories_screen.dart';
import 'package:project2/modules/shoop_app/favoriets/favoriets_screen.dart';
import 'package:project2/modules/shoop_app/products/products_screen.dart';
import 'package:project2/modules/shoop_app/settings/sttings_screen.dart';
import 'package:project2/shared/components/constants.dart';
import 'package:project2/shared/network/end_points.dart';
import 'package:project2/shared/network/remote/dio_helper.dart';

class ShopAppCubit extends Cubit <ShopAppStates>
{
  ShopAppCubit() : super (ShopAppInitialStates()) ;

  static ShopAppCubit get(context) => BlocProvider.of(context) ;

  int currentIndex = 0 ;

  List<Widget> bottomScreens = [
    ProductsScreen() ,
    CategoriesScreen() ,
    FavoritesScreen() ,
    SettingsScreen() ,
  ] ;

  void changeCurrentIndex(index) {
    currentIndex = index ;
    emit(ShopAppChangeCurrentIndexStates()) ;
  }

   HomeModel homeModel ;
  void getHomeData()
  {
    emit(ShopLoadingHomeDataState()) ;

    DioHelper.getData(url: HOME , token: token).then((value)
    {
      homeModel = HomeModel.fromJason(value.data) ;
      printFullText(homeModel.toString()) ;

      print(homeModel.status) ;
      emit(ShopSuccessHomeDataState()) ;
    }).catchError((error)
    {
      print(error.toString()) ;
      emit(ShopErrorHomeDataState()) ;
    }) ;
  }
}
