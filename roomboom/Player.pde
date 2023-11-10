class Player {
  float xpos, ypos;

  Player() {
    xpos = width/2;
    ypos = height/2;
  }

  void update() {
    move();
    leaveRoom();
    display();
  }

  void display() {
    fill(255, 0, 0);
    rect(xpos, ypos, 5, 5);
  }

  void move() {
    if (keyPressed) {
      if (key == 'w') {
        ypos--;
      } else if (key == 's') {
        ypos++;
      } else if (key == 'a') {
        xpos--;
      } else if (key == 'd') {
        xpos++;
      }
    }
  }

  void leaveRoom() {

    if (xpos < 0 || xpos > width || ypos < 0 || ypos > height) {
      int newRoomCol = currentRoom[0];
      int newRoomRow = currentRoom[1];

      if (xpos < 0) {
        newRoomCol = currentRoom[0]-1;
        newRoomRow = currentRoom[1];
      } else if (xpos > height) {
        newRoomCol = currentRoom[0]+1;
        newRoomRow = currentRoom[1];
      } else if (ypos < 0) {
        newRoomCol = currentRoom[0];
        newRoomRow = currentRoom[1]+1;
      } else if (ypos > height) {
        newRoomCol = currentRoom[0];
        newRoomRow = currentRoom[1]-1;
      }
      
      currentRoom[0] = newRoomCol;
      currentRoom[1] = newRoomRow;
      
      if (roomGrid[newRoomCol][newRoomRow] == null) {
        roomGrid[newRoomCol][newRoomRow] = new Room(currentRoom);
      }

      xpos = width/2;
      ypos = height/2;
    }
  }
}
