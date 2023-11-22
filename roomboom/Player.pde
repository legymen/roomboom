class Player {
  float xpos, ypos;

  int HP;
  int maxHP;

  ArrayList<Object> inventory;

  Player() {

    xpos = width / 2;
    ypos = height / 2;

    inventory = new ArrayList<Object>();

    HP = 3;
    maxHP = 3;
  }

  void update() {
    move();
    leaveRoom();
    display();
  }

  void display() {
    fill(255, 0, 0);
    rect(xpos, ypos, 75, 75);
  }

  void move() {

    if (pressedKeys.get("w")) {
      ypos -=3;
    }
    if (pressedKeys.get("s")) {
      ypos +=3;
    }
    if (pressedKeys.get("a")) {
      xpos -=3;
    }
    if (pressedKeys.get("d")) {
      xpos +=3;
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

  void addToInventory(Object obj) {
    inventory.add(obj);
  }

  ArrayList<Object> getInventory() {
    return inventory;
  }

  void removeFromInventory(int index) {
    inventory.remove(index);
  }
}
