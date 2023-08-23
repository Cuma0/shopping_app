class ProductModel {
  String id;
  String name;
  String description;
  String image;
  int price;
  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price});
}

List<ProductModel> productList = [
  ProductModel(
    id: "1",
    name: "Macbook Air M1",
    description:
        "The new M1 chip makes the 13-inch MacBook Pro more capable than...",
    image: "assets/images/airm2.jpg",
    price: 1250,
  ),
  ProductModel(
    id: "2",
    name: "Macbook Pro M2",
    description:
        "The new M2 chip makes the 13-inch MacBook Pro more capable than...",
    image: "assets/images/prom2.jpg",
    price: 1500,
  ),
  ProductModel(
    id: "3",
    name: "Macbook Air M1",
    description:
        "The new M1 chip makes the 13-inch MacBook Pro more capable than...",
    image: "assets/images/airm2.jpg",
    price: 1250,
  ),
  ProductModel(
    id: "4",
    name: "Macbook Pro M2",
    description:
        "The new M2 chip makes the 13-inch MacBook Pro more capable than...",
    image: "assets/images/prom2.jpg",
    price: 1500,
  ),
  ProductModel(
    id: "5",
    name: "Watch Series Ultra",
    description:
        "The new M1 chip makes the 13-inch MacBook Pro more capable than...",
    image: "assets/images/watch.jpg",
    price: 140,
  ),
  ProductModel(
    id: "6",
    name: "Huawei Freebuds",
    description:
        "The new M1 chip makes the 13-inch MacBook Pro more capable than...",
    image: "assets/images/earphone.jpg",
    price: 70,
  ),
  ProductModel(
    id: "7",
    name: "AirPods Max",
    description:
        "The new M1 chip makes the 13-inch MacBook Pro more capable than...",
    image: "assets/images/headset.jpg",
    price: 550,
  ),
  ProductModel(
    id: "8",
    name: "Jbl Flip 6",
    description:
        "The new M1 chip makes the 13-inch MacBook Pro more capable than...",
    image: "assets/images/speaker.jpg",
    price: 100,
  ),
];
