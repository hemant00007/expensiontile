class FirstModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  FirstModel({this.statusCode, this.message, this.data});

  FirstModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? state;
  bool? exAuth;
  int? agentId;
  int? id;
  int? balance;
  int? equity;
  String? userName;
  String? iconCls;
  String? agentType;
  String? forexCommission;
  String? indexCommission;
  String? oilCommission;
  String? chinaCommission;
  String? metalCommission;
  String? silverCommission;
  String? op;
  int? iParentId;
  bool? isEditcommossion;
  bool? ishdssetting;
  bool? iseditfxacommission;
  bool? isopenAgent;

  Data(
      {this.state,
        this.exAuth,
        this.agentId,
        this.id,
        this.balance,
        this.equity,
        this.userName,
        this.iconCls,
        this.agentType,
        this.forexCommission,
        this.indexCommission,
        this.oilCommission,
        this.chinaCommission,
        this.metalCommission,
        this.silverCommission,
        this.op,
        this.iParentId,
        this.isEditcommossion,
        this.ishdssetting,
        this.iseditfxacommission,
        this.isopenAgent});

  Data.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    exAuth = json['ex_auth'];
    agentId = json['agent_id'];
    id = json['id'];
    balance = json['balance'];
    equity = json['equity'];
    userName = json['user_name'];
    iconCls = json['iconCls'];
    agentType = json['agent_type'];
    forexCommission = json['forex_commission'];
    indexCommission = json['index_commission'];
    oilCommission = json['oil_commission'];
    chinaCommission = json['china_commission'];
    metalCommission = json['metal_commission'];
    silverCommission = json['silver_commission'];
    op = json['op'];
    iParentId = json['_parentId'];
    isEditcommossion = json['isEditcommossion'];
    ishdssetting = json['ishdssetting'];
    iseditfxacommission = json['iseditfxacommission'];
    isopenAgent = json['isopenAgent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['ex_auth'] = this.exAuth;
    data['agent_id'] = this.agentId;
    data['id'] = this.id;
    data['balance'] = this.balance;
    data['equity'] = this.equity;
    data['user_name'] = this.userName;
    data['iconCls'] = this.iconCls;
    data['agent_type'] = this.agentType;
    data['forex_commission'] = this.forexCommission;
    data['index_commission'] = this.indexCommission;
    data['oil_commission'] = this.oilCommission;
    data['china_commission'] = this.chinaCommission;
    data['metal_commission'] = this.metalCommission;
    data['silver_commission'] = this.silverCommission;
    data['op'] = this.op;
    data['_parentId'] = this.iParentId;
    data['isEditcommossion'] = this.isEditcommossion;
    data['ishdssetting'] = this.ishdssetting;
    data['iseditfxacommission'] = this.iseditfxacommission;
    data['isopenAgent'] = this.isopenAgent;
    return data;
  }
}