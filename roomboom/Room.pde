class Room {

  String type;

  Item item;
  Dragon dragon;
  Enemy enemy;

  int[] thisRoom = new int[2];

  PImage floorPlan;

  Room(int[] _thisRoom) {

    thisRoom = _thisRoom;

    type = randomType();

    if (type == "item") {
      item = randomItem();
    } else {
      item = null;
    }

    if (type = "dragon"){
      dragon = new Dragon();
    } else {
      dragon = null;
    }

     if (type = "enemy"){
      enemy = new Enemy();
    } else {
      enemy = null;
    }

    floorPlan = loadImage("data/room1_800.png");

  }

  void update() {
    display();

    if (type = "dragon"){
      dragon.update();
      
    } else if (type = "enemy"){
      enemy.update();
    }


    player.update();
  }

  void display() {
    // image(floorPlan, 0, 0);
    background(200);
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

  Item randomItem() {
    int index = int(random(itemTypes.length));
    Item it = new Item(itemTypes[index]);
    return it;
  }
}
