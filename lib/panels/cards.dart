class CardModel {
  String countryname;
  String deaths;
  int cardBackground;


  CardModel(this.countryname, this.deaths,this.cardBackground);
}

List<CardModel> cards = cardData.map(
      (item) => CardModel(
        item['countryname'],
        item['deaths'],
        item['cardBackground'],
  ),
).toList();

var cardData = [
  {
    "countryname": "Amanda Alex",
    "deaths": "**** **** **** 1425",
    "cardBackground": 0xFFFF70A3,

  },
  {
    "countryname": "Amanda Alex",
    "deaths": "**** **** **** 8287",
    "cardBackground": 0xFFFF70A3,
  },
  {
    "countryname": "Amanda Alex",
    "deaths": "**** **** **** 1425",
    "cardBackground": 0xFFFF70A3,
  },
  {
    "countryname": "Amanda Alex",
    "deaths": "**** **** **** 1425",
    "cardBackground": 0xFFFF70A3,
  },
  {
    "countryname": "Amanda Alex",
    "deaths": "**** **** **** 1425",
    "cardBackground": 0xFFFF70A3,
  }
];