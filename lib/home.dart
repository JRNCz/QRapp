import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _text = TextEditingController();

  String usertext = "";
  String userscanner = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('QR Code scanner'),
          centerTitle: true,
          backgroundColor: Colors.green[500],
        ),
        backgroundColor: Colors.grey[200],
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/qrcodeimage.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.qr_code, color: Colors.white),
                label: Text('Scan QR code'),
                onPressed: () async {
                  print('Clicked the button');
                  dynamic result = await Navigator.pushNamed(context, "/scan");
                  setState(() {
                    userscanner = result;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(192, 64),
                  backgroundColor: Colors.green[500],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Divider(
                  thickness: 3,
                  color: Colors.green[400],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: TextField(
                      controller: _text,
                      decoration: InputDecoration(
                        hintText: "Write info to display within QRCode",
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _text.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.qr_code, color: Colors.white),
                    label: Text('Genarate'),
                    onPressed: () {
                      print('Clicked the button');
                      setState(() {
                        usertext = _text.text;
                        print(usertext);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(128, 64),
                      backgroundColor: Colors.green[500],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (usertext != "")
                    Container(
                      child: QrImage(data: usertext, size: 192),
                      color: Colors.white,
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  if (userscanner != "")
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Read: $userscanner',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
