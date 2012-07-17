## ユーザー自身の情報を取得

認証中のユーザー自身の情報を取得します。

```
GET /api/me.json
```

```
{
    "created_at": "2012-06-14T10:34:39+09:00",
    "id": 2,
    "image":  {
        "url": "/uploads/user/image/2/89a9620e.jpg",
        "thumb": {
            "url": "/uploads/user/image/2/thumb_89a9620e.jpg"
        }
    },
    "login_name": "aiueo",
    "updated_at": "2012-07-02T10:05:26+09:00"
}
```

+ Requires Authentication: Yes