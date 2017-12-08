import gab.opencv.*;
import processing.video.*;
import java.awt.*;
PImage tiara;
PImage pelo;
Capture video;
OpenCV opencv;
import processing.sound.*;
SoundFile file;

void setup() {
  size(640, 480);
   file = new SoundFile(this, "lu.mp3");
  file.play();
  tiara = loadImage("tl.png");
  pelo = loadImage("pl.png");
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  fill(0);
  noStroke();
  //strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    //DIBUJAR UN ELLIPSE EN EL CENTRO DE LA CARA
 
    image(tiara,faces[i].x+faces[i].width/-30, faces[i].y+faces[i].height*-0.2, faces[i].width*1, faces[i].height*0.9);
     image(pelo,faces[i].x+faces[i].width/-1.2, faces[i].y+faces[i].height*-0.6, faces[i].width*3, faces[i].height*2);
  }
}

void captureEvent(Capture c) {
  c.read();
}