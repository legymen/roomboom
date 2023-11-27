class Room {

  String type;

  Item item;

  int[] thisRoom = new int[2];

  PImage floorPlan;

  Room(int[] _thisRoom) {

    thisRoom = _thisRoom;

    type = randomType();

    if (type == "item") {
      // item = randomItem();
      item = new Item("potion");
    } else {
      item = null;
    }

    floorPlan = loadImage("data/room1_800.png");

  }

  void update() {
    display();

    player.update();
  }

  void display() {
    image(floorPlan, 0, 0);
    fill(255, 255, 0);
    textSize(10);
    text("Type: " + type
      + "  Room: " + str(thisRoom[0]) + ", " + str(thisRoom[1]), 50, 50);
    if (item != null) {
      text("Item: " + item.type, 50, 70);
    }

    if (item != null) {
      item.display();
    }
  }

  String randomType() {
    int index = int(random(roomTypes.length));
    return roomTypes[index];
  }

  Object randomItem() {
    int index = int(random(itemTypes.length));
    Object it = new Item(itemTypes[index]);
    return it;
  }
}
