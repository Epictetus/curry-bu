## ユーザーの一覧を取得

ユーザーの一覧を取得します。

```
GET /api/users.json
```

```
[                                                                                                                                                                                       
    {
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
    {
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
    }
]
```

+ Requires Authentication: No

## ユーザーの情報を取得

指定したユーザーの情報を取得します。

```
GET /api/users/:id.json
```

Parameters:

+ `id` (required) - ユーザー ID

```
{
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
}
```

+ Requires Authentication: No