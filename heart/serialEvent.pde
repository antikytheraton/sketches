void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    heart = float(inString);
    println(heart);
    heart = map(heart, 0, 1023, 0, 200);
  }
}