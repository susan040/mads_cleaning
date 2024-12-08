import 'package:get/get.dart';
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
    final now = DateTime.now();
    final hour = now.hour > 12
        ? now.hour - 12
        : now.hour == 0
            ? 12
            : now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';

    return '$hour:$minute $period';
  }
}
