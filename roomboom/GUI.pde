class GUI {
  float heartSize = 40;
  float slotSize = 40;
  
  GUI()  {
    
    
    
  }
  
  
  void update() {
    display();
  }
  
  void display(){
    rectMode(CORNER);
    fill(30);
    rect(5, 5, 400, 790, 5);
    for (int i = 1; i < player.maxHP+1; i++) {
      fill(255, 0, 0);
      if (i > player.HP)
        fill(100);
      rect((heartSize*i)+(i*5)-20, 25, heartSize, heartSize);
      
    }
    for (Item it : player.inventory) {
      int i = player.inventory.indexOf(it)+1;
      if (i <= 8)
        image(it.img, (slotSize*i)+(i*5)-10, 125);
      else if (i > 8 && i <= 16)
        image(it.img, (slotSize*(i-8))+((i-8)*10)-20, 175);
    }
    fill(255, 0, 0);
    rect(25, 80, 100, 25);
    fill(230, 210, 0);
    textSize(20);
    text("Gold: " + str(player.gold), 30, 100);
    
  }
}
