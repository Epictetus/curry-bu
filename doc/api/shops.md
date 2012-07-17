## お店の一覧を取得

お店の一覧を取得します。

```
GET /api/shops.json
```

```
[
    {
        "address": "東京都渋谷区渋谷1-1",
        "create_user_id": 1,
        "created_at": "2012-06-13T10:18:12+09:00",
        "deleted_at": null,
        "id": 1,
        "name": "もうやん",
        "update_user_id": 4,
        "updated_at": "2012-07-03T15:38:01+09:00",
        "url": "http://hoge.com"
    },
    {
        "address": null,
        "create_user_id": 2,
        "created_at": "2012-06-18T01:23:33+09:00",
        "deleted_at": null,
        "id": 2,
        "name": "パク森",
        "update_user_id": 2,
        "updated_at": "2012-06-29T00:30:44+09:00",
        "url": "http://fuga.com"
    }
]
```

+ Requires Authentication: No

## お店の情報を取得

指定したお店の情報を取得します。

```
GET /api/shops/:id.json
```

Parameters:

+ `id` (required) - お店 ID

```
{
    "address": "東京都渋谷区渋谷1-1",
    "create_user_id": 1,
    "created_at": "2012-06-13T10:18:12+09:00",
    "deleted_at": null,
    "id": 1,
    "name": "もうやん",
    "update_user_id": 4,
    "updated_at": "2012-07-03T15:38:01+09:00",
    "url": "http://hoge.com"
}
```

+ Requires Authentication: No

## お店を登録

お店を登録します。

```
POST /api/shops.json
```

POST data:

```
{
    "shop": {
        "name": "自宅カレー",
        "url": "http://piyo.com",
        "address": "自宅"
    } 
}
```

```
{
    "address": "自宅",
    "create_user_id": 2,
    "created_at": "2012-07-12T15:27:52+09:00",
    "deleted_at": null,
    "id": 21,
    "name": "自宅カレー",
    "update_user_id": 2,
    "updated_at": "2012-07-12T15:27:52+09:00",
    "url": "http://piyo.com"
}
```

+ Requires Authentication: Yes