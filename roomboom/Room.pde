class Room {

  String type;

  Object object;

  int[] thisRoom = new int[2];

  //PImage floorPlan;

  Room(int[] _thisRoom) {

    thisRoom = _thisRoom;

    type = randomType();

    if (type == "item") {
      // object = randomObject();
      object = new Object("potion");
    } else {
      object = null;
    }
  }

  void update() {
    display();

    player.update();
  }

  void display() {
    background(100);
    fill(255, 255, 0);
    textSize(10);
    text("Typ: " + type
      + "  Rum: " + str(thisRoom[0]) + ", " + str(thisRoom[1]), 50, 50);
    if (object != null) {
      text("Objekt: " + object.type, 50, 70);
    }

    if (object != null) {
      object.display();
    }
  }

  String randomType() {
    int index = int(random(roomTypes.length));
    return roomTypes[index];
  }

  Object randomObject() {
    int index = int(random(objectTypes.length));
    Object obj = new Object(objectTypes[index]);
    return obj;
  }
}
