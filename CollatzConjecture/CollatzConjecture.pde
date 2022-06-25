import processing.pdf.*;

void setup() {
  
  size(1200,600); //creating canvas
  beginRecord(PDF, "Collatz.pdf"); //Converting processing file to pdf
  background(0);
  //int steps=0;
  
  for(int i=1; i<10000; i++){
  //int i=50;
  IntList sequence = new IntList();
  int n=i;
  do{
   sequence.append(n);
    n=collatz(n); //collatz function
  } while(n!=1);
  sequence.append(1);
  sequence.reverse();
  
  float len=10;
  float angle = 1;
  
  resetMatrix();
  translate(width/2,height/2);
  
  for(int j=0; j<sequence.size();j++){
    int value = sequence.get(j);
      //rotating the orientation of the window by some angle. 
      //The board will be rotated.
    if (value%2 == 0){
      rotate(-angle);
    } else {
      rotate(angle);
    }
    //Add lines
    strokeWeight(1);
    stroke(255,50);
    line(0,0,len,0);
    translate(len, 0);
    }
  //Visualize the list
  }
  endRecord();
}

void draw() {  
}

int collatz (int n) {
  if (n%2 == 0){
    return n/2;
  } else {
    return (n*3+1)/2; 
  }
  
}
