class Reservation{
 final num? id , user_id ,annonce_id ;

 final String? bookState , amount , paymentMethod , nightCount ;
 final String? checkIn,checkOut , created_at , updated_at;

 final Object? annonce,images;


  const Reservation({
     this.id,
     this.user_id,
     this.annonce_id,
    this.bookState,
     this.amount,
    this.paymentMethod,

    this.nightCount,
    this.checkIn,
    this.checkOut,
    this.created_at,
    this.updated_at,

    this.annonce,
    this.images,

  });
}
