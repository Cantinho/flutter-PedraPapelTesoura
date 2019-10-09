import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  var _options = ["pedra", "papel", "tesoura"];

  var _imageResult = AssetImage("images/padrao.png");
  var _textResult = "Escolha uma opção abaixo";

  void _selectedOption(String option) {

    var number = Random().nextInt(3);
    var appChoice = _options[number];


    if ( (option == "pedra" && appChoice == "tesoura") ||
         (option == "papel" && appChoice == "pedra")   ||
         (option == "tesoura" && appChoice == "papel") ) {

      setState(() {
        _textResult = "Parabéns!!! Você ganhou!!! :)";
      });

    } else if (
        (appChoice == "pedra" && option == "tesoura") ||
        (appChoice == "papel" && option == "pedra")   ||
        (appChoice == "tesoura" && option == "papel") ) {

      setState(() {
        _textResult = "Você perdeu :(";
      });

    } else {
      setState(() {
        _textResult = "Empatamos ;)";
      });

    }

    setState(() {
      this._imageResult = AssetImage("images/$appChoice.png");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel e Tesoura") ,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
               "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imageResult),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _textResult,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: ()=> _selectedOption("pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: ()=> _selectedOption("papel"),
                child: Image.asset("images/papel.png", height: 100),

              ),
              GestureDetector(
                onTap: ()=> _selectedOption("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
