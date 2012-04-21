#import('dart:html');

class dart {
  CanvasRenderingContext2D ctx;
  int x = 0;
  int y = 0;
  int gridSize = 10;
  
  dart() {
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
  }

  void handleEvent(event) {
    int keycode = 0;
    keycode = event.keyCode;
    switch (keycode) {
      // Left
      case 37:
        print ("Test Left");
        break;
      // Up
      case 38:
        print ("Test Up");
        break;
      // Right
      case 39: 
        print ("Test Right");
        break;
      // Down
      case 40: 
        print ("Test Down");
        break;
    }
  }
  
  

  
}

void main() {
  new dart().run();
}
