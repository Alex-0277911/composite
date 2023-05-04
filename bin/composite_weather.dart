// приклад реалізації шаблону Composite у Dart для погодної системи:

// У цій реалізації WeatherComponent є абстрактним класом, який представляє
// компоненти погодної системи. Він має методи для додавання та видалення
// компонентів, а також метод display() для показу прогнозу погоди.

abstract class WeatherComponent {
  void add(WeatherComponent component);
  void remove(WeatherComponent component);
  void display();
}

// WeatherStation - це складений об'єкт, який може містити інші погодні
// компоненти. Він має методи для додавання і видалення компонентів, а також
// перевизначає метод display() для показу назви метеостанції і відображення
// всіх компонентів, які вона містить.

// реалізація класу WeatherStation (станція яка може містити декілька
// компонентів) як WeatherComponent

class WeatherStation implements WeatherComponent {
  final String _name;
  late List<WeatherComponent> _weatherComponents;

  WeatherStation(this._name) {
    _weatherComponents = <WeatherComponent>[];
  }

  @override
  void add(WeatherComponent component) {
    _weatherComponents.add(component);
  }

  @override
  void remove(WeatherComponent component) {
    _weatherComponents.remove(component);
  }

  @override
  void display() {
    print("Weather Station: $_name");
    for (WeatherComponent component in _weatherComponents) {
      component.display();
    }
  }
}

// Класи Temperature, Humidity і Wind є об'єктами-листами, які реалізують
// інтерфейс WeatherComponent. Вони представляють окремі погодні компоненти,
// які можна додати до метеостанції.

class Temperature implements WeatherComponent {
  final double _temperature;

  Temperature(this._temperature);

  @override
  void add(WeatherComponent component) {
    throw UnimplementedError();
  }

  @override
  void remove(WeatherComponent component) {
    throw UnimplementedError();
  }

  @override
  void display() {
    print("Temperature: $_temperature");
  }
}

class Humidity implements WeatherComponent {
  final double _humidity;

  Humidity(this._humidity);

  @override
  void add(WeatherComponent component) {
    throw UnimplementedError();
  }

  @override
  void remove(WeatherComponent component) {
    throw UnimplementedError();
  }

  @override
  void display() {
    print("Humidity: $_humidity");
  }
}

class Wind implements WeatherComponent {
  final double _windSpeed;

  Wind(this._windSpeed);

  @override
  void add(WeatherComponent component) {
    throw UnimplementedError();
  }

  @override
  void remove(WeatherComponent component) {
    throw UnimplementedError();
  }

  @override
  void display() {
    print("Wind speed: $_windSpeed");
  }
}

// Щоб скористатися цією реалізацією, ви можете створити об'єкт WeatherStation
// і додати до нього різні метеорологічні компоненти, як показано нижче:

void main() {
  var weatherStation = WeatherStation("My Weather Station");
  weatherStation.add(Temperature(25.0));
  weatherStation.add(Humidity(0.6));
  weatherStation.add(Wind(20.0));

  weatherStation.add(Temperature(55.0));
  weatherStation.add(Humidity(0.8));
  weatherStation.add(Wind(40.0));

  weatherStation.add(Temperature(-25.0));
  weatherStation.add(Humidity(0.4));
  weatherStation.add(Wind(3.0));

  weatherStation.display();
}

// У результаті буде створено об'єкт метеостанції з назвою "Моя метеостанція" і
// додано до нього температуру 25.0 градусів за Цельсієм, вологість 60% та
// швидкість вітру 20 км/год. Нарешті, буде відображено прогноз погоди шляхом
// виклику методу display() в об'єкті WeatherStation, який рекурсивно
// викличе метод display() у всіх компонентах, що містяться у цьому об'єкті.
