class Player {

  float x;
  float y;
  float a;
  
  float size = 10;
  float FOV = PI; // Given in radians (DOESN'T REALLY WORK)
  
  int rayAmount = 10;
  Ray[] rays = new Ray[rayAmount];
  
  Player(float x, float y, float a) {
    this.x = x;
    this.y = y;
    this.a = a;
    
    for (int i = 0; i < rays.length; i++) {
      Vector vector = rotateVectorByAngle(new Vector(1, 0), map(i, 0, rays.length, (FOV/(2*PI))*-1, (FOV/(2*PI))));
      vector = normalizeVector(vector);
      rays[i] = new Ray(vector, 100);  
    }
  }
  
  void Move(float x, float y) {
    this.x += x;
    this.y += y;
  }
  
  void Render() {
    circle(this.x, this.y, this.size);
  }
  
  void Raycast() {
    for (int i = 0; i < this.rays.length; i++) {
      
      float shortest = 9999999; 
      float shortX = this.x;
      float shortY = this.y;
      
      for (int j = 0; j < walls.length; j++) {
        
        float x1 = walls[j].x1;
        float y1 = walls[j].y1;
        float x2 = walls[j].x2;
        float y2 = walls[j].y2;
        
        float x3 = this.x;
        float y3 = this.y;
        float x4 = this.x + this.rays[i].vector.x;
        float y4 = this.y + this.rays[i].vector.y;
        
        float t = ((x1 - x3)*(y3 - y4) - (y1 - y3)*(x3 - x4)) / ((x1 - x2)*(y3 - y4) - (y1 - y2)*(x3 - x4));
        float u = -((x1 - x2)*(y1 - y3) - (y1 - y2)*(x1 - x3)) / ((x1 - x2)*(y3 - y4) - (y1 - y2)*(x3 - x4));
        
        float x = x1 + t * (x2 - x1);
        float y = y1 + t * (y2 - y1);
       
        if (t > 0 && t < 1 && u > 0) {
          float distance = sqrt(pow(x - this.x, 2) + pow(y - this.y, 2));
          if (distance < shortest) {
            shortest = distance;
            shortX = x;
            shortY = y;
          }
        }
        
        if (j == walls.length - 1) {
          line(this.x, this.y, shortX, shortY);
        }
      }
    }
  }
}

class Ray {
  
  Vector vector;
  float l; // length
  
  Ray(Vector vector, float l) {
    this.vector = vector;  
    this.l = l;
  }
  
}

class Vector {
  
  float x;
  float y;
  
  Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
}

// 0 - 360 degrees
Vector rotateVectorByAngle(Vector v, float a) {
  //return new Vector(cos(a) * v.x - sin(a) * v.y, sin(a) * v.x + cos(a) * v.y);
  return new Vector(cos(a), sin(a));
}

Vector normalizeVector(Vector v) {
  float v_length = sqrt(pow(v.x, 2) + pow(v.y, 2));
  return new Vector(v.x / v_length, v.y / v_length);  
}
