var endpoints = {
  "info": {
    "_postman_id": "6456f1aa-ff2f-4727-b3d9-9ba3d0cc2411",
    "name": "groupkash-backend",
    "description": "API endpoints to the backend database",
    "schema":
        "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "user",
      "item": [
        {
          "name": "kyc",
          "item": [
            {
              "name": "kyc vaidation",
              "id": "8374bd01-74ed-494f-bf4e-a079c47b373e",
              "protocolProfileBehavior": {"disableBodyPruning": true},
              "request": {
                "auth": {
                  "type": "bearer",
                  "bearer": [
                    {
                      "key": "token",
                      "value":
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1MzUxMzEzNSwianRpIjoiMzc3MmM1Y2YtYmI4NS00YWIzLWIzMTItMzExMDQ2YTFlM2RiIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjYyOGU5YmFiZjRiZDY3ZGFjMjRhODgzZSIsIm5iZiI6MTY1MzUxMzEzNSwiYXVkIjoiZ3JvdXBrYXNoIiwiaXNzIjoiZ3JvdXBrYXNoX2JhY2tlbmQiLCJleHAiOjE2NTM1MzExMzV9.tvwE-TpQT0x4xl1tWTwX9lojH9Fg8z-jqvc-SSi8gNw",
                      "type": "string"
                    }
                  ]
                },
                "method": "POST",
                "header": [],
                "body": {
                  "mode": "raw",
                  "raw":
                      "{\n    \"state_of_origin\": \"Akwa-Ibom\",\n    \"home_address\": \"May close aba\",\n    \"bvn_number\": 22255235625\n}",
                  "options": {
                    "raw": {"language": "json"}
                  }
                },
                "url": {
                  "raw": "{{grpkash-dns-remote}}/api/v1.0/kyc",
                  "host": ["{{grpkash-dns-remote}}"],
                  "path": ["api", "v1.0", "kyc"]
                }
              },
              "response": []
            }
          ],
          "id": "78cd5d1b-032a-490b-acdc-df0c75f45dd2",
          "description": "Request to verify kyc"
        },
        {
          "name": "Get user by id",
          "id": "5407de14-90b5-4898-810e-a07a59abdc2f",
          "protocolProfileBehavior": {"disableBodyPruning": true},
          "request": {
            "auth": {
              "type": "bearer",
              "bearer": [
                {
                  "key": "token",
                  "value":
                      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1MzIyNzYyMiwianRpIjoiNDEyNjYxMjItNjU4Mi00MGM1LWI0YWEtZmU2MmJjZmNiNmYwIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjYyOGEzZmY0NDQyZDU4NDRmNjA0MDQ2NiIsIm5iZiI6MTY1MzIyNzYyMiwiYXVkIjoiZ3JvdXBrYXNoIiwiaXNzIjoiZ3JvdXBrYXNoX2JhY2tlbmQiLCJleHAiOjE2NTMyNDU2MjJ9.dxvQZRBZWnQwnGJ7QnsAA9olALD15KkHcdu9beK1Mxo",
                  "type": "string"
                }
              ]
            },
            "method": "GET",
            "header": [],
            "url": {
              "raw":
                  "{{grpkash-dns-remote}}/api/v1.0/user/628a431e647befffb342fda7",
              "host": ["{{grpkash-dns-remote}}"],
              "path": ["api", "v1.0", "user", "628a431e647befffb342fda7"]
            }
          },
          "response": []
        },
        {
          "name": "Get user by email",
          "id": "f628c107-31aa-444e-b622-625198ee71f4",
          "protocolProfileBehavior": {"disableBodyPruning": true},
          "request": {
            "auth": {
              "type": "bearer",
              "bearer": [
                {
                  "key": "token",
                  "value":
                      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1Mjk3MDE5NSwianRpIjoiMmUyNjkwYjUtYmFhMS00MjJhLWE4OGItODEyZWI4MGRhMTQ2IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjYyODY1MjU2MTk4ZDBlMDAwYzE5YWY0MSIsIm5iZiI6MTY1Mjk3MDE5NSwiYXVkIjoiZ3JvdXBrYXNoIiwiaXNzIjoiZ3JvdXBrYXNoX2JhY2tlbmQiLCJleHAiOjE2NTI5ODgxOTV9.5cqzuPoGIUBjnLDHJMoWcoiwCmtQQuKrpBrnyWPwdoY",
                  "type": "string"
                }
              ]
            },
            "method": "GET",
            "header": [],
            "url": {
              "raw":
                  "{{grpkash-dns-remote}}/api/v1.0/user/email/joshua22@gmail.com",
              "host": ["{{grpkash-dns-remote}}"],
              "path": ["api", "v1.0", "user", "email", "joshua22@gmail.com"]
            }
          },
          "response": []
        },
        {
          "name": "User login",
          "id": "18b12168-0dda-4e05-bfbb-9bcc6332e4ba",
          "protocolProfileBehavior": {"disableBodyPruning": true},
          "request": {
            "method": "POST",
            "header": [],
            "body": {
              "mode": "raw",
              "raw":
                  "{\n    \"phone_number\": \"+2348022192245\",\n    \"password\": \"password\"\n}",
              "options": {
                "raw": {"language": "json"}
              }
            },
            "url": {
              "raw": "{{grpkash-dns-remote}}/api/v1.0/login",
              "host": ["{{grpkash-dns-remote}}"],
              "path": ["api", "v1.0", "login"]
            }
          },
          "response": []
        },
        {
          "name": "hello",
          "id": "d7ca8d4c-e044-4b1e-89af-dbc1799a8b8c",
          "protocolProfileBehavior": {"disableBodyPruning": true},
          "request": {
            "auth": {
              "type": "bearer",
              "bearer": [
                {
                  "key": "token",
                  "value":
                      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1MjYxMzMyNiwianRpIjoiYzhlOTE3ZDYtNzhiMy00MWQ0LWE0NjAtNWZjNWNjYjVkNzBhIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjYyODBiMGQ2YjhhODgwZDQxMzVjYjM4MyIsIm5iZiI6MTY1MjYxMzMyNiwiYXVkIjoiZ3JvdXBrYXNoIiwiaXNzIjoiZ3JvdXBrYXNoX2JhY2tlbmQiLCJleHAiOjE2NTI2MzEzMjZ9.VSW-sqdaOXS_8Umms_VMnRjvkADw5odaaKAkhtLVyR4",
                  "type": "string"
                }
              ]
            },
            "method": "GET",
            "header": [],
            "url": {
              "raw": "{{grpkash-dns-remote}}/api/v1.0/hello",
              "host": ["{{grpkash-dns-remote}}"],
              "path": ["api", "v1.0", "hello"]
            }
          },
          "response": []
        },
        {
          "name": "Logout",
          "id": "6fc2c0d9-5b33-407b-8517-065b8528a354",
          "protocolProfileBehavior": {"disableBodyPruning": true},
          "request": {
            "auth": {
              "type": "bearer",
              "bearer": [
                {
                  "key": "token",
                  "value":
                      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1MzQ4NzQ3NSwianRpIjoiMDUyYTY1OGUtMDA3OS00ZWM1LTgwNGUtYThiYjRiYjdkOWFlIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjYyOGUzMmQwODliMTQyNDI5Y2EzNzQwMiIsIm5iZiI6MTY1MzQ4NzQ3NSwiYXVkIjoiZ3JvdXBrYXNoIiwiaXNzIjoiZ3JvdXBrYXNoX2JhY2tlbmQiLCJleHAiOjE2NTM1MDU0NzV9.TtPI4bB45JLmo-5MqlwZsR5yfsAdZHYGKkcs4CFJ6AE",
                  "type": "string"
                }
              ]
            },
            "method": "DELETE",
            "header": [
              {"key": "", "value": "", "type": "text"}
            ],
            "url": {
              "raw": "{{grpkash-dns-remote}}/api/v1.0/logout",
              "host": ["{{grpkash-dns-remote}}"],
              "path": ["api", "v1.0", "logout"]
            }
          },
          "response": []
        },
        {
          "name": "Refresh token",
          "id": "e73e568d-6ab4-4ce0-b4d8-538fbf5e7dc7",
          "protocolProfileBehavior": {"disableBodyPruning": true},
          "request": {
            "auth": {
              "type": "bearer",
              "bearer": [
                {
                  "key": "token",
                  "value":
                      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1MTcxMDYzMiwianRpIjoiYTVjNDE3ODYtYTdmZC00ZWUwLTliOGUtNzBkNDJmOTk1OGUyIiwidHlwZSI6InJlZnJlc2giLCJzdWIiOiI2MjcxODQ0OWUyY2I4OGUwYjUzZDhiZmUiLCJuYmYiOjE2NTE3MTA2MzIsImF1ZCI6Imdyb3Vwa2FzaCIsImlzcyI6Imdyb3Vwa2FzaF9iYWNrZW5kIiwiZXhwIjoxNjUyMzE1NDMyfQ.uhbZfGTWtbRQW26kXoupqU70PL-6qnCN43-ATsJGck4",
                  "type": "string"
                }
              ]
            },
            "method": "DELETE",
            "header": [],
            "url": {
              "raw": "{{grpkash-dns-remote}}/api/v1.0/token/refresh",
              "host": ["{{grpkash-dns-remote}}"],
              "path": ["api", "v1.0", "token", "refresh"]
            }
          },
          "response": []
        }
      ],
      "id": "68edb55e-3316-4045-8e11-f59f4c974b6c",
      "description": "API endpoints for user"
    },
    {
      "name": "group",
      "item": [
        {
          "name": "create_group",
          "item": [
            {
              "name": "create group",
              "id": "f9e31331-f4f6-4c65-aa6a-231cee680a9b",
              "protocolProfileBehavior": {"disableBodyPruning": true},
              "request": {
                "auth": {
                  "type": "bearer",
                  "bearer": [
                    {
                      "key": "token",
                      "value":
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1MzUxNDA0MSwianRpIjoiNmNjNDcwMjYtODRhZS00ODZjLTlkMGQtMTc5MzhjOTJiYjQxIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjYyOGU5ZWVhMjM1YzA5MGYwMDYzY2ZiOCIsIm5iZiI6MTY1MzUxNDA0MSwiYXVkIjoiZ3JvdXBrYXNoIiwiaXNzIjoiZ3JvdXBrYXNoX2JhY2tlbmQiLCJleHAiOjE2NTM1MzIwNDF9.jCSJbxFqg3rM_yVuIzuMy3ma6Bkjd2evPMWAVJoSQaM",
                      "type": "string"
                    }
                  ]
                },
                "method": "POST",
                "header": [],
                "body": {
                  "mode": "raw",
                  "raw":
                      "{\n  \"group_name\": \"demo\",\n  \"members\": [\n    {\"user_id\": \"62898d4fcc5e681c2dd19070\", \"status\": \"member\"},\n    {\"user_id\": \"62898d4fcc5e681c2dd19074\", \"status\": \"member\"},\n    {\"user_id\": \"62898d4fcc5e681c2dd19015\", \"status\": \"member\"},\n    {\"user_id\": \"62898d4fcc5e647c2dd19070\", \"status\": \"member\"},\n    {\"user_id\": \"62898d4faa5e681c2dd19070\", \"status\": \"member\"},\n    {\"user_id\": \"62856d4fcc5e681c2dd19070\", \"status\": \"member\"}\n  ]\n}",
                  "options": {
                    "raw": {"language": "json"}
                  }
                },
                "url": {
                  "raw":
                      "{{grpkash-dns-remote}}/api/v1.0/group/user/628e9eea235c090f0063cfb8",
                  "host": ["{{grpkash-dns-remote}}"],
                  "path": [
                    "api",
                    "v1.0",
                    "group",
                    "user",
                    "628e9eea235c090f0063cfb8"
                  ]
                }
              },
              "response": []
            },
            {
              "name": "Get group by user id",
              "id": "f89f0fee-5bcd-40e0-bdb0-0cdd9ec081c9",
              "protocolProfileBehavior": {"disableBodyPruning": true},
              "request": {
                "auth": {
                  "type": "bearer",
                  "bearer": [
                    {
                      "key": "token",
                      "value":
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1MzE4MDAzNiwianRpIjoiNTQ0ZTJhMWUtZjE5NC00Y2EwLTg3N2QtOTM5ZGUxOTAwODA5IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjYyODkzZjJlM2EyZmJmM2I4NzIyY2M5ZiIsIm5iZiI6MTY1MzE4MDAzNiwiYXVkIjoiZ3JvdXBrYXNoIiwiaXNzIjoiZ3JvdXBrYXNoX2JhY2tlbmQiLCJleHAiOjE2NTMxOTgwMzZ9.XRDjmaZ1ioV-hbcwPC7IPmp__qlNBuY6LGSyHOTPw_s",
                      "type": "string"
                    }
                  ]
                },
                "method": "GET",
                "header": [],
                "url": {
                  "raw":
                      "{{grpkash-dns-remote}}/api/v1.0/group/user/62898d4fcc5e681c2dd19070",
                  "host": ["{{grpkash-dns-remote}}"],
                  "path": [
                    "api",
                    "v1.0",
                    "group",
                    "user",
                    "62898d4fcc5e681c2dd19070"
                  ]
                }
              },
              "response": []
            }
          ],
          "id": "b28a41a1-5b86-4105-bb1f-9a8ab6f6c28e"
        }
      ],
      "id": "b10309a6-580a-4e19-9473-2deca5b4bee4",
      "description": "API endpoints for group users"
    },
    {
      "name": "admin",
      "item": [
        {
          "name": "users",
          "item": [
            {
              "name": "Get all users",
              "id": "f4167719-1dcc-43fe-af2f-4daa32054ae6",
              "protocolProfileBehavior": {"disableBodyPruning": true},
              "request": {
                "auth": {
                  "type": "bearer",
                  "bearer": [
                    {
                      "key": "token",
                      "value":
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1MjgxNjMyNCwianRpIjoiMjFiNjIxZTYtMmYzYi00MzJjLWE0YTgtMzY4MTcxNjYzNDdlIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjYyODEwMzljNmY3OWFmNmRkMGI4MjU4ZiIsIm5iZiI6MTY1MjgxNjMyNCwiYXVkIjoiZ3JvdXBrYXNoIiwiaXNzIjoiZ3JvdXBrYXNoX2JhY2tlbmQiLCJleHAiOjE2NTI4MzQzMjR9.pB6SQ_1vmVkq6Hp77EXJlaflCHmaWzp_E63npEPlF9I",
                      "type": "string"
                    }
                  ]
                },
                "method": "GET",
                "header": [],
                "url": {
                  "raw": "{{grpkash-dns-remote}}/api/v1.0/users",
                  "host": ["{{grpkash-dns-remote}}"],
                  "path": ["api", "v1.0", "users"]
                }
              },
              "response": []
            }
          ],
          "id": "c1b35209-b553-44a1-8eee-b71a4080aba1",
          "description": "API endpoints for users"
        },
        {
          "name": "user",
          "item": [
            {
              "name": "registration",
              "item": [
                {
                  "name": "Register user",
                  "id": "1ef9d348-94eb-47c6-afca-7541af31bd6c",
                  "protocolProfileBehavior": {"disableBodyPruning": true},
                  "request": {
                    "method": "POST",
                    "header": [],
                    "body": {
                      "mode": "raw",
                      "raw":
                          "{\n    \"username\": \"joshua2235\",\n    \"first_name\": \"Joy\",\n    \"last_name\": \"Kudosen\",    \n    \"password\": \"password\",\n    \"email\": \"joshua25@gmail.com\",\n    \"pin\": 1246,\n    \"phone_number\": \"+2348022192245\",\n    \"firebase_uid\": \"XttdyeAOGxenuRTjCX0KsHXxod92\",\n    \"groups\": {\n        \n            \"owned\": [\n                ],\n            \"belong\": [\n            ]\n        \n    }\n}",
                      "options": {
                        "raw": {"language": "json"}
                      }
                    },
                    "url": {
                      "raw": "{{grpkash-dns-remote}}/api/v1.0/register",
                      "host": ["{{grpkash-dns-remote}}"],
                      "path": ["api", "v1.0", "register"]
                    },
                    "description": "Validate user KYC information"
                  },
                  "response": [
                    {
                      "id": "a0e26ef6-b4c5-4537-b1bd-a64942be4a5f",
                      "name": "Register user",
                      "originalRequest": {
                        "method": "POST",
                        "header": [],
                        "body": {
                          "mode": "raw",
                          "raw":
                              "{\n    \"username\": \"joshua2235\",\n    \"first_name\": \"Joy\",\n    \"last_name\": \"Kudosen\",    \n    \"password\": \"password\",\n    \"email\": \"joshua25@gmail.com\",\n    \"pin\": 1246,\n    \"phone_number\": \"+2348022192245\",\n    \"firebase_uid\": \"XttdyeAOGxenuRTjCX0KsHXxod92\",\n    \"groups\": {\n        \n            \"owned\": [\n                ],\n            \"belong\": [\n            ]\n        \n    }\n}",
                          "options": {
                            "raw": {"language": "json"}
                          }
                        },
                        "url": {
                          "raw": "{{grpkash-dns-remote}}/api/v1.0/register",
                          "host": ["{{grpkash-dns-remote}}"],
                          "path": ["api", "v1.0", "register"]
                        }
                      },
                      "status": "OK",
                      "code": 200,
                      "_postman_previewlanguage": "json",
                      "header": [
                        {"key": "Server", "value": "gunicorn"},
                        {
                          "key": "Date",
                          "value": "Thu, 26 May 2022 09:03:30 GMT"
                        },
                        {"key": "Connection", "value": "keep-alive"},
                        {"key": "Content-Type", "value": "application/json"},
                        {"key": "Content-Length", "value": "166"},
                        {"key": "Access-Control-Allow-Origin", "value": "*"}
                      ],
                      "cookie": [],
                      "responseTime": null,
                      "body":
                          "{\n    \"success\": true,\n    \"message\": \"User successfully registered!\",\n    \"data\": {\n        \"_id\": \"628f42629073598f4e4dd4f1\",\n        \"username\": \"joshua2235\",\n        \"first_name\": \"Joy\",\n        \"last_name\": \"Kudosen\"\n    }\n}"
                    }
                  ]
                },
                {
                  "name": "Check if email exists",
                  "id": "d3911cc2-70a8-4c04-8489-79f44a346884",
                  "protocolProfileBehavior": {"disableBodyPruning": true},
                  "request": {
                    "method": "GET",
                    "header": [],
                    "body": {
                      "mode": "raw",
                      "raw": "{\n    \"email\": \"joshua22@gmail.com\"\n}",
                      "options": {
                        "raw": {"language": "json"}
                      }
                    },
                    "url": {
                      "raw": "{{grpkash-dns-remote}}/api/v1.0/checkEmail",
                      "host": ["{{grpkash-dns-remote}}"],
                      "path": ["api", "v1.0", "checkEmail"]
                    }
                  },
                  "response": []
                }
              ],
              "id": "ef5f7e9a-5e85-4e1b-bc23-50e30a3abcba"
            },
            {
              "name": "update_user_status",
              "id": "3f6aabc1-7da8-4c4b-83f6-5a86354c6432",
              "protocolProfileBehavior": {"disableBodyPruning": true},
              "request": {
                "auth": {
                  "type": "bearer",
                  "bearer": [
                    {
                      "key": "token",
                      "value":
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY1MjgxNjMyNCwianRpIjoiMjFiNjIxZTYtMmYzYi00MzJjLWE0YTgtMzY4MTcxNjYzNDdlIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjYyODEwMzljNmY3OWFmNmRkMGI4MjU4ZiIsIm5iZiI6MTY1MjgxNjMyNCwiYXVkIjoiZ3JvdXBrYXNoIiwiaXNzIjoiZ3JvdXBrYXNoX2JhY2tlbmQiLCJleHAiOjE2NTI4MzQzMjR9.pB6SQ_1vmVkq6Hp77EXJlaflCHmaWzp_E63npEPlF9I",
                      "type": "string"
                    }
                  ]
                },
                "method": "POST",
                "header": [],
                "body": {
                  "mode": "raw",
                  "raw": "{\n    \"status\": \"admin\"\n}",
                  "options": {
                    "raw": {"language": "json"}
                  }
                },
                "url": {
                  "raw":
                      "{{grpkash-dns-remote}}/api/v1.0/update_status/group/group_id/user/user_id",
                  "host": ["{{grpkash-dns-remote}}"],
                  "path": [
                    "api",
                    "v1.0",
                    "update_status",
                    "group",
                    "group_id",
                    "user",
                    "user_id"
                  ]
                },
                "description":
                    "Used by admin to update user status from member to group admin or vice versa."
              },
              "response": []
            }
          ],
          "id": "59e4ad15-21ee-4df0-b070-810ca894f6ac",
          "description": "For user operations carried out by the admin"
        },
        {
          "name": "Firebase auth token",
          "id": "9f30a90a-5459-40f8-bba2-b8f2426f72c3",
          "protocolProfileBehavior": {"disableBodyPruning": true},
          "request": {
            "method": "GET",
            "header": [],
            "url": {"raw": ""}
          },
          "response": []
        }
      ],
      "id": "086c2678-1df5-4e12-835e-eb151a219e8e",
      "description": "For admin operations"
    }
  ],
  "event": [
    {
      "listen": "prerequest",
      "script": {
        "id": "3e7dc936-d90a-47f3-9ea8-9eb0b04791b0",
        "type": "text/javascript",
        "exec": [""]
      }
    },
    {
      "listen": "test",
      "script": {
        "id": "64b7bace-82d9-49c1-be1d-7bee3242c464",
        "type": "text/javascript",
        "exec": [""]
      }
    },
  ],
  "variable": [
    {"id": "f8a31181-07b9-46ab-b8b7-32ceac861c0f", "value": "13.40.83.87"},
    {
      "id": "4674e295-972e-4a9d-a4f8-7077ad625f59",
      "key": "grpkash-dns-remote",
      "value": "http://ec2-13-40-83-87.eu-west-2.compute.amazonaws.com"
    }
  ]
};
