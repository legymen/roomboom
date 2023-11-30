class Player {
  int xpos, ypos;

  int HP;
  int maxHP;
  int maxHPcap;
  int maxInv;
  
  int gold;

  ArrayList<Item> inventory;

  PImage img;

  Player() {

    xpos = ROOM_WIDTH / 2;
    ypos = ROOM_WIDTH / 2;

    inventory = new ArrayList<Item>();

    img = loadImage("data/Zilda_top.png");
    
    maxInv = 20;
    HP = 3;
    maxHP = 5;
    maxHPcap = 10;
    maxInv = 12;

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
    float direction = calculateDirection();
    pushMatrix();
    translate(xpos, ypos);
    rotate(direction);
    image(img, 0, 0);
    popMatrix();
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

    if (xpos < 0 || xpos > ROOM_WIDTH || ypos < 0 || ypos > ROOM_WIDTH) {

      int newRoomCol = 0;
      int newRoomRow = 0;
      int newXpos = 0;
      int newYpos = 0;

      if (xpos < 0) {
        newRoomCol = currentRoom[0] - 1;
        newRoomRow = currentRoom[1];
        newXpos = ROOM_WIDTH;
        newYpos = ypos;
        xpos = 10;
      } else if (xpos > ROOM_WIDTH) {
        newRoomCol = currentRoom[0] + 1;
        newRoomRow = currentRoom[1];
        newXpos = 0;
        newYpos = ypos;
        xpos = ROOM_WIDTH - 10;
      } else if (ypos < 0) {
        newRoomCol = currentRoom[0];
        newRoomRow = currentRoom[1] + 1;
        newXpos = xpos;
        newYpos = ROOM_WIDTH;
        ypos = 10;
      } else if (ypos > ROOM_WIDTH) {
        newRoomCol = currentRoom[0];
        newRoomRow = currentRoom[1] - 1;
        newXpos = xpos;
        newYpos = 0;
        ypos = ROOM_WIDTH - 10;
      }

      if (newRoomCol >= 0 && newRoomRow >= 0 && newRoomCol < COLS && newRoomRow < ROWS){
        currentRoom[0] = newRoomCol;
        currentRoom[1] = newRoomRow;

        if (roomGrid[newRoomCol][newRoomRow] == null) {
          roomGrid[newRoomCol][newRoomRow] = new Room(currentRoom);
        }
        xpos = newXpos;
        ypos = newYpos;
      }      
    }
  }

  float calculateDirection(){
    if (pressedKeys.get('w') && pressedKeys.get('a')) {
      return 7*PI/4;
    } else if (pressedKeys.get('a') && pressedKeys.get('s')) {
      return 5*PI/4;
    } else if (pressedKeys.get('s') && pressedKeys.get('d')) {
      return 3*PI/4;
    } else if (pressedKeys.get('d') && pressedKeys.get('w')) {
      return PI/4;
    } else if (pressedKeys.get('w')) {
      return 0;
    } else if (pressedKeys.get('a')) {
      return 3*PI/2;
    } else if (pressedKeys.get('s')) {
      return PI;
    } else if (pressedKeys.get('d')) {
      return PI/2;
    } else {
      return 0;
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
