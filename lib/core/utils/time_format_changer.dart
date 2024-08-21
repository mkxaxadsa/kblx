String timeFormatChanger(String time) {
  if(time == "Daily") return "day";
  return time.replaceAll("ly", "").toLowerCase();
}