import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 254, 249, 217),
          appBar: AppBar(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            backgroundColor:const Color.fromARGB(255, 142, 172, 205),
            foregroundColor: Colors.black,
          ),
          body: const MyStatefulWidget()),
    );
  }
}

//CLASS DATA KELOMPOK
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'ANGGOTA KELOMPOK',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('asset/image/difta.jpg'),
                  radius: 30,
                ),
                title: Text('Difta Wachidatur Rosyidah'),
              ),
            ),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('asset/image/sofi.jpeg'),
                  radius: 30,
                ),
                title: Text('Rosa Sofi Andriani'),
              ),
            ),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('asset/image/binar.jpeg'),
                  radius: 30,
                ),
                title: Text('Rafly Binar Tiktono'),
              ),
            ),

            const SizedBox(height: 300),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Login(),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                        child) {
                      const begin = 0.0;
                      const end = 1.0;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return FadeTransition(
                        opacity: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color.fromARGB(255, 142, 172, 205),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Next'),
            ),
          ],
        ));
  }
}


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 249, 217),
        appBar: AppBar(
          leading: const Icon(Icons.login),
          title: const Text("Login Page"),
          backgroundColor: const Color.fromARGB(255, 142, 172, 205),
          foregroundColor: Colors.black,
        ),
        body: Center( 
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: <Widget>[
                const SizedBox(height: 20),

                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: const Text('Selamat datang!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),

                const SizedBox(height: 20),

                const CircleAvatar(
                  backgroundImage: AssetImage('asset/image/mrb.jpg'),
                  radius: 100, 
                ),

                const SizedBox(height: 30),

           
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                              width: 3, color: Color.fromARGB(255, 142, 172, 205))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      icon: const Icon(Icons.person),
                      labelText: 'Username',
                      hintText: 'Silahkan masukkan username',
                      floatingLabelStyle: const TextStyle(
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                ),

         
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                              width: 3, color: Color.fromARGB(255, 142, 172, 205))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      icon: const Icon(Icons.password),
                      labelText: 'Password',
                      hintText: 'Masukkan Password anda',
                      floatingLabelStyle: const TextStyle(
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

    
                ElevatedButton(
                  onPressed: () {
                    String msg = "";
                    bool isLogin = false;
                    if (nameController.text == 'user' &&
                        passwordController.text == 'pass') {
                      setState(() {
                        msg = "Login Berhasil";
                        isLogin = true;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Kalkulator()),
                      );
                    } else {
                      setState(() {
                        msg = "Login gagal";
                        isLogin = false;
                      });
                    }
                    var snackBar = SnackBar(
                      content: Text(msg),
                      backgroundColor:
                          (isLogin) ? Colors.green[700] : Colors.red[800],
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 142, 172, 205),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  ),
                  child: const Text('Login'),
                ),

                const SizedBox(height: 20),

         
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 142, 172, 205),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  ),
                  child: const Text('Home'),
                ),
              ],
            ),
          ),
        ));
  }
}


class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  _Kalkulator createState() => _Kalkulator();
}

class _Kalkulator extends State<Kalkulator> {
  TextEditingController angka1 = TextEditingController();
  TextEditingController angka2 = TextEditingController();
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 249, 217),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('PENJUMLAHAN & PENGURANGAN'),
        backgroundColor: const Color.fromARGB(255, 142, 172, 205),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: angka1,
              decoration: const InputDecoration(
                labelText: 'Masukkan Angka Pertama',
                icon: Icon(Icons.looks_one),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: angka2,
              decoration: const InputDecoration(
                labelText: 'Masukkan Angka Kedua',
                icon: Icon(Icons.looks_two),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                int sum = int.parse(angka1.text) + int.parse(angka2.text);
                resultText = 'Hasil Penjumlahan: $sum';
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 142, 172, 205),
            ),
            child: const Text('Hitung Penjumlahan'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                int difference = int.parse(angka1.text) - int.parse(angka2.text);
                resultText = 'Hasil Pengurangan: $difference';
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 142, 172, 205),
            ),
            child: const Text('Hitung Pengurangan'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BilanganGanjilGenap(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 142, 172, 205),
            ),
            child: const Text('Periksa Ganjil/Genap'),
          ),
          const SizedBox(height: 20),
          Text(
            resultText,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
class BilanganGanjilGenap extends StatefulWidget {
  const BilanganGanjilGenap({super.key});

  @override
  _BilanganGanjilGenap createState() => _BilanganGanjilGenap();
}

class _BilanganGanjilGenap extends State<BilanganGanjilGenap> {
  TextEditingController numberController = TextEditingController();
  String resultText = "";

  void checkNumber() {
    setState(() {
      int number = int.tryParse(numberController.text) ?? 0;
      if (number % 2 == 0) {
        resultText = '$number adalah bilangan genap';
      } else {
        resultText = '$number adalah bilangan ganjil';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 249, 217),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Bilangan Ganjil/Genap'),
        backgroundColor: const Color.fromARGB(255, 142, 172, 205),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              controller: numberController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Angka',
                icon: Icon(Icons.input),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkNumber,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 142, 172, 205),
              ),
              child: const Text('Periksa'),
            ),
            const SizedBox(height: 20),
            Text(
              resultText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
