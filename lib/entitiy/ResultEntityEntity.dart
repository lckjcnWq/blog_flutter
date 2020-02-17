class ResultEntityEntity {
	bool data;
	int resultCode;
	String message;

	ResultEntityEntity({this.data, this.resultCode, this.message});

	ResultEntityEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'];
		resultCode = json['resultCode'];
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['data'] = this.data;
		data['resultCode'] = this.resultCode;
		data['message'] = this.message;
		return data;
	}
}
