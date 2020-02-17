class LinkEntity {
	LinkData data;
	int resultCode;
	String message;

	LinkEntity({this.data, this.resultCode, this.message});

	LinkEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new LinkData.fromJson(json['data']) : null;
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

class LinkData {
	int currPage;
	int totalPage;
	int pageSize;
	int totalCount;
	List<LinkDataList> xList;

	LinkData({this.currPage, this.totalPage, this.pageSize, this.totalCount, this.xList});

	LinkData.fromJson(Map<String, dynamic> json) {
		currPage = json['currPage'];
		totalPage = json['totalPage'];
		pageSize = json['pageSize'];
		totalCount = json['totalCount'];
		if (json['list'] != null) {
			xList = new List<LinkDataList>();(json['list'] as List).forEach((v) { xList.add(new LinkDataList.fromJson(v)); });
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

class LinkDataList {
	int linkId;
	int isDeleted;
	String createTime;
	String linkDescription;
	String linkUrl;
	int linkType;
	int linkRank;
	String linkName;

	LinkDataList({this.linkId, this.isDeleted, this.createTime, this.linkDescription, this.linkUrl, this.linkType, this.linkRank, this.linkName});

	LinkDataList.fromJson(Map<String, dynamic> json) {
		linkId = json['linkId'];
		isDeleted = json['isDeleted'];
		createTime = json['createTime'];
		linkDescription = json['linkDescription'];
		linkUrl = json['linkUrl'];
		linkType = json['linkType'];
		linkRank = json['linkRank'];
		linkName = json['linkName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['linkId'] = this.linkId;
		data['isDeleted'] = this.isDeleted;
		data['createTime'] = this.createTime;
		data['linkDescription'] = this.linkDescription;
		data['linkUrl'] = this.linkUrl;
		data['linkType'] = this.linkType;
		data['linkRank'] = this.linkRank;
		data['linkName'] = this.linkName;
		return data;
	}
}
