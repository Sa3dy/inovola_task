class Course {
  final int id;
  final String title;
  final List<dynamic> imgs;
  final String interest;
  final int price;
  final String date;
  final String address;
  final String trainerName;
  final String trainerImg;
  final String trainerInfo;
  final String occasionDetail;
  final String latitude;
  final String longitude;
  final bool isLiked;
  final bool isSold;
  final bool isPrivateEvent;
  final bool hiddenCashPayment;
  final int specialForm;
  final String questionnaire;
  final String questExplanation;
  final List reservTypes;

  Course(
      {this.id,
      this.title,
      this.imgs,
      this.interest,
      this.price,
      this.date,
      this.address,
      this.trainerName,
      this.trainerImg,
      this.trainerInfo,
      this.occasionDetail,
      this.latitude,
      this.longitude,
      this.isLiked,
      this.isSold,
      this.isPrivateEvent,
      this.hiddenCashPayment,
      this.specialForm,
      this.questionnaire,
      this.questExplanation,
      this.reservTypes});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      imgs: json['img'],
      interest: json['interest'],
      price: json['price'],
      date: json['date'],
      address: json['address'],
      trainerName: json['trainerName'],
      trainerImg: json['trainerImg'],
      trainerInfo: json['trainerInfo'],
      occasionDetail: json['occasionDetail'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isLiked: json['isLiked'],
      isSold: json['isSold'],
      isPrivateEvent: json['isPrivateEvent'],
      hiddenCashPayment: json['hiddenCashPayment'],
      specialForm: json['specialForm'],
      questionnaire: json['questionnaire'],
      questExplanation: json['questExplanation'],
      reservTypes: json['reservTypes'],
    );
  }
}
