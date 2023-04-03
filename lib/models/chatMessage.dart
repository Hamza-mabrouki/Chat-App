class ChatMessage {
  String messageContent;
  String messageType;
  String user;
  ChatMessage({required this.messageContent, required this.messageType,required this.user});
  factory ChatMessage.fromJson(Map<String ,dynamic>jsonData)
  { return ChatMessage(messageContent: jsonData['message'],messageType:jsonData['msgtype'] ,user: jsonData['user']);
}
}
