User.create!([
  {displayname: "tester2", email: "test2@example.com", encrypted_password: "$2a$10$giXH/QuBRS8m5uppFjUvM.5N3haQ0SRvUnO0zPlHuQ6XjVo2Nqnee", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-04-08 15:49:44", last_sign_in_at: "2015-04-07 21:46:14", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: false},
  {displayname: "tester", email: "test@example.com", encrypted_password: "$2a$10$s9qgeAcJkruXXaiavxOaKuZroWLQqrq4U26mIvk1dFy1BRXR3N0Eu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-05-09 16:09:37", last_sign_in_at: "2015-04-08 03:04:10", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: true}
])
Comment.create!([
  {content: "insightful comment", user_id: 1, report_id: 1},
  {content: "This is a comment", user_id: 1, report_id: 2},
  {content: "comment comment comment", user_id: 2, report_id: 2},
  {content: "I can edit a comment.", user_id: 2, report_id: 1},
  {content: "New Comment\r\n", user_id: 2, report_id: 1},
  {content: "just lions", user_id: 2, report_id: 1},
  {content: "long comment", user_id: 1, report_id: 2}
])
Report.create!([
  {country: "United States", state: "Alabama", hospital: "Sibley", birthday: "2010-01-29 00:00:00", generation: "child", content: "Stuff", user_id: 1},
  {country: "United States", state: "Alabama", hospital: "place", birthday: "1290-01-01 00:00:00", generation: "parent", content: "things", user_id: 2}
])
