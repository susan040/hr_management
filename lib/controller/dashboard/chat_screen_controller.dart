import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/models/chat_message.dart';
import 'package:intl/intl.dart';

class ChatScreenController extends GetxController {
  final messageController = TextEditingController();
  var messages = <ChatMessage>[
    ChatMessage(
        message: "I’m meeting a friend here for dinner. How about you?",
        time: "1:30 PM",
        isSender: true,
        imageUrl:
            "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
    ChatMessage(
        message: "",
        time: "3:16 PM",
        isSender: false,
        isAudio: true,
        audioDuration: "03:28",
        imageUrl:
            "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
    ChatMessage(
        message: "I’m doing my assignment, but really need to take a break.",
        time: "3:18 PM",
        isSender: true,
        imageUrl:
            "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
    ChatMessage(
        message:
            "On my way home but I need to stop by the book store to buy a text book.",
        time: "3:25 PM",
        isSender: false,
        imageUrl:
            "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
    ChatMessage(
        message: "",
        time: "3:45 PM",
        isSender: false,
        isAudio: true,
        audioDuration: "01:28",
        imageUrl:
            "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
    ChatMessage(
        message: "I’m meeting a friend here for dinner. How about you?",
        time: "3:18 PM",
        isSender: true,
        imageUrl:
            "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
    ChatMessage(
        message:
            "On my way home but I need to stop by the book store to buy a text book.",
        time: "3:25 PM",
        isSender: false,
        imageUrl:
            "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
    ChatMessage(
        message: "",
        time: "3:45 PM",
        isSender: false,
        isAudio: true,
        audioDuration: "01:28",
        imageUrl:
            "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
  ].obs;

  void sendMessage(String message, bool isAudio, {String? audioDuration}) {
    final currentTime = DateFormat('hh:mm a').format(DateTime.now());
    messages.add(ChatMessage(
      message: message,
      time: currentTime,
      isSender: true,
      isAudio: isAudio,
      audioDuration: audioDuration,
    ));
  }
}
