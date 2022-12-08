class HomeModel
{
   bool status ;
   HomeDataModel data ;

  HomeModel.fromJason(Map<String , dynamic> jason)
  {
    status = jason['status'] ;
    data = HomeDataModel.fromJason(jason['data']) ;
  }
}

class HomeDataModel
{
  List banners = []  ;
  List products = [];

  HomeDataModel.fromJason(Map<String , dynamic> jason)
  {
    jason['banners'].forEach((element)
    {
      banners.add(element) ;
    });

    jason['products'].forEach((element)
    {
      products.add(element) ;
    });
  }
}
class BannerModel
{
   int id ;
   String image ;
  BannerModel.fromJason(Map<String , dynamic> jason)
  {
    id = jason['id'] ;
    image = jason['image'] ;
  }
}
class ProductModel
{
   int id ;
   dynamic price ;
   dynamic oldPrice ;
   dynamic discount ;
   String image ;
   String name ;
   bool inFavorites ;
   bool inCart ;
  ProductModel.fromJason(Map<String , dynamic> jason)
  {
    id = jason['id'] ;
    price = jason['price'] ;
    oldPrice = jason['old_price'] ;
    discount = jason['discount'] ;
    image = jason['image'] ;
    name = jason['name'] ;
    inFavorites = jason['in_favorites'] ;
    inCart = jason['in_cart'] ;
  }
}