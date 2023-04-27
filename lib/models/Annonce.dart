class Annonce{
 final num? id , user_id  , type_logement_id   ;

 final String? typeLogement , title , address , compAddress , city ;
 final String? country,postalCode , description , animaux, capacity , price, numberOfBeds ,surface, informationsSupp , servicesLogement ,optionsLogement ,  created_at , updated_at  ;

 final List? images,suppPropretiesAnnonce;

 final Map<String, dynamic>? user;


  const Annonce({
     this.id,
     this.user_id,
     this.surface,
    this.capacity,
     this.price,
    this.numberOfBeds,
    this.optionsLogement,
    this.images,
    this.suppPropretiesAnnonce,
    this.created_at,
    this.updated_at,
    this.type_logement_id,
    this.title,
    this.address,
    this.compAddress,
    this.city,
    this.country,
    this.postalCode,
    this.description,
    this.animaux,
    this.informationsSupp,
    this.servicesLogement,
    this.typeLogement,
    this.user,

  });
}
