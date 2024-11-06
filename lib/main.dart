import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? _darkTheme : _lightTheme,
      home: Scaffold(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        appBar: AppBar(
          title: Text("Tema Değiştirme"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mevcut Tema: ${isDarkTheme ? "Karanlık" : "Açık"}",
                style: isDarkTheme
                    ? _darkTheme.textTheme.bodyMedium
                    : _lightTheme.textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    isDarkTheme ? Colors.blueGrey : Colors.blue,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    isDarkTheme ? Colors.white : Colors.black,
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  shape: MaterialStateProperty.all(
                    isDarkTheme
                        ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero // Dikdörtgen
                    )
                        : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Yuvarlatılmış
                    ),
                  ),
                ),
                child: Text("Temayı Değiştir"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Açık tema ayarları
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black, fontSize: 20), // Aydınlık tema yazı rengi
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Yuvarlatılmış buton
        ),
      ),
    ),
  );

  // Karanlık tema ayarları
  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white, fontSize: 20), // Karanlık tema yazı rengi
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Dikdörtgen buton
        ),
      ),
    ),
  );
}
