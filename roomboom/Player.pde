class Player {
  float xpos, ypos;

  int HP;
  int maxHP;
  int maxHPcap;
  int maxInv;
  
  int gold;

  ArrayList<Item> inventory;

  PImage img;

  Player() {

    xpos = width / 2;
    ypos = height / 2;

    inventory = new ArrayList<Item>();

    img = loadImage("data/Zilda_top.png");
    
    maxInv = 20;
    HP = 3;
    maxHP = 5;
    maxHPcap = 10;

    gold = 0;

  }

  void update() {
    move();
    findItem();
    leaveRoom();
    display();
  }

  void display() {
    imageMode(CENTER);
    image(img, xpos, ypos);
  }

  void move() {

    if (pressedKeys.get('w')) {
      ypos -=3;
    }
    if (pressedKeys.get('s')) {
      ypos +=3;
    }
    if (pressedKeys.get('a')) {
      xpos -=3;
    }
    if (pressedKeys.get('d')) {
      xpos +=3;
    }
  }

  void findItem(){
    if (roomGrid[currentRoom[0]][currentRoom[1]].item != null){
      Item it = roomGrid[currentRoom[0]][currentRoom[1]].item;
      if (dist(xpos, ypos, it.xpos, it.ypos) < 20 && inventory.size() < maxInv){
        addToInventory(it);
        roomGrid[currentRoom[0]][currentRoom[1]].item = null;
        background(0);
      }
    }
  }

  void leaveRoom() {

    if (xpos < 0 || xpos > width || ypos < 0 || ypos > height) {
      int newRoomCol = currentRoom[0];
      int newRoomRow = currentRoom[1];

      if (xpos < 0) {
        newRoomCol = currentRoom[0] - 1;
        newRoomRow = currentRoom[1];
      } else if (xpos > height) {
        newRoomCol = currentRoom[0] + 1;
        newRoomRow = currentRoom[1];
      } else if (ypos < 0) {
        newRoomCol = currentRoom[0];
        newRoomRow = currentRoom[1] + 1;
      } else if (ypos > height) {
        newRoomCol = currentRoom[0];
        newRoomRow = currentRoom[1] - 1;
      }

      currentRoom[0] = newRoomCol;
      currentRoom[1] = newRoomRow;

      if (roomGrid[newRoomCol][newRoomRow] == null) {
        roomGrid[newRoomCol][newRoomRow] = new Room(currentRoom);
      }

      xpos = width / 2;
      ypos = height / 2;
    }
  }

  void addToInventory(Item it) {
    inventory.add(it);
  }

  ArrayList<Item> getInventory() {
    return inventory;
  }

  void removeFromInventory(int index) {
    inventory.remove(index);
  }
}
