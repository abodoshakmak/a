//------STRING-------
import 'package:flutter/material.dart';

// localhost:8000/api/register?name=abdo&email=shak204@gmail.com&password=123456789&password_confirmation=123456789
const baseURL = 'http://192.168.1.123:8000/api';
const loginURl = 'http://192.168.1.123:8000/api/login';
const registerURL = 'http://192.168.1.123:8000/api/register';
const logoutURL = 'http://192.168.1.123:8000/api/logout';
const userURL = 'http://192.168.1.123:8000/api/user';
const postsURL = 'http://192.168.1.123:8000/api/posts';
const commentsURL = 'http://192.168.1.123:8000/api/comments';

//--------Errors---------
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingwentwrong = 'Something went wrong, try again';

// --- input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
      labelText: label,
      contentPadding: const EdgeInsets.all(10),
      border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black)));
}

// button

TextButton kTextButton(String label, Function onPressed) {
  return TextButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.grey),
          padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.symmetric(vertical: 10))),
      onPressed: () => onPressed(),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ));
}

// loginRegisterHint
Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
          child: Text(label, style: const TextStyle(color: Colors.blue)),
          onTap: () => onTap())
    ],
  );
}

// likes and comment btn

Expanded kLikeAndComment(
    int value, IconData icon, Color color, Function onTap) {
  return Expanded(
    child: Material(
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: color,
              ),
              const SizedBox(width: 4),
              Text('$value')
            ],
          ),
        ),
      ),
    ),
  );
}
