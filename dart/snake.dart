#import('dart:html');

class snake {
  
  CanvasRenderingContext2D ctx;
  CanvasElement canvas = null;
  int x = 0;
  int y = 0;
  int gridSize = 10;
  String direction = "right";
  
  snake() {
  }

  void run() {
    canvas = document.query("#canvas");
    ctx = canvas.getContext("2d");
    ctx.fillStyle = "rgb(200,0,0)";
    var xRect = 50;
    var yRect = 50;
    var width = 10;
    var height = 10;
     
    // This draws a square with the parameters from the variables set above
    ctx.fillRect(xRect, yRect, width, height);
    document.on.keyDown.add(handleEvent);
    window.setInterval(moveSnake, 100);
  }
  
  void handleEvent(event) {
    int keycode = 0;
    keycode = event.keyCode;
    switch (keycode) {
      // Left
      case 37:
        this.moveLeft();
        break;
      // Up
      case 38:
        this.moveUp();
        break;
      // Right
      case 39: 
        this.moveRight();
        break;
      // Down
      case 40:
        this.moveDown();
        break;
    }
  }

  void drawSake() {
    ctx.fillRect(this.x, this.y, this.gridSize, this.gridSize);  
  }
  
  void moveSnake() {
    switch (direction) {
      case 'left':
        this.moveLeft();
        break;
      case 'up':
        this.moveUp();
        break;
      case 'right':
        this.moveRight();
        break;
      case 'down':
        this.moveDown();
        break;
    }
    
  }
  
  int leftPosition() {
    return this.x - this.gridSize;
  }
  
  int rightPosition() {
    return this.x + this.gridSize;
  }
  
  int upPosition() {
    return this.y - this.gridSize;
  }
  
  int downPosition() {
    return this.y + this.gridSize;
  }
  
  void moveUp() {
    if (this.upPosition() >= 0) {
      this.executeMove('up', 'y', this.upPosition());
    } else {
      this.whichWay('x');
    }
  }
  
  void moveDown() {
    if (this.downPosition() < this.canvas.height) {
      this.executeMove('down', 'y', this.downPosition());
    } else {
      this.whichWay('x');
    }
  }
  
  void moveLeft() {
    if (this.leftPosition() >= 0) {
      this.executeMove('left', 'x', this.leftPosition());
    } else {
      this.whichWay('y');
    }
  }
  
  void moveRight() {
    if (this.rightPosition() < this.canvas.width) {
      this.executeMove('right', 'x', this.rightPosition());
    } else {
      this.whichWay('y');
    }
  }
  
  void executeMove(dirValue, axisType, axisValue) {
    this.direction = dirValue;
    if (axisType == "x") {
      this.x = axisValue;
    } else if (axisType == "y") {
      this.y = axisValue;
    }
    this.drawSake();
  }
  
  whichWay(axisType) {
    if (axisType == 'x') {
      return (this.x > this.canvas.width / 2) ? this.moveLeft() : this.moveRight();
    } else if (axisType == 'y') {
      return (this.x > this.canvas.height / 2) ? this.moveUp() : this.moveDown();
    }
  }
  
  
}

void main() {
  new snake().run();
}
