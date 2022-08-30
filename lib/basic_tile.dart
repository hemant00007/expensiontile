class BasicTile{
   String? title;
   List<BasicTile> tiles=[];
   
    BasicTile({
     required this.title,
     this.tiles=const[]
});
}
final basicTiles = <BasicTile> [
  BasicTile(title: "Fruits",tiles: [
    BasicTile(title: "apple"),
    BasicTile(title: "Banana"),
    BasicTile(title: "Mango"),
    BasicTile(title: "Watermelon")
  ]),
  BasicTile(title: "continent",
      tiles: [
    BasicTile(title: "India"),
    BasicTile(title: "Pakistan"),
    BasicTile(title: "Patna"),
    BasicTile(title: "Watermelon")
  ]),
  BasicTile(title: "city",tiles: [
    BasicTile(title: "patna"),
    BasicTile(title: "delhi"),
    BasicTile(title: "mumbai"),
    BasicTile(title: "pune"),
    BasicTile(title: "goa")
  ]),
  BasicTile(title: "Month",tiles: [
    BasicTile(title: "January"),
    BasicTile(title: "Febuary"),
    BasicTile(title: "March"),

  ]),
  BasicTile(title: "Days",tiles: [
    BasicTile(title: "Sunday"),
    BasicTile(title: "Monday"),
    BasicTile(title: "Tuesday"),
    BasicTile(title: "Wednesday"),
    BasicTile(title: "Friday")
  ]),
];