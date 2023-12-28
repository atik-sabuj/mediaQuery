class CourseModel {
  String? id;
  String? catId;
  String? trainingTitle;
  String? trainingSubTitle;
  String? trainingMetaDesc;
  String? metaKeywords;
  String? h2ForSeo;
  String? trainingName;
  String? trainingSlug;
  String? trainingShortDesc;
  String? preRequisite;
  String? certificateCode;
  String? trainingImage;
  String? publicationStatus;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? batchType;
  String? trainingId;
  String? currentBatchId;
  String? batchName;
  String? trainingPrice;
  String? batchDesc;
  String? collaborative;
  String? collaBatchId;
  String? collaBatchName;
  String? partnerName;
  String? classNo;
  String? hours;
  String? seat;
  String? startDate;
  String? endDate;
  String? lastDate;
  String? earlyBirdDate;
  String? discountPrice;
  String? promotionalDesc;
  String? venue;
  String? mainImage;
  String? imageAlterText;
  String? featured;
  String? batchId;
  String? workshopId;
  String? eventId;
  String? trainerId;
  String? catName;
  String? catDesc;
  String? catImage;
  String? catIcon;
  bool categoryChecked=false;

  CourseModel(
      {this.id,
        this.catId,
        this.trainingTitle,
        this.trainingSubTitle,
        this.trainingMetaDesc,
        this.metaKeywords,
        this.h2ForSeo,
        this.trainingName,
        this.trainingSlug,
        this.trainingShortDesc,
        this.preRequisite,
        this.certificateCode,
        this.trainingImage,
        this.publicationStatus,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.batchType,
        this.trainingId,
        this.currentBatchId,
        this.batchName,
        this.trainingPrice,
        this.batchDesc,
        this.collaborative,
        this.collaBatchId,
        this.collaBatchName,
        this.partnerName,
        this.classNo,
        this.hours,
        this.seat,
        this.startDate,
        this.endDate,
        this.lastDate,
        this.earlyBirdDate,
        this.discountPrice,
        this.promotionalDesc,
        this.venue,
        this.mainImage,
        this.imageAlterText,
        this.featured,
        this.batchId,
        this.workshopId,
        this.eventId,
        this.trainerId,
        this.catName,
        this.catDesc,
        this.catImage,
        this.catIcon});

  CourseModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    trainingTitle = json['training_title'];
    trainingSubTitle = json['training_sub_title'];
    trainingMetaDesc = json['training_meta_desc'];
    metaKeywords = json['meta_keywords'];
    h2ForSeo = json['h2_for_seo'];
    trainingName = json['training_name'];
    trainingSlug = json['training_slug'];
    trainingShortDesc = json['training_short_desc'];
    preRequisite = json['pre_requisite'];
    certificateCode = json['certificate_code'];
    trainingImage = json['training_image'];
    publicationStatus = json['publication_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    batchType = json['batch_type'];
    trainingId = json['training_id'];
    currentBatchId = json['current_batch_id'];
    batchName = json['batch_name'];
    trainingPrice = json['training_price'];
    batchDesc = json['batch_desc'];
    collaborative = json['collaborative'];
    collaBatchId = json['colla_batch_id'].toString();
    collaBatchName = json['colla_batch_name'];
    partnerName = json['partner_name'];
    classNo = json['class_no'];
    hours = json['hours'];
    seat = json['seat'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    lastDate = json['last_date'];
    earlyBirdDate = json['early_bird_date'];
    discountPrice = json['discount_price'];
    promotionalDesc = json['promotional_desc'];
    venue = json['venue'];
    mainImage = json['main_image'];
    imageAlterText = json['image_alter_text'];
    featured = json['featured'];
    batchId = json['batch_id'];
    workshopId = json['workshop_id'];
    eventId = json['event_id'];
    trainerId = json['trainer_id'];
    catName = json['cat_name'];
    catDesc = json['cat_desc'];
    catImage = json['cat_image'];
    catIcon = json['cat_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['training_title'] = this.trainingTitle;
    data['training_sub_title'] = this.trainingSubTitle;
    data['training_meta_desc'] = this.trainingMetaDesc;
    data['meta_keywords'] = this.metaKeywords;
    data['h2_for_seo'] = this.h2ForSeo;
    data['training_name'] = this.trainingName;
    data['training_slug'] = this.trainingSlug;
    data['training_short_desc'] = this.trainingShortDesc;
    data['pre_requisite'] = this.preRequisite;
    data['certificate_code'] = this.certificateCode;
    data['training_image'] = this.trainingImage;
    data['publication_status'] = this.publicationStatus;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['batch_type'] = this.batchType;
    data['training_id'] = this.trainingId;
    data['current_batch_id'] = this.currentBatchId;
    data['batch_name'] = this.batchName;
    data['training_price'] = this.trainingPrice;
    data['batch_desc'] = this.batchDesc;
    data['collaborative'] = this.collaborative;
    data['colla_batch_id'] = this.collaBatchId;
    data['colla_batch_name'] = this.collaBatchName;
    data['partner_name'] = this.partnerName;
    data['class_no'] = this.classNo;
    data['hours'] = this.hours;
    data['seat'] = this.seat;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['last_date'] = this.lastDate;
    data['early_bird_date'] = this.earlyBirdDate;
    data['discount_price'] = this.discountPrice;
    data['promotional_desc'] = this.promotionalDesc;
    data['venue'] = this.venue;
    data['main_image'] = this.mainImage;
    data['image_alter_text'] = this.imageAlterText;
    data['featured'] = this.featured;
    data['batch_id'] = this.batchId;
    data['workshop_id'] = this.workshopId;
    data['event_id'] = this.eventId;
    data['trainer_id'] = this.trainerId;
    data['cat_name'] = this.catName;
    data['cat_desc'] = this.catDesc;
    data['cat_image'] = this.catImage;
    data['cat_icon'] = this.catIcon;
    return data;
  }
}
