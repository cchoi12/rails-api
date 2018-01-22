# README

### Dependencies
- Ruby (See the specific version in the Gemfile and .ruby-version files.)
- Postgres

### Setup
```sh
- bundle
- rails db:create db:remigrate
```

### Tests
`- rspec`

##Requests
GET | To get doctors index
`root_url/v1/doctors`

GET | To show specific doctor
`root_url/v1/doctors/:doctor_id`

GET | Index comments on doctors
`root_url/v1/doctors/:doctor_id/comments`

GET | Show specific comment on doctor
`root_url/v1/doctors/:doctor_id/comments/:id`

POST| Create comment on doctor
`root_url/v1/doctors/:doctor_id/comments`

Key | Value
--- | ---
comment_body: | Hey this is a test comment
author_id: | 2312
rating: | 1


PATCH| Update Comment on a doctor
`root_url/v1/doctors/:doctor_id/comments/:id`

Key | Value
--- | ---
comment_body: | Updating this comment.

DELETE| Delete Comment on a doctor
`root_url/v1/doctors/:doctor_id/comments/:id`
