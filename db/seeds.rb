require 'chronic'
Tyto.db.clear_everything

teacher1 = Tyto.db.create_teacher(username: "Brian Provost",
                              password: "password1",
                              email: "brian@teacher.com",
                              phone_number: "5120000000")

teacher2 = Tyto.db.create_teacher(username: "Parth Shah",
                              password: "password1",
                              email: "parth@teacher.com",
                              phone_number: "5121111111")

teacher3 = Tyto.db.create_teacher(username: "Gilbert Garza",
                              password: "password1",
                              email: "gilbert@teacher.com",
                              phone_number: "5122222222")
teacher4 = Tyto.db.create_teacher(username: "Gilbert",
                              password: "password1",
                              email: "john@teacher.com",
                              phone_number: "5122222222")

student1 = Tyto.db.create_student(username: "Benny Provost",
                              password: "password1",
                              email: "benny@student.com",
                              phone_number: "5123333333")

student2 = Tyto.db.create_student(username: "Evie Provost",
                                  password: "password1",
                                  email: "evie@student.com",
                                  phone_number: "5124444444")

student3 = Tyto.db.create_student(username: "Hasmukh Shah",
                                  password: "password1",
                                  email: "hasmukh@student.com",
                                  phone_number: "5125555555")
course = Tyto.db.create_course(name: "Algebra")
other_course = Tyto.db.create_course(name: "History")
another_course = Tyto.db.create_course(name: "English")

classroom1 = Tyto.db.create_classroom(teacher_id: teacher1.id,
                                      course_id:  course.id,
                                      name: "Period 1" )
classroom2 = Tyto.db.create_classroom(teacher_id: teacher1.id,
                                      course_id:  course.id,
                                      name: "Period 2" )
classroom3 = Tyto.db.create_classroom(teacher_id: teacher1.id,
                                      course_id:  course.id,
                                      name: "Period 3" )

classroom4 = Tyto.db.create_classroom(teacher_id: teacher2.id,
                                      course_id: other_course.id,
                                      name: "Period 4")

classroom5 = Tyto.db.create_classroom(teacher_id: teacher3.id,
                                      course_id: another_course.id,
                                      name: "Period 5")

invite1 = Tyto.db.create_invite(email: student2.email,
                                teacher_id: teacher2.id,
                                classroom_id: classroom4.id,
                                accepted: false)

invite2 = Tyto.db.create_invite(email: student2.email,
                                teacher_id: teacher3.id,
                                classroom_id: classroom5.id,
                                accepted: false)

Tyto.db.add_student_to_classroom(classroom_id: classroom4.id,
                                 student_id: student1.id
                                  )
Tyto.db.add_student_to_classroom(classroom_id: classroom5.id,
                                 student_id: student1.id)
Tyto.db.add_student_to_classroom(classroom_id: classroom1.id,
                                 student_id: student1.id,
                                 text: true)
Tyto.db.add_student_to_classroom(classroom_id: classroom1.id,
                                 student_id: student2.id,
                                 text: true)
Tyto.db.add_student_to_classroom(classroom_id: classroom1.id,
                                 student_id: student3.id,
                                 text: false)

Tyto.db.add_student_to_classroom(classroom_id: classroom2.id,
                                 student_id: student1.id)
Tyto.db.add_student_to_classroom(classroom_id: classroom2.id,
                                 student_id: student2.id)

Tyto.db.add_student_to_classroom(classroom_id: classroom3.id,
                                 student_id: student1.id)

other_chapter = Tyto.db.create_chapter(course_id: other_course.id, name: "The Alamo")
another_chapter = Tyto.db.create_chapter(course_id: another_course.id, name: "Gerunds")
dumb_question = Tyto.db.create_question(level:1, question: "What is a gerund?", answer: "Who knows?", chapter_id: another_chapter.id)
Tyto.db.create_question(level:1, question: "What's up?", answer: "Not much", chapter_id: other_chapter.id)
assignment10 = Tyto.db.create_assignment(student_id: student1.id,
                                        chapter_id: other_chapter.id,
                                        teacher_id: teacher2.id,
                                        classroom_id: classroom4.id,
                                        assignment_size: 20,
                                        deadline: Chronic.parse("tomorrow") )
assignment11 = Tyto.db.create_assignment(student_id: student1.id,
                                        chapter_id: another_chapter.id,
                                        teacher_id: teacher3.id,
                                        classroom_id: classroom5.id,
                                        assignment_size: 20,
                                        deadline: Chronic.parse("yesterday") )

[assignment10, assignment11].each do |y|
    Tyto.db.update_last_question(question_id: dumb_question.id,
                              student_id: student1.id,
                              assignment_id: y.id)
end

 Tyto.db.create_question(level: 1, question: "1234 6789 1234 6789 1234 6789",
                              answer: "3", chapter_id: another_chapter.id)
 Tyto.db.create_question(level: 1, question: "1234 6789 1234 6789 1234 6789",
                              answer: "4", chapter_id: another_chapter.id)
 Tyto.db.create_question(level: 1, question: "1234 6789 1234 6789 1234 6789",
                              answer: "5", chapter_id: another_chapter.id)
 Tyto.db.create_question(level: 1, question: "1234 6789 1234 6789 1234 6789",
                              answer: "6", chapter_id: another_chapter.id)
 Tyto.db.create_question(level: 1, question: "1234 6789 1234 6789 1234 6789",
                              answer: "7", chapter_id: another_chapter.id)
 Tyto.db.create_question(level: 1, question: "1234 6789 1234 6789 1234 6789",
                              answer: "8", chapter_id: another_chapter.id)
 Tyto.db.create_question(level: 1, question: "1234 6789 1234 6789 1234 6789",
                              answer: "9", chapter_id: another_chapter.id)
 Tyto.db.create_question(level: 1, question: "1234 6789 1234 6789 1234 6789",
                              answer: "10", chapter_id: another_chapter.id)

  Tyto.db.create_question(level: 1, question: "What is the capital of texas?",
                              answer: "3", chapter_id: other_chapter.id)
 Tyto.db.create_question(level: 1, question: "What is the capital of texas?",
                              answer: "4", chapter_id: other_chapter.id)
 Tyto.db.create_question(level: 1, question: "What is the capital of texas?",
                              answer: "5", chapter_id: other_chapter.id)
 Tyto.db.create_question(level: 1, question: "What is the capital of texas?",
                              answer: "6", chapter_id: other_chapter.id)
 Tyto.db.create_question(level: 1, question: "What is the capital of texas?",
                              answer: "7", chapter_id: other_chapter.id)
 Tyto.db.create_question(level: 1, question: "What is the capital of texas?",
                              answer: "8", chapter_id: other_chapter.id)
 Tyto.db.create_question(level: 1, question: "What is the capital of texas?",
                              answer: "9", chapter_id: other_chapter.id)
 Tyto.db.create_question(level: 1, question: "What is the capital of texas?",
                              answer: "10", chapter_id: other_chapter.id)

chapter1 = Tyto.db.create_chapter(course_id: course.id, name: "Chapter One")
chapter2 = Tyto.db.create_chapter(course_id: course.id, name: "Chapter Two")

section1 = Tyto.db.create_chapter(course_id: chapter1.course_id, parent_id: chapter1.id, name: "The Integers", subname: "1.1", video_url: "https://www.youtube.com/watch?v=UxehrvhNMY8")
section2 = Tyto.db.create_chapter(course_id: chapter1.course_id, parent_id: chapter1.id, name: "The Rational Numbers", subname: "1.2", video_url: "https://www.youtube.com/watch?v=UxehrvhNMY8")
section3 = Tyto.db.create_chapter(course_id: chapter1.course_id, parent_id: chapter1.id, name: "Numbers as Measurements", subname: "1.3", video_url: "https://www.youtube.com/watch?v=UxehrvhNMY8")

section4 = Tyto.db.create_chapter(course_id: chapter2.course_id, parent_id: chapter2.id, name: "Solving Equations Using More Than One Operation", subname: "1.4", video_url: "https://www.youtube.com/watch?v=UxehrvhNMY8")
section5 = Tyto.db.create_chapter(course_id: chapter2.course_id, parent_id: chapter2.id, name: "Simplifying Each Side of an Equation", subname: "1.5", video_url: "https://www.youtube.com/watch?v=UxehrvhNMY8")
section6 = Tyto.db.create_chapter(course_id: chapter2.course_id, parent_id: chapter2.id, name: "Solving Equations that Have the Variable in Both Sides", subname: "1.6", video_url: "https://www.youtube.com/watch?v=UxehrvhNMY8")
question = nil
subtopics = [section1, section2, section3, section4, section5, section6]
subtopics.each do |x|
 question = Tyto.db.create_question(level: 1, question: "1 + 1",
                              answer: "2", chapter_id: x.id)
 Tyto.db.create_question(level: 1, question: "1 + 2",
                              answer: "3", chapter_id: x.id)
 Tyto.db.create_question(level: 1, question: "1 + 3",
                              answer: "4", chapter_id: x.id)
 Tyto.db.create_question(level: 1, question: "1 + 4",
                              answer: "5", chapter_id: x.id)
 Tyto.db.create_question(level: 1, question: "1 + 5",
                              answer: "6", chapter_id: x.id)
 Tyto.db.create_question(level: 1, question: "1 + 6",
                              answer: "7", chapter_id: x.id)
 Tyto.db.create_question(level: 1, question: "1 + 7",
                              answer: "8", chapter_id: x.id)
 Tyto.db.create_question(level: 1, question: "1 + 8",
                              answer: "9", chapter_id: x.id)
 Tyto.db.create_question(level: 1, question: "1 + 9",
                              answer: "10", chapter_id: x.id)

 Tyto.db.create_question(level: 2, question: "2 + 1",
                              answer: "3", chapter_id: x.id)
 Tyto.db.create_question(level: 2, question: "2 + 2",
                              answer: "4", chapter_id: x.id)
 Tyto.db.create_question(level: 2, question: "2 + 3",
                              answer: "5", chapter_id: x.id)
 Tyto.db.create_question(level: 2, question: "2 + 4",
                              answer: "6", chapter_id: x.id)
 Tyto.db.create_question(level: 2, question: "2 + 5",
                              answer: "7", chapter_id: x.id)
 Tyto.db.create_question(level: 2, question: "2 + 6",
                              answer: "8", chapter_id: x.id)
 Tyto.db.create_question(level: 2, question: "2 + 7",
                              answer: "9", chapter_id: x.id)
 Tyto.db.create_question(level: 2, question: "2 + 8",
                              answer: "10", chapter_id: x.id)
 Tyto.db.create_question(level: 2, question: "2 + 9",
                              answer: "11", chapter_id: x.id)

 Tyto.db.create_question(level: 3, question: "3 + 1",
                              answer: "4", chapter_id: x.id)
 Tyto.db.create_question(level: 3, question: "3 + 2",
                              answer: "5", chapter_id: x.id)
 Tyto.db.create_question(level: 3, question: "3 + 3",
                              answer: "6", chapter_id: x.id)
 Tyto.db.create_question(level: 3, question: "3 + 4",
                              answer: "7", chapter_id: x.id)
 Tyto.db.create_question(level: 3, question: "3 + 5",
                              answer: "8", chapter_id: x.id)
 Tyto.db.create_question(level: 3, question: "3 + 6",
                              answer: "9", chapter_id: x.id)
 Tyto.db.create_question(level: 3, question: "3 + 7",
                              answer: "10", chapter_id: x.id)
 Tyto.db.create_question(level: 3, question: "3 + 8",
                              answer: "11", chapter_id: x.id)
 Tyto.db.create_question(level: 3, question: "3 + 9",
                              answer: "12", chapter_id: x.id)

 Tyto.db.create_question(level: 4, question: "4 + 1",
                              answer: "5", chapter_id: x.id)
 Tyto.db.create_question(level: 4, question: "4 + 2",
                              answer: "6", chapter_id: x.id)
 Tyto.db.create_question(level: 4, question: "4 + 3",
                              answer: "7", chapter_id: x.id)
 Tyto.db.create_question(level: 4, question: "4 + 4",
                              answer: "8", chapter_id: x.id)
 Tyto.db.create_question(level: 4, question: "4 + 5",
                              answer: "9", chapter_id: x.id)
 Tyto.db.create_question(level: 4, question: "4 + 6",
                              answer: "10", chapter_id: x.id)
 Tyto.db.create_question(level: 4, question: "4 + 7",
                              answer: "11", chapter_id: x.id)
 Tyto.db.create_question(level: 4, question: "4 + 8",
                              answer: "12", chapter_id: x.id)
 Tyto.db.create_question(level: 4, question: "4 + 9",
                              answer: "13", chapter_id: x.id)
end

[student1, student2, student3].each do |x|
assignment1 = Tyto.db.create_assignment(student_id: x.id,
                                        chapter_id: section1.id,
                                        teacher_id: teacher1.id,
                                        classroom_id: classroom1.id,
                                        assignment_size: 20,
                                        deadline: Chronic.parse("yesterday") )

assignment2 = Tyto.db.create_assignment(student_id: x.id,
                                        chapter_id: section2.id,
                                        teacher_id: teacher1.id,
                                        classroom_id: classroom1.id,
                                        assignment_size: 20,
                                        deadline: Chronic.parse("next month") )

assignment3 = Tyto.db.create_assignment(student_id: x.id,
                                        chapter_id: section3.id,
                                        teacher_id: teacher1.id,
                                        classroom_id: classroom1.id,
                                        assignment_size: 20,
                                        deadline: Chronic.parse("yesterday") )

assignment4 = Tyto.db.create_assignment(student_id: x.id,
                                        chapter_id: section4.id,
                                        teacher_id: teacher1.id,
                                        classroom_id: classroom1.id,
                                        assignment_size: 20,
                                        deadline: Chronic.parse("next month") )

  [assignment1, assignment2, assignment3, assignment4].each do |y|
      Tyto.db.update_last_question(question_id: question.id,
                                student_id: x.id,
                                assignment_id: y.id)
  end
end



