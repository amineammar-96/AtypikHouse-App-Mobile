class Conversation{

  final num? id , user_id , receiver_id ;
  final String? created_at , updated_at ;

  final Object? avatar , messages , userAccount;
  const Conversation({
    this.id,
    this.user_id,
    this.receiver_id,
    this.created_at,
    this.updated_at,
    this.avatar,
    this.messages,
    this.userAccount,

  });

/*
  factory Conversation.fromJson(Map<String, dynamic> data) {



    final id = data['id'] as num;
    final user_id = data['user_id'] as num;
    final receiver_id = data['receiver_id'] as num;
    final created_at = data['created_at'] as String;
    final updated_at = data['updated_at'] as String;
    final avatar = data['avatar'] as Object;
    final messages = data['messages'] as Object;
    final userAccount = data['userAccount'] as Object;

    return Conversation(id: id, user_id: user_id ,
      receiver_id: receiver_id, created_at: created_at ,updated_at: updated_at, avatar: avatar ,
      messages: messages, userAccount: userAccount
    );
  }
*/
}

