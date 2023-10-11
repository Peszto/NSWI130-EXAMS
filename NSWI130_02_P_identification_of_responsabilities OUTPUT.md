**Create a new exam (MVP)**

As a teacher, I want to be able to schedule new exams before the examination period.

**Reschedule/modify exam date**

As a teacher, I want to be able to modify the date of exams or reschedule them in case the existing dates are not suitable for the students.

**Enroll to an exam (MVP)**

As a student, I need to be able to visualize all the available exams to me, and I need the possibility to enroll in the most suitable one.

**Check room availability**

As a teacher, I have the need to check whether a room in a given time period is available to my students, and if it overlaps with another existing exam or class of my students'.

**Grade exam (MVP)**

As a teacher I want to be able to give a grade to my students, to be able to give feedback for them, and register their results in the system so their semester can be evaluated later.

**Give feedback to students**

As a teacher I want to be able to give a short summary for the student about his/her performance during the exam.

**Unenroll from an exam**

As a student, I need to be able to unenroll from an exam in case I registered by mistake or I would like to choose a different date.

**Manage list of enrolled students (MVP)**

As a teacher, I want to be able to see the enrolled students so I can check if they are eligible to take the exam.



**Create a new exam - Feature breakdown**



1. The teacher asks the system to create a new exam.
    1. The system shows the main dashboard to the teacher
    2. The system allows the option to initiate a new exam creation
2. The system shows the subjects the teacher teaches.
    1. The system checks the teacher’s ID and fetches the subjects from the database which can be associated with the teacher
    2. The system loads the results to the page and allows the option to select one of the subjects
3. The teacher selects one of the subjects
    1. The system provides an interface which allows the teacher to complete any information for the exam: description, prerequisites, date, time, room etc.
4. The teacher fills in the description and sets the minimum requirements of enrollment, and sets whether the exam will be verbal or written.
5. The teacher selects one of the dates 
    1. The system looks up in the database all the room reservations in the selected date
    2. The system lists all the available rooms by time for the selected date 
    3. The teacher can select a new date if there are no suitable rooms available 
6. The teacher selects the convenient time and room.
    1. The system locks the selected time and date for the room for 15 minutes - no teacher can reserve exams for the same time,date and location
    2. The system marks the rooms on the specific date and time as booked. 
    3. If the teacher cancels the reservation, the system will unlock the reserved time and room
7. The teacher can see the room’s capacity and can adjust the maximum number of students who are able to enroll for a given examination. 
8. The teacher will repeat the steps 4, 5 and 6 to mark all the exam dates. 
9. The teacher confirms the exam creation 
    1. The system logs into the database all the provided information about the exam
    2. The system reserves the rooms for the given date and time permanently 
    3. If the exam creation was successful the system sends an email notification to all the students enrolled in the course.
    4. If something went wrong during the exam creation the teacher is notified immediately				
10. The teacher receives a notification about whether the exam creation was successful or they need to adjust some of the provided information.

**Enroll to an exam (MVP) - Feature Breakdown**



1. The student asks the system to enroll for an exam.
    1. The system shows the main student dashboard for the user
2. The system shows the subjects the student is enrolled in.
    1. The system queries the database for the subjects the student is enrolled in.
    2. The system visualizes the interface on which the student can select the desired subject.
3. The student selects the desired subject.
4. The system shows the possible exams the student can apply for, with the corresponding number of places left.
    1. The system asks the database for the available exam dates and times for the selected subject, and all the other data that is associated with them - date, time, building, room, places left, special mentions.
    2. The system proceeds to show an interface to the student to select the preferred option, with all associated data visible.
5. The student selects the desired exam date
6. The system checks whether there is an overlap with the student’s already planned exams (optional - give a warning maybe?)
    1. The system asks the database for other exams the student is already enrolled in.
    2. If there is an overlap in date and time, a warning is shown to the user, who can proceed otherwise
7. The student confirms the selection.
    1. The system checks the number of available places again.
    2. If there are no spaces left, then the student gets put on a waiting list.
        1. The system checks which exam dates were full at the time of the reservation.
        2. If any of these get free places, the student gets a notification.
    3. If there are, the student gets applied to the exam.
        1. The system adds a new instance of an exam with the selected date and time to the student’s set of exams.
        2. The system adds the student’s identity to the array of participating students.
8. The system shows a notification confirming the success of the enrollment.

**Grade exam (MVP) - Feature Breakdown**



1. The teacher asks the system to be able to grade the students.
    1. The system asks a database for the exams that belong to the teacher and have already taken place, and the students that registered for each exam.
    2. The system provides an interface, where the teacher can look up, and be able to select one of the exams.
2. The teacher looks up the subject the exam was taken from.
    1. The system provides an interface where all of the students that registered for the exam are shown, and their grade can be registered.
3. The teacher registers the mark in the system for every student. The grade is provided as a number between 1 and 4
    1. The system shows the mark on the interface, and should store that data, but until it's not confirmed, it’s not sent to the database.
4. The teacher confirms the grades.
    1. The system registers the results of all the students to the database. 
    2. It also marks whether the student failed, or passed a subject, which is important for checking prerequisites when registering for a subject.
5. The system sends a notification to the student about the result of the exam.
    1. The system should look up the students email address, and should be able to send an email to all of them that states the result.

**Manage list of enrolled students (MVP) - Feature Breakdown**



1. The teacher selects one of their subjects.
    1. The system fetches from the database the teacher’s subjects.
    2. The teacher selects a subject.
2. The teacher asks the system to show enrolled students.
    1. The system loads all the enrolled students from the database.
3. The teacher checks the enrollment requests/ students on the waiting list.
    1. If a student is eligible to take the exam the teacher approves their request, otherwise not.
    2. The system sends a notification to the student about the status of their request.
4. The system enables the teacher to remove students.
    1. The teacher requests the modification.
    2. The system removes that student.
    3. The system sends a notification to the student and a confirmation of action to the teacher.
5. The system enables the teacher to add/invite students.
    1. The teacher accesses the database of the students taking that subject.
    2. The teacher can select a student and invite it to the exam.
    3. The system notes the changes.
    4. Both the student and the teacher get notification/confirmation.
6. The teacher can extend the number of places for an exam.
    1. The teacher requests a modification.
    2. The system modifies the number of places.
    3. The teacher gets a confirmation message.
    4. The system sends notification about the modification to all enrolled members.
