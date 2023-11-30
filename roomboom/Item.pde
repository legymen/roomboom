class Item {
  // String description;
  String type;
  float xpos, ypos;
  PImage img;

  Item(String _type) {
    type = _type;

    if (type == "potion"){
      img = loadImage(POTION_IMAGE);
    } else if (type == "key"){
      img = loadImage(KEY_IMAGE) ;
    }
    xpos = int(random(50,ROOM_WIDTH-50));
    ypos = int(random(50, ROOM_WIDTH-50));
  }

  void display() {
    image(img, xpos, ypos);
  }
}
