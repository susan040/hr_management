import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/chat_screen_controller.dart';
import 'package:hr_management/models/chat_message.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class ChatScreen extends StatelessWidget {
  final chatController = Get.put(ChatScreenController());
  ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        elevation: 0,
        title: Text(
          "Sujita Thapa",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 19,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.phone,
              color: AppColors.backGroundDark,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined,
                size: 28, color: AppColors.backGroundDark),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  return ChatBubble(message: message);
                },
              );
            }),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.extraWhite,
            ),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.only(left: 14, right: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        chatController.sendMessage(
                          "",
                          true,
                          audioDuration: "00:30",
                        );
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.extraWhite,
                        size: 19,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 14),
                  padding: EdgeInsets.only(left: 15),
                  height: 55,
                  width: Get.width / 1.30,
                  decoration: BoxDecoration(
                    color: AppColors.lGrey,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: chatController.messageController,
                          decoration: InputDecoration(
                            hintText: "Message",
                            hintStyle: CustomTextStyles.f12W400(
                              color: AppColors.secondaryTextColor,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        margin: EdgeInsets.only(left: 10, right: 12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if (chatController.messageController.text
                                  .trim()
                                  .isNotEmpty) {
                                chatController.sendMessage(
                                  chatController.messageController.text.trim(),
                                  false,
                                );
                                chatController.messageController.clear();
                              }
                            },
                            child: Icon(
                              Icons.send,
                              color: AppColors.extraWhite,
                              size: 19,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!message.isSender && message.imageUrl != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 8.0, top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                message.imageUrl!,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        Column(
          crossAxisAlignment: message.isSender
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width / 1.7,
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: message.isSender
                    ? AppColors.primaryColor
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: message.isAudio
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow,
                            color: message.isSender
                                ? AppColors.extraWhite
                                : AppColors.primaryColor),
                        const SizedBox(width: 8),
                        Container(
                          width: 120,
                          height: 5,
                          color: message.isSender
                              ? AppColors.extraWhite
                              : AppColors.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          message.audioDuration!,
                          style: CustomTextStyles.f11W400(
                            color: message.isSender
                                ? AppColors.extraWhite
                                : AppColors.primaryColor,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      message.message,
                      style: CustomTextStyles.f12W400(
                        color: message.isSender
                            ? AppColors.extraWhite
                            : AppColors.primaryColor,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
              child: Text(
                message.time,
                style: CustomTextStyles.f11W400(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ],
        ),
        if (message.isSender && message.imageUrl != null) // For sender
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 16, top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                message.imageUrl!,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}
