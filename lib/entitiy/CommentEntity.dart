class CommentEntity {
	CommentData data;
	int resultCode;
	String message;

	CommentEntity({this.data, this.resultCode, this.message});

	CommentEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new CommentData.fromJson(json['data']) : null;
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

class CommentData {
	int currPage;
	int totalPage;
	int pageSize;
	int totalCount;
	List<CommantDataList> xList;

	CommentData({this.currPage, this.totalPage, this.pageSize, this.totalCount, this.xList});

	CommentData.fromJson(Map<String, dynamic> json) {
		currPage = json['currPage'];
		totalPage = json['totalPage'];
		pageSize = json['pageSize'];
		totalCount = json['totalCount'];
		if (json['list'] != null) {
			xList = new List<CommantDataList>();(json['list'] as List).forEach((v) { xList.add(new CommantDataList.fromJson(v)); });
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

class CommantDataList {
	String commentator;
	String replyBody;
	String replyCreateTime;
	String commentatorIp;
	int isDeleted;
	String websiteUrl;
	String commentBody;
	int commentId;
	String commentCreateTime;
	int blogId;
	String email;
	int commentStatus;

	CommantDataList({this.commentator, this.replyBody, this.replyCreateTime, this.commentatorIp, this.isDeleted, this.websiteUrl, this.commentBody, this.commentId, this.commentCreateTime, this.blogId, this.email, this.commentStatus});

	CommantDataList.fromJson(Map<String, dynamic> json) {
		commentator = json['commentator'];
		replyBody = json['replyBody'];
		replyCreateTime = json['replyCreateTime'];
		commentatorIp = json['commentatorIp'];
		isDeleted = json['isDeleted'];
		websiteUrl = json['websiteUrl'];
		commentBody = json['commentBody'];
		commentId = json['commentId'];
		commentCreateTime = json['commentCreateTime'];
		blogId = json['blogId'];
		email = json['email'];
		commentStatus = json['commentStatus'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['commentator'] = this.commentator;
		data['replyBody'] = this.replyBody;
		data['replyCreateTime'] = this.replyCreateTime;
		data['commentatorIp'] = this.commentatorIp;
		data['isDeleted'] = this.isDeleted;
		data['websiteUrl'] = this.websiteUrl;
		data['commentBody'] = this.commentBody;
		data['commentId'] = this.commentId;
		data['commentCreateTime'] = this.commentCreateTime;
		data['blogId'] = this.blogId;
		data['email'] = this.email;
		data['commentStatus'] = this.commentStatus;
		return data;
	}
}
