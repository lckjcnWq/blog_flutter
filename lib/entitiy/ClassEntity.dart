class ClassEntity {
	ClassData data;
	int resultCode;
	String message;

	ClassEntity({this.data, this.resultCode, this.message});

	ClassEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new ClassData.fromJson(json['data']) : null;
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

class ClassData {
	int currPage;
	int totalPage;
	int pageSize;
	int totalCount;
	List<ClassDataList> xList;

	ClassData({this.currPage, this.totalPage, this.pageSize, this.totalCount, this.xList});

	ClassData.fromJson(Map<String, dynamic> json) {
		currPage = json['currPage'];
		totalPage = json['totalPage'];
		pageSize = json['pageSize'];
		totalCount = json['totalCount'];
		if (json['list'] != null) {
			xList = new List<ClassDataList>();(json['list'] as List).forEach((v) { xList.add(new ClassDataList.fromJson(v)); });
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

class ClassDataList {
	int isDeleted;
	String categoryIcon;
	String createTime;
	int categoryRank;
	String categoryName;
	int categoryId;

	ClassDataList({this.isDeleted, this.categoryIcon, this.createTime, this.categoryRank, this.categoryName, this.categoryId});

	ClassDataList.fromJson(Map<String, dynamic> json) {
		isDeleted = json['isDeleted'];
		categoryIcon = json['categoryIcon'];
		createTime = json['createTime'];
		categoryRank = json['categoryRank'];
		categoryName = json['categoryName'];
		categoryId = json['categoryId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isDeleted'] = this.isDeleted;
		data['categoryIcon'] = this.categoryIcon;
		data['createTime'] = this.createTime;
		data['categoryRank'] = this.categoryRank;
		data['categoryName'] = this.categoryName;
		data['categoryId'] = this.categoryId;
		return data;
	}
}
