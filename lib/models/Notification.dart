class Notification{
  final String? content , type , read_at , link;
  final num? id , from_id , user_id;
  final Object? from_user,user;

  final String? created_at , updated_at ;


  const Notification({
    this.id,
    this.content,
    this.type,
    this.from_id,
    this.user_id,
    this.created_at,
    this.updated_at,
    this.read_at,
    this.link,
    this.user,
    this.from_user,

  });
}

