User.create!([
  {displayname: "tester", email: "test@example.com", password: "testtest", admin: true},
  {displayname: "tester2", email: "test2@example.com", password: "testtest", admin: false}
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
