class TagEntity {
	TagData data;
	int resultCode;
	String message;

	TagEntity({this.data, this.resultCode, this.message});

	TagEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new TagData.fromJson(json['data']) : null;
		resultCode = json['resultCode'];
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['resultCode'] = this.resultCode;
		data['message'] = this.message;
		return data;
	}
}

class TagData {
	int currPage;
	int totalPage;
	int pageSize;
	int totalCount;
	List<TagDataList> xList;

	TagData({this.currPage, this.totalPage, this.pageSize, this.totalCount, this.xList});

	TagData.fromJson(Map<String, dynamic> json) {
		currPage = json['currPage'];
		totalPage = json['totalPage'];
		pageSize = json['pageSize'];
		totalCount = json['totalCount'];
		if (json['list'] != null) {
			xList = new List<TagDataList>();(json['list'] as List).forEach((v) { xList.add(new TagDataList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['currPage'] = this.currPage;
		data['totalPage'] = this.totalPage;
		data['pageSize'] = this.pageSize;
		data['totalCount'] = this.totalCount;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class TagDataList {
	int isDeleted;
	int tagId;
	String createTime;
	String tagName;

	TagDataList({this.isDeleted, this.tagId, this.createTime, this.tagName});

	TagDataList.fromJson(Map<String, dynamic> json) {
		isDeleted = json['isDeleted'];
		tagId = json['tagId'];
		createTime = json['createTime'];
		tagName = json['tagName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isDeleted'] = this.isDeleted;
		data['tagId'] = this.tagId;
		data['createTime'] = this.createTime;
		data['tagName'] = this.tagName;
		return data;
	}
}
