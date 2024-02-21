import 'package:flutter/material.dart';

AppBar appbarScreen(
    {required String title,
    PreferredSize? bottom,
    BuildContext? context,
    bool notification = false}) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Text(
      title,
      style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
    ),
    actions: [
      notification
          ? const Icon(
              Icons.notifications_none_sharp,
              size: 28,
            )
          : const SizedBox(),
      const SizedBox(
        width: 10,
      ),
      context != null
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 28,
              ))
          : const SizedBox(),
      const SizedBox(
        width: 10,
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Colors.greenAccent, borderRadius: BorderRadius.circular(6)),
        width: 30,
        height: 30,
        child: const Icon(
          Icons.person,
          color: Colors.black,
        ),
      ),
      const SizedBox(
        width: 10,
      )
    ],
  );
}
