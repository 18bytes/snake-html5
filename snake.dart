#import('dart:html');

class Snake {
  var snakeBody = null;
  int x = 0;
  int y = 0;
  int gridSize = 20;
  String direction = "right";
  var snakeBody = null;
  int snakeLength = 3;
  int maxWidth = 0;
  int maxHeight = 0;

  Snake(int mxWidth, int mxHeight) {
    this.snakeBody = [];
    this.maxWidth = mxWidth;
    this.maxHeight = mxHeight;
  }
  
  /**
   * Method to draw a snake. 
   */
  void drawSnake() {
    var coord = [this.x, this.y];
    // Precondition check.
    if (this.snakeBody == null) return;
    
    this.snakeBody.add(coord);
    this.ctx.fillStyle = "rgb(200,0,0)";
    this.ctx.fillRect(this.x, this.y, this.gridSize, this.gridSize); 
    if (this.snakeBody.length > this.snakeLength) {
      var itemToRemove = this.snakeBody[0];
      this.snakeBody.removeRange(0, 1);
      this.ctx.clearRect(itemToRemove[0], itemToRemove[1], this.gridSize, this.gridSize);
    }
    if (this.x == this.xrand && this.y == this.yrand) {
      this.makeFood();
      this.snakeLength = this.snakeLength + 1;
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
    this.drawSnake();
  }
  
  /**
   * Method to decide which direction inwhich snake has to move when it hits the border.
   */
  whichWay(axisType) {
    if (axisType == 'x') {
      return (this.x > this.canvas.width / 2) ? this.moveLeft() : this.moveRight();
    } else if (axisType == 'y') {
      return (this.x > this.canvas.height / 2) ? this.moveUp() : this.moveDown();
    }
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
}

class Game {
  CanvasRenderingContext2D ctx = null;
  CanvasElement canvas = null;
  var xrand = 0.0, yrand = 0.0;
  int randCount = 1;
  Snake snake = null;
  
  Game() {
    this.snake = new Snake();
  }

  void run() {
    var xRect = 50;
    var yRect = 50;
    var width = 10;
    var height = 10;
    
    this.canvas = document.query("#canvas");
    this.ctx = canvas.getContext("2d");
    this.ctx.fillStyle = "rgb(200,0,0)";
   
     
    document.on.keyDown.add(handleEvent);
    window.setInterval(moveSnake, 100);
    
    // Make food and start the snake
    this.makeFood();
    this.snake.drawSnake();
  }
  
  void handleEvent(event) {
    int keycode = 0;
    keycode = event.keyCode;
    switch (keycode) {
      // Left
      case 37:
        this.snake.moveLeft();
        break;
      // Up
      case 38:
        this.snake.moveUp();
        break;
      // Right
      case 39: 
        this.snake.moveRight();
        break;
      // Down
      case 40:
        this.snake.moveDown();
        break;
    }
  }

  
  /**
   *  Method creates the food for snake at random location on the canvas.
   */
  void makeFood() {
    double rem = 0.0;
    
    // Get the random location for food and trim it
    this.xrand = (this.getRandom() * (this.canvas.width)).floor();
    this.yrand = (this.getRandom() * (this.canvas.height)).floor();
    rem = this.xrand % this.gridSize;
    this.xrand = this.xrand - rem;
    rem = this.yrand % this.gridSize;
    this.yrand = this.yrand - rem;
    // Draw it!
    this.ctx.fillStyle = "rgb(10,100,0)";
    this.ctx.fillRect(xrand, yrand, this.gridSize, this.gridSize);
  }
  
  /**
   * Workaround to generate random number for a bug in Math.random() method in DART.
   */
  double getRandom() {
    double rand = 0.0;
    for (int i = 0; i < this.randCount; i++) {
      rand = Math.random();
    }
    this.randCount = this.randCount + 1;
    return rand;
  }
  
}

void main() {
  new Game().run();
}
