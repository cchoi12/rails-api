# README
This small API was a project mainly to stay up to date with how Rails has been utilized as of late.
##### Goal
Learn how to expose DB as JSON to requests based on geolocation and rating.
Test requests and responses with RSPEC & FactoryBot. Move away from Controller Tests.
Allow POST / GET / PATCH / DELETE HTTP requests for comments / ratings on *Doctors*.

##### Todos:
1. Think of a way to do Token based authentication, Devise no longer supports that.
2. Pick up a framework or use modern JS `fetch` to connect to the API and get JSON responses back.
***

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
