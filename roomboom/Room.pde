class Room {
  
  int type;
  
  int[] thisRoom = new int[2];
  
  // PImage floorPlan;

  Room(int[] _thisRoom) {
    
    thisRoom = _thisRoom;
    
    type = int(random(1, 5));
    
  }
  
  void update(){
    display();
  }
  
  void display(){
    background(100);
    fill(255, 255, 0);
    textSize(10);
    text("Typ: " + str(type) + "  Rum: " + str(thisRoom[0]) + ", " + str(thisRoom[1]), 50, 50);
  }
}
