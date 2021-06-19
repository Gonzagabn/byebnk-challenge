// class ByebnkApi {
//   Info info;
//   List<Item> item;

//   ByebnkApi({this.info, this.item});

//   ByebnkApi.fromJson(Map<String, dynamic> json) {
//     info = json['info'] != null ? new Info.fromJson(json['info']) : null;
//     if (json['item'] != null) {
//       item = <Item>[];
//       json['item'].forEach((v) {
//         item.add(new Item.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.info != null) {
//       data['info'] = this.info.toJson();
//     }
//     if (this.item != null) {
//       data['item'] = this.item.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Info {
//   String sPostmanId;
//   String name;
//   String schema;

//   Info({this.sPostmanId, this.name, this.schema});

//   Info.fromJson(Map<String, dynamic> json) {
//     sPostmanId = json['_postman_id'];
//     name = json['name'];
//     schema = json['schema'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_postman_id'] = this.sPostmanId;
//     data['name'] = this.name;
//     data['schema'] = this.schema;
//     return data;
//   }
// }

// class Item {
//   String name;
//   List<Event> event;
//   Request request;
//   List<Null> response;

//   Item({this.name, this.event, this.request, this.response});

//   Item.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     if (json['event'] != null) {
//       event = new List<Event>();
//       json['event'].forEach((v) {
//         event.add(new Event.fromJson(v));
//       });
//     }
//     request =
//         json['request'] != null ? new Request.fromJson(json['request']) : null;
//     if (json['response'] != null) {
//       response = new List<Null>();
//       json['response'].forEach((v) {
//         response.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     if (this.event != null) {
//       data['event'] = this.event.map((v) => v.toJson()).toList();
//     }
//     if (this.request != null) {
//       data['request'] = this.request.toJson();
//     }
//     if (this.response != null) {
//       data['response'] = this.response.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Event {
//   String listen;
//   Script script;

//   Event({this.listen, this.script});

//   Event.fromJson(Map<String, dynamic> json) {
//     listen = json['listen'];
//     script =
//         json['script'] != null ? new Script.fromJson(json['script']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['listen'] = this.listen;
//     if (this.script != null) {
//       data['script'] = this.script.toJson();
//     }
//     return data;
//   }
// }

// class Script {
//   List<String> exec;
//   String type;

//   Script({this.exec, this.type});

//   Script.fromJson(Map<String, dynamic> json) {
//     exec = json['exec'].cast<String>();
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['exec'] = this.exec;
//     data['type'] = this.type;
//     return data;
//   }
// }

// class Request {
//   String method;
//   List<Null> header;
//   Body body;
//   Url url;
//   Auth auth;

//   Request({this.method, this.header, this.body, this.url, this.auth});

//   Request.fromJson(Map<String, dynamic> json) {
//     method = json['method'];
//     if (json['header'] != null) {
//       header = new List<Null>();
//       json['header'].forEach((v) {
//         header.add(new Null.fromJson(v));
//       });
//     }
//     body = json['body'] != null ? new Body.fromJson(json['body']) : null;
//     url = json['url'] != null ? new Url.fromJson(json['url']) : null;
//     auth = json['auth'] != null ? new Auth.fromJson(json['auth']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['method'] = this.method;
//     if (this.header != null) {
//       data['header'] = this.header.map((v) => v.toJson()).toList();
//     }
//     if (this.body != null) {
//       data['body'] = this.body.toJson();
//     }
//     if (this.url != null) {
//       data['url'] = this.url.toJson();
//     }
//     if (this.auth != null) {
//       data['auth'] = this.auth.toJson();
//     }
//     return data;
//   }
// }

// class Body {
//   String mode;
//   String raw;
//   Options options;

//   Body({this.mode, this.raw, this.options});

//   Body.fromJson(Map<String, dynamic> json) {
//     mode = json['mode'];
//     raw = json['raw'];
//     options =
//         json['options'] != null ? new Options.fromJson(json['options']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['mode'] = this.mode;
//     data['raw'] = this.raw;
//     if (this.options != null) {
//       data['options'] = this.options.toJson();
//     }
//     return data;
//   }
// }

// class Options {
//   Raw raw;

//   Options({this.raw});

//   Options.fromJson(Map<String, dynamic> json) {
//     raw = json['raw'] != null ? new Raw.fromJson(json['raw']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.raw != null) {
//       data['raw'] = this.raw.toJson();
//     }
//     return data;
//   }
// }

// class Raw {
//   String language;

//   Raw({this.language});

//   Raw.fromJson(Map<String, dynamic> json) {
//     language = json['language'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['language'] = this.language;
//     return data;
//   }
// }

// class Url {
//   String raw;
//   String protocol;
//   List<String> host;
//   List<String> path;

//   Url({this.raw, this.protocol, this.host, this.path});

//   Url.fromJson(Map<String, dynamic> json) {
//     raw = json['raw'];
//     protocol = json['protocol'];
//     host = json['host'].cast<String>();
//     path = json['path'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['raw'] = this.raw;
//     data['protocol'] = this.protocol;
//     data['host'] = this.host;
//     data['path'] = this.path;
//     return data;
//   }
// }

// class Auth {
//   String type;
//   List<Apikey> apikey;

//   Auth({this.type, this.apikey});

//   Auth.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     if (json['apikey'] != null) {
//       apikey = new List<Apikey>();
//       json['apikey'].forEach((v) {
//         apikey.add(new Apikey.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     if (this.apikey != null) {
//       data['apikey'] = this.apikey.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Apikey {
//   String key;
//   String value;
//   String type;

//   Apikey({this.key, this.value, this.type});

//   Apikey.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     value = json['value'];
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = this.key;
//     data['value'] = this.value;
//     data['type'] = this.type;
//     return data;
//   }
// }