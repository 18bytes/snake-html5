#import('dart:html');

class snake {
  CanvasRenderingContext2D ctx;
  int x = 0;
  int y = 0;
  int gridSize = 10;
  String direction = "right";
  
  snake() {
  }

  void run() {
    CanvasElement canvas = document.query("#canvas");
    ctx = canvas.getContext("2d");
    ctx.fillStyle = "rgb(200,0,0)";
    // This sets some variables for demonstration purposes
    var x = 50;
    var y = 50;
    var width = 10;
    var height = 10;
     
    // This draws a square with the parameters from the variables set above
    ctx.fillRect(x, y, width, height);
    document.on.keyDown.add(handleEvent);
    window.setInterval(moveSnake, 100);
  }
  

  void handleEvent(event) {
    int keycode = 0;
    keycode = event.keyCode;
    switch (keycode) {
      // Left
      case 37:
        this.x = this.x - this.gridSize;
        this.direction = "left";
        break;
      // Up
      case 38:
        this.y = this.y - this.gridSize;
        this.direction = "up";
        break;
      // Right
      case 39: 
        this.x = this.x + this.gridSize;
        this.direction = "right";
        break;
      // Down
      case 40:
        this.y = this.y + this.gridSize;
        this.direction = "down";
        break;
    }
    this.drawSake();
  }

  void drawSake() {
    ctx.fillRect(this.x, this.y, this.gridSize, this.gridSize);  
  }
  
  void moveSnake() {
    switch (direction) {
      case 'left':
        this.x = this.x - this.gridSize;
        this.drawSake();
        break;
      case 'up':
        this.y = this.y - this.gridSize;
        break;
      case 'right':
        this.x = this.x + this.gridSize;
        break;
      case 'down':
        this.y = this.y + this.gridSize;
        break;
    }
    this.drawSake();
  }
  

  
}

void main() {
  new snake().run();
}
