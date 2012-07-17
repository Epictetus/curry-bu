## 食べたものの一覧を取得

食べたものの一覧を取得します。  
デフォルトで 20 件ずつ取得します。

```
GET /api/items.json?page=:page
```

Parameters:

+ `page` (optional) - ページ

```
[                                                                                                                                                                                      
    {
        "ate_at": "2012-07-12",
        "comment": "うどんもよい",
        "created_at": "2012-07-12T15:32:03+09:00",
        "deleted_at": null,
        "id": 13,
        "image": {
            "url": "/uploads/item/image/13/70f00d64_1_.jpg",
            "normal": {
                "url": "/uploads/item/image/13/normal_70f00d64_1_.jpg"
            },
            "thumb": {
                "url": "/uploads/item/image/13/thumb_70f00d64_1_.jpg"
            }
        },
        "price": 420,
        "shop_id": 2,
        "title": "カレーうどん",
        "updated_at": "2012-07-12T15:32:03+09:00",
        "user_id": 2,
        "user": {
            "created_at": "2012-06-14T10:34:39+09:00",
            "id": 2,
            "image": {
                "url": "/uploads/user/image/2/89a9620e.jpg",
                "thumb": {                                                                                                                                                           [479/9136]
                    "url": "/uploads/user/image/2/thumb_89a9620e.jpg"
                }
            },
            "login_name": "aiueo",
            "updated_at": "2012-07-02T10:05:26+09:00"
        },
        "shop": {
            "address": null,
            "create_user_id": 2,
            "created_at": "2012-06-18T01:23:33+09:00",
            "deleted_at": null,
            "id": 2,
            "name": "ほげ",
            "update_user_id": 2,
            "updated_at": "2012-06-29T00:30:44+09:00",
            "url": "http://hoge.com"
        }
    },
    {
        "ate_at": "2012-07-11",
        "comment": "これがコメントである。",
        "created_at": "2012-07-12T15:31:37+09:00",
        "deleted_at": null,
        "id": 12,
        "image": {
            "url": "/uploads/item/image/12/89a9620e.jpg",
            "normal": {
                "url": "/uploads/item/image/12/normal_89a9620e.jpg"
            },
            "thumb": {
                "url": "/uploads/item/image/12/thumb_89a9620e.jpg"
            }
        },
        "price": 340,
        "shop_id": 1,
        "title": "ボンカレー",
        "updated_at": "2012-07-12T15:31:37+09:00",
        "user_id": 2,
        "user": {
            "created_at": "2012-06-14T10:34:39+09:00",
            "id": 2,
            "image": {
                "url": "/uploads/user/image/2/89a9620e.jpg",
                "thumb": {
                    "url": "/uploads/user/image/2/thumb_89a9620e.jpg"
                }
            },
            "login_name": "aiueo",
            "updated_at": "2012-07-02T10:05:26+09:00"
        },
        "shop": {
            "address": "東京都渋谷区渋谷1-1",
            "create_user_id": 1,
            "created_at": "2012-06-13T10:18:12+09:00",
            "deleted_at": null,
            "id": 1,
            "name": "ふがふが",
            "update_user_id": 4,
            "updated_at": "2012-07-03T15:38:01+09:00",
            "url": "http://fuga.com"
        }
    }
]
```

+ Requires Authentication: No

## 食べたものの情報を取得

指定した食べたものの情報を取得します。

```
GET /api/items/:id.json
```

Parameters:

+ `id` (required) - 食べたもの ID

```
{
    "ate_at": "2012-06-13",
    "comment": "comment\r\nbr",
    "created_at": "2012-06-13T10:18:28+09:00",
    "deleted_at": null,
    "id": 1,
    "image": {
        "url": "/uploads/item/image/1/0d9f48af.jpg",
        "normal": {
            "url": "/uploads/item/image/1/normal_0d9f48af.jpg"
        },
        "thumb": {
            "url": "/uploads/item/image/1/thumb_0d9f48af.jpg"
        }
    },
    "price": 1234,
    "shop_id": 1,
    "title": "test",
    "updated_at": "2012-06-25T09:57:32+09:00",
    "user_id": 1,
    "user": {
        "created_at": "2012-06-13T10:17:40+09:00",
        "id": 1,
        "image": {
            "url": null,
            "thumb": {
                "url": null
            }
        },
        "login_name": "test",
        "updated_at": "2012-06-13T10:17:40+09:00"
    },
    "shop": {
        "address": "東京都渋谷区渋谷1-1",
        "create_user_id": 1,
        "created_at": "2012-06-13T10:18:12+09:00",
        "deleted_at": null,
        "id": 1,
        "name": "test shop",
        "update_user_id": 4,
        "updated_at": "2012-07-03T15:38:01+09:00",
        "url": "http://google.com"
    }
}
```

+ Requires Authentication: No

## 食べたものを登録

食べたものを登録します。

```
POST /api/items.json
```

POST data:

```
{
    "item": {
        "title": "カレーうどん",
        "price": 1234,
        "comment": "うどんは美味しい!!",
        "ate_at": "2012-07-13",
        "shop_id": 1,
        "image": Faraday::UploadIO.new('/path/to/photo.jpg', 'image/jpeg')
    }
}
```

```
{
    "ate_at": "2012-07-13",
    "comment": "うどんは美味しい!!",
    "created_at": "2012-07-13T10:06:09+09:00",
    "deleted_at": null,
    "id": 16,
    "image": {
        "url": "/uploads/item/image/16/2699f420.jpg",
        "normal": {
            "url": "/uploads/item/image/16/normal_2699f420.jpg"
        },
        "thumb": {
            "url": "/uploads/item/image/16/thumb_2699f420.jpg"
        }
    },
    "price": 1234,
    "shop_id": 1,
    "title": "カレーうどん",
    "updated_at": "2012-07-13T10:06:09+09:00",
    "user_id": 2,
    "user": {
        "created_at": "2012-06-14T10:34:39+09:00",
        "id": 2,
        "image": {
            "url": "/uploads/user/image/2/89a9620e.jpg",
            "thumb": {
                "url": "/uploads/user/image/2/thumb_89a9620e.jpg"
            }
        },
        "login_name": "aiueo",
        "updated_at": "2012-07-02T10:05:26+09:00"
    },
    "shop": {
        "address": "東京都渋谷区渋谷1-1",
        "create_user_id": 1,
        "created_at": "2012-06-13T10:18:12+09:00",
        "deleted_at": null,
        "id": 1,
        "name": "test shop",
        "update_user_id": 4,
        "updated_at": "2012-07-03T15:38:01+09:00",
        "url": "http://google.com"
    }
}
```

+ Requires Authentication: Yes