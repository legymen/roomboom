class Item {
  String description;
  String type;
  float xpos, ypos;
  PImage img;

  Item(String _type) {
    type = _type;
    img = loadImage("data/health_potion.png");
    xpos = int(random(50,width-50));
    ypos = int(random(50, height-50));
  }

  void display() {
    image(img, xpos, ypos);
  }
}
