import 'package:dallal_proj/core/constants/app_texts.dart';

class CommentModel {
  final String advOwner, userComment, userName, userImg, postedAt;

  const CommentModel({
    this.advOwner = kPostOwnerNameError,
    this.userComment = kCommentErrorTemp,
    this.userName = kUserNameError,
    this.userImg = kPfpJack,
    this.postedAt = 'قبل 23 ساعة',
  });
}
