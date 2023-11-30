class GUI {
  
  float heartSize = 40;
  float slotSize = 50;
  
  GUI()  {
    
    
    
  }
  
  
  void update() {
    display();
  }
  
  void display(){
    //Background
    rectMode(CORNER);
    fill(30);
    rect(5, 5, 400, 790, 5);
    
    //Displays Health
    for (int i = 1; i < player.maxHP+1; i++) {
      fill(255, 0, 0);
      if (i > player.HP)
        fill(100);
      rect((heartSize*i)+(i*5)-20, 25, heartSize, heartSize);
    }
    //Gold GUI
    fill(255, 0, 0);
    rect(25, 80, 100, 25);
    fill(230, 210, 0);
    textSize(20);
    text("Gold: " + str(player.gold), 30, 100);
    
    //Inventory GUI Slots
    fill(100);
    for (int i = 0; i < player.maxInv; i++) {
      int rows = (i/6);
      rect((slotSize*(i-6*rows))+((i-6*rows)*5)+25, 175+(60*rows), slotSize, slotSize);
    
    }
    //Puts the image of the item into the inventory
    for (Item it : player.inventory) {
      int i = player.inventory.indexOf(it)+1;
      int rows = ((i-1)/6);
      image(it.img, (slotSize*(i-6*rows))+((i-6*rows)*5)-1.25, 202+(60*rows));
    }
    
    
  }
}
