void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    inData = float(inString);
    println(inData);
    heart = map(inData, 0, 1023, 0, 200);
    inData = map(inData, 0, 1023, height, 0);
  }
}