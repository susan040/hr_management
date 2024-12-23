class ChatMessage {
  final String message;
  final String time;
  final bool isSender;
  final bool isAudio;
  final String? audioDuration;
  final String? imageUrl;

  ChatMessage({
    required this.message,
    required this.time,
    required this.isSender,
    this.isAudio = false,
    this.audioDuration,
    this.imageUrl,
  });
}
