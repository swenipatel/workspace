//Create a class hierarchy with a Vehicle superclass and Car and Bike subclasses. Implement
// methods in each subclass that print specific details, like the type of vehicle, fuel type, andmax speed.

class Vehicle {
  String fuelType;
  int maxSpeed;

  Vehicle(this.fuelType, this.maxSpeed);
}

class Car extends Vehicle {
  Car(String fuelType, int maxSpeed) : super(fuelType, maxSpeed);

  void display() {
    print("Vehicle type: Car");
    print("Fuel type: $fuelType");
    print("Max speed: $maxSpeed km/h");
  }
}

class Bike extends Vehicle {
  Bike(String fuelType, int maxSpeed) : super(fuelType, maxSpeed);

  void display() {
    print("Vehicle type: Bike");
    print("Fuel type: $fuelType");
    print("Max speed: $maxSpeed km/h");
  }
}

void main() {
  Car c = Car("Diesel", 250);
  c.display();

  print("");

  Bike b = Bike("Petrol", 180);
  b.display();
}
