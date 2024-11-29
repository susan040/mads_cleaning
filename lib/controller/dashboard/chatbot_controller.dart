import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mads_cleaning/model/chatbot.dart';
import 'package:mads_cleaning/repo/chatbot_repo.dart';

class ChatbotController extends GetxController {
  RxList<ChatBotDetails> allChats = <ChatBotDetails>[].obs;
  RxList<ChatBotDetails> selectedChats = <ChatBotDetails>[].obs;
  final loading = RxBool(false);

  var delayedAnswer = RxString("");
  @override
  void onInit() {
    getAllChats();
    super.onInit();
  }

  getAllChats() async {
    loading.value = true;
    await ChatbotRepo.getChat(onSuccess: (chats) {
      loading.value = false;
      allChats.addAll(chats);
    }, onError: (message) {
      loading.value = false;
      //CustomSnackBar.error(title: "ChatBot", message: message);
    });
  }

  void selectChat(ChatBotDetails chat) {
    selectedChats.add(chat);
  }

  String getFormattedTime(ChatBotDetails chat) {
    DateTime currentDate = DateTime.now();
    String fullDateTimeString;
    if (chat.createdAt != null) {
      DateTime createdAtTime = chat.createdAt is String
          ? DateTime.parse(chat.createdAt ?? "")
          : chat.createdAt as DateTime;

      fullDateTimeString = createdAtTime.toIso8601String();
    } else {
      fullDateTimeString =
          '${currentDate.toIso8601String().split('T')[0]}T${currentDate.toIso8601String().split('T')[1]}';
    }
    DateTime serviceTimeFormatted = DateTime.parse(fullDateTimeString);
    DateFormat timeFormat = DateFormat.jm();
    return timeFormat.format(serviceTimeFormatted);
  }
}
