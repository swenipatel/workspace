//Implement a mock weather fetching program. Display different messages as it waits for a
//response and then shows a message like “Weather data loaded successfully.”

Future<String> weather() async{
  print("searching data of weather....");

  await Future.delayed(Duration(seconds: 3));

  return"weather data is here";
}
void main()
async{
  print("started..");
  var result=await weather();

  print(result);
  print("over!!");
}