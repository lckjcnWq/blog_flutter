class BlogEntity {
	BlogData data;
	int resultCode;
	String message;

	BlogEntity({this.data, this.resultCode, this.message});

	BlogEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new BlogData.fromJson(json['data']) : null;
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

class BlogData {
	int currPage;
	int totalPage;
	int pageSize;
	int totalCount;
	List<BlogDataList> xList;

	BlogData({this.currPage, this.totalPage, this.pageSize, this.totalCount, this.xList});

	BlogData.fromJson(Map<String, dynamic> json) {
		currPage = json['currPage'];
		totalPage = json['totalPage'];
		pageSize = json['pageSize'];
		totalCount = json['totalCount'];
		if (json['list'] != null) {
			xList = new List<BlogDataList>();(json['list'] as List).forEach((v) { xList.add(new BlogDataList.fromJson(v)); });
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

class BlogDataList {
	int enableComment;
	int blogStatus;
	int blogCategoryId;
	String blogTags;
	String updateTime;
	dynamic blogContent;
	String blogTitle;
	String blogSubUrl;
	String blogCategoryName;
	int isDeleted;
	String createTime;
	int blogViews;
	String blogCoverImage;
	int blogId;

	BlogDataList({this.enableComment, this.blogStatus, this.blogCategoryId, this.blogTags, this.updateTime, this.blogContent, this.blogTitle, this.blogSubUrl, this.blogCategoryName, this.isDeleted, this.createTime, this.blogViews, this.blogCoverImage, this.blogId});

	BlogDataList.fromJson(Map<String, dynamic> json) {
		enableComment = json['enableComment'];
		blogStatus = json['blogStatus'];
		blogCategoryId = json['blogCategoryId'];
		blogTags = json['blogTags'];
		updateTime = json['updateTime'];
		blogContent = json['blogContent'];
		blogTitle = json['blogTitle'];
		blogSubUrl = json['blogSubUrl'];
		blogCategoryName = json['blogCategoryName'];
		isDeleted = json['isDeleted'];
		createTime = json['createTime'];
		blogViews = json['blogViews'];
		blogCoverImage = json['blogCoverImage'];
		blogId = json['blogId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['enableComment'] = this.enableComment;
		data['blogStatus'] = this.blogStatus;
		data['blogCategoryId'] = this.blogCategoryId;
		data['blogTags'] = this.blogTags;
		data['updateTime'] = this.updateTime;
		data['blogContent'] = this.blogContent;
		data['blogTitle'] = this.blogTitle;
		data['blogSubUrl'] = this.blogSubUrl;
		data['blogCategoryName'] = this.blogCategoryName;
		data['isDeleted'] = this.isDeleted;
		data['createTime'] = this.createTime;
		data['blogViews'] = this.blogViews;
		data['blogCoverImage'] = this.blogCoverImage;
		data['blogId'] = this.blogId;
		return data;
	}
}
