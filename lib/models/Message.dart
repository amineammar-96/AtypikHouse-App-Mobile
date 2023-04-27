class Message{
  final String? content  , readingState,
      from_name,to_name;
  final num? id,sender_user_id,receiver_user_id,conversation_id;

  final String? created_at , updated_at ;

  final Object? userAccount;


  const Message({
    this.id,
    this.content,
    this.sender_user_id,
    this.receiver_user_id,
    this.readingState,
    this.from_name,
    this.to_name,
    this.conversation_id,
    this.created_at,
    this.updated_at,

    this.userAccount,

  });
}

