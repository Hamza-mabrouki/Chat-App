class ChatMessage {
  String messageContent;
  bool messageType;

  ChatMessage({
    required this.messageContent,
    required this.messageType,
  });
  factory ChatMessage.fromJson(jsonData) {
    return ChatMessage(
      messageContent: jsonData['message'],
      messageType: jsonData['messageType'],
    );
  }
}
