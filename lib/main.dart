import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page UI',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.light,
        cardColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
          titleMedium: TextStyle(color: Colors.grey[600]),
        ),
        iconTheme: IconThemeData(color: Colors.grey[600]),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    // Simula la actualización de la hora cada minuto
    Timer.periodic(Duration(minutes: 1), (Timer t) {
      _updateTime();
    });
    _updateTime(); // Inicializa la hora al cargar la página
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _currentTime = '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Row(
          children: [
            Text(
              _currentTime,
              style: TextStyle(color: Colors.black87),
            ),
            Spacer(), // Empuja el título (hora) a la izquierda
            Text(
              'Home page',
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
        actions: [
          Spacer(), // Empuja los iconos a la derecha

          // Icono de señal (se parece a la imagen)
          Icon(Icons.signal_cellular_alt, color: Colors.black87),
          SizedBox(width: 15.0),

          // Icono de Wi-Fi
          Icon(Icons.wifi, color: Colors.black87),
          SizedBox(width: 15.0),

          // Icono de batería (se parece al de la imagen)
          Icon(Icons.battery_charging_full, color: Colors.black87),
          SizedBox(width: 20.0),

          // Icono de más (tres puntitos)
          Icon(Icons.more_horiz, color: Colors.black87),
          SizedBox(width: 15.0),

          // Icono de más (el signo de agregar)
          Icon(Icons.add, color: Colors.black87),
          SizedBox(width: 10.0),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarjeta
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 15.0,
                      ),
                      SizedBox(width: 10.0),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 15.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '1000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'US',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'MasterCard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '1234 **** **** 4321',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Últimas transacciones
            Text(
              'Last Transactions',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            _transactionItem(
                Icons.arrow_upward, 'Shopping', '-1000us', Colors.redAccent),
            SizedBox(height: 10.0),
            _transactionItem(
                Icons.arrow_downward, 'Salary', '+1000us', Colors.greenAccent),
            SizedBox(height: 10.0),
            _transactionItem(
                Icons.arrow_downward, 'Receive', '+200us', Colors.greenAccent),
          ],
        ),
      ),
    );
  }

  Widget _transactionItem(
      IconData icon, String title, String amount, Color color) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 15.0),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: amount.startsWith('-')
                    ? Colors.redAccent
                    : Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
