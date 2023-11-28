class CommonModel {
  /// UserID
  String? userId;

  // READ-ONLYプロパティ
  String? get readonlyUserId => userId;

  // コンストラクタでメンバへの代入以外の処理がなければ、コンストラクタの中の処理は書かなくても良い
  // 無名のコンストラクタ
  CommonModel(this.userId);

  // 名前をつけたコンストラクタ(init)
  CommonModel.init(String userId, String test) : this(userId);
}