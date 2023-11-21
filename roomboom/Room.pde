class Room {
    
    String[] types = { "empty", "trap", "monster", "item" };
    String type;
    
    int[] thisRoom = new int[2];
    
    //PImage floorPlan;
    
    Room(int[] _thisRoom) {
        
        thisRoom = _thisRoom;
        
        type = randomType();
        
    }
    
    void update() {
        display();
            
       // Update the player
        player.update();
    }
    
    void display() {
        background(100);
        fill(255, 255, 0);
        textSize(10);
        text("Typ: " + type + "  Rum: " + str(thisRoom[0]) + ", " + str(thisRoom[1]), 50, 50);
    }
    
    String randomType() {
        int index = int(random(types.length));
        return types[index];
    }
}
