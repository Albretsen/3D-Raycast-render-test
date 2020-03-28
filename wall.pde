class Wall {

  float x1;
  float y1;
  float x2;
  float y2;
  
  float middleX;
  float middleY;
  float distance;
  
  Wall(float x1, float y1, float x2, float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    
    float newX = (x2 - x1)/2;
    float newY = (y2 - y1)/2;
    
    distance = sqrt(pow(newX, 2)+pow(newY, 2));
    
    middleX = x1 + newX;
    middleY = y1 + newY;
  }
  
  void Render() {
    line(x1, y1, x2, y2);
    
    // circle(middleX, middleY, 20);
  }
  
  
}
