void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
    inString = trim(inString);
    inByte = float(inString);
    println(inByte);
    inByte = map(inByte, 0, 1023, height, 0);
  }
}