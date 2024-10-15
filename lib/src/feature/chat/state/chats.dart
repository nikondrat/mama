import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'chats.g.dart';

class ChatsViewStore extends _ChatsViewStore with _$ChatsViewStore {
  ChatsViewStore({
    required super.restClient,
    required super.userStore,
  });
}

abstract class _ChatsViewStore with Store {
  _ChatsViewStore({
    required this.restClient,
    required this.userStore,
  });

  final RestClient restClient;
  final UserStore userStore;

  @observable
  ObservableFuture<ChatsData> fetchChatsFuture = emptyResponse;

  @observable
  ChatsData? chatsData;

  @observable
  ObservableList<ChatModelSingle>? chats = ObservableList();

  @observable
  ObservableList<ChatModelGroup>? groups = ObservableList();

  @computed
  bool get hasResults =>
      fetchChatsFuture != emptyResponse &&
      fetchChatsFuture.status == FutureStatus.fulfilled;

  Future<ChatsData> fetchChats() async {
    final Future<ChatsData> future =
        restClient.get(Endpoint().chats, queryParams: {
      // 'child_id': userStore.selectedChild?.id,
    }).then((v) {
      if (v != null) {
        final data = ChatsData.fromJson(v);
        chats = ObservableList.of(data.chats ?? []);
        groups = ObservableList.of(data.groupChat ?? []);
        return data;
      }
      return emptyResponse;
    });
    fetchChatsFuture = ObservableFuture(future);

    return chatsData = await future;
  }

  static ObservableFuture<ChatsData> emptyResponse =
      ObservableFuture.value(ChatsData(
    chats: [],
    groupChat: [],
  ));
}
