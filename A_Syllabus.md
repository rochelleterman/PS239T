# PS239T: An Introduction To Computational Tools And Techniques For Social Research

Professor Laura Stoker

GSI Rachel Bernhard

Fall 2016

Final(ish) Syllabus

##1. Course Description

This course will provide graduate students the critical technical skills necessary to conduct research in computational social science and digital humanities, introducing them to the basic computer literacy, programming skills, and application knowledge that students need to be successful in further methods work. This course is not an introduction to statistics, computer science, or specialized social science / digital humanities methods. Rather, it is meant as a springboard for students to further their training once the course is finished, whether through campus workshops (e.g. D-Lab workshops), online courses, traditional classrooms, or independent learning.

####Objectives

By the end of the course, students should be able to:

* Understand basic programming terminologies, structures, and conventions
* Navigate and operate effectively in a UNIX environment
* Master basic Git and GitHub workflows
* Write, execute, and debug R code for assignments involving statistical analysis
* Write, execute, and debug Python code for assignments involving data collection and manipulation, as well as other computing tasks
* Collect data through a variety of means, including webscraping and APIs.
* Be familiar with the concepts and tools of a variety of computational social science / digital humanities applications
* Be familiar with the basic guidelines around reproducible research, good scientific computing practices, and ethics/privacy/legal quandaries. 
* Learn independently and train themselves in a variety of computational applications and tasks through online documentation

####Structure

The course is divided into three main sections: skills, applications, and community engagement. The “skills” portion will introduce students to basic computer literacy, terminologies, and programming languages. Specifically, students will learn the basics in the Unix Shell (i.e. Bash), R, Python, and Git. We chose these tools because they are considered by many to be the “core curriculum” for social scientists and humanists who wish to integrate computing into their scholarship. 

The second part of the course provides students the opportunity to use the skills they learned in part 1 towards practical applications. While the realm of possibilities is too great to cover in a single course, we expect to introduce students to automated text analysis, geospatial analysis, webscraping, data collection via APIs, and qualitative data analysis software. Each week will introduce students to a new application. Because of time constraints, we cannot offer a robust training in any one application. Rather, the goal is to introduce the students to a medley of common applications so that they can discover which avenue to pursue in their own research, and what such training would entail.

The third section on community engagement will introduce topics such as ethics and privacy, best practices of reproducible research, scholarly communication and collaboration, and how to further one’s research using UC Berkeley campus resources. 

##2. Logistics

####Personnel

The course is taught by Rachel Bernhard (rbernhard@berkeley.edu) and Laura Stoker (stoker@berkeley.edu). Email Rachel first.

####Time 

Lecture: Monday 2-3P

Section/Lab: Wednesday 4-6P

####Location

791 Barrows

### Office Hours

TBD (probably Wednesday 2:30-4P, GSI Office)

####bCourses

We will use bCourses for communication (announcements and questions) and turning in assignments. You should ask questions about class material and assignments through the bcourse website so that everyone can benefit from the discussion. We encourage you to respond to each other’s questions as well. Questions of a personal nature can be emailed to us directly.

####GitHub

All course materials will be posted on Github at https://github.com/rochelleterman/PS239T, including class notes, code demonstrations, sample data, and assignments. Students are encouraged to submit pull requests to this repository, for example if they find a particularly helpful resource that would aid other students. Students are required to use GitHub for their final projects, which will be publically available, unless they have special considerations (e.g. proprietary data). 

####Accessibility

This class is committed to creating an environment in which everyone can participate, regardless of background, discipline, or disability. If you have a particular concern, please come to us as soon as possible so that we can make special arrangements.

##3. Course Requirements and Grades

####Final Grades

This is a graded class based on the following:
* Completion of assigned homework (50%)
* Participation (25%)
* Final project (25%)

####Assignments

Assignments will be assigned at the end of every session. They will be due at the start of the following class unless otherwise noted. The assignments will be frequent but each of them should be fairly short. 

You are encouraged to work in groups, but the work you turn in must be your own. Group submission of homework, or turning in copies of the same code or output, is not acceptable. Remember, the only way you actually learn how to write code is to write code.

Unless otherwise specified, assignments should be turned in as **pdf documents** via the bCourses site. 

####Class Participation

The class participation portion of the grade can be satisfied in one or more of the following ways:

- attending the lecture and section
- asking and answering questions in class
- contributing to class discussion through the bCourse site, and/or
- collaborating with the campus computing community, either by attending a D-Lab or BIDS workshop, submitting a pull request to a campus github repository (including the class repository), answering a question on StackExchange, or other involvement in the social computing / digital humanities community.

Because we will be using laptops every class, the temptation to attend to other things during slow moments will be high. While you may choose to do so, I do request that you think of your laptop screen as in the public domain for the duration of classtime: please do not load anything that will distract your classmates or is otherwise inappropriate to a classroom setting.  

####Final Project

The final project consists of using the tools we learned in class on your own data of interest. First- and second-year students in the political science department are encouraged to use this as an opportunity to gather data to be used for other courses or the second-year thesis. Students are required to write a short proposal by November 12 (no more than 2 paragraphs) in order to get approval and feedback from the instructors. 

On December 7 we will have a **lightning talk session** where students can present their projects in a maximum 5 minute talk. Since there is no expectation of a formal paper, you should select a project that is completable by the end of the term. In other words, submitting a research design for your future dissertation that will use skills from the class but collects no data is not acceptable, but completing a viably small portion of a study or thesis is. 

##4. Class Activities and Materials

####Activities and Guest Speakers

Classes will follow a “workshop” style, combining lecture and lab formats. We envision the class to be as interactive / hands on as possible, with students programming every session. During the “skills” parts of the class, we will be learning how to program in Unix, Python, and R by following a set of course notes with demonstrations. 

During the “applications” sections, we will be following a similar structure with the possibility of guest speakers leading the class on specific tools. These guest speakers will be members of campus who are experts in the respective tool that they teaching. 

####Section

The Wednesday "lab" section will generally be a less formal session dedicated to helping students with materials from lecture and homework, though some weeks (as with Labor Day) it will substitute for lecture. It will be mostly student led, so come with questions. If there are no questions, the lab turns into a "hackathon" where groups can work on the assignments together. It is not required but *strongly* encouraged, especially if you are having difficulty with the assignments. Attending office hours is not a substitute for attending section. 

####Computer Requirements

The software needed for the course is as follows:

* Access to the UNIX command line (e.g., a Mac laptop, a Bash wrapper on Windows)
* Git
* R and RStudio (latest versions)
* A scientific Python distribution including Python, iPython and iPython notebooks, and major packages.

This requires a computer that can handle all this software. Almost any Mac will do the job. Most Windows machines are fine too if they have enough space and memory.

See [Install.md](Install.md) for more information. We will be having an **InstallFest** on August 24 for those students experiencing difficulties downloading and installing the requisite software.

####Books and Other Resources

There are no official textbooks for this class. There is a list of topic-specific tutorials and resources in the GitHub repo in the document `resources.md`. If you find good online resources, you are encouraged to add to the document. 

##5. Curriculum Outline / Schedule

 1. **Aug 24** - Introduction and InstallFest
 2. **Aug 29** - Unix, Bash, and Basic Git **[No section Aug 31 due to APSA]**
 3. **Sept 7** - Python 1 (Basics) **[No lecture Sept 3 due to Labor Day]**
 4. **Sept 12 / Sept 14** - Python 2 (Intermediate)
 5. **Sept 19 / Sept 21** - Python 3 (Advanced)
 6. **Sept 26 / Sept 28** - Python 4 (Information Retrieval)
 7. **Oct 3 / Oct 5** - APIs
 8. **Oct 10 / Oct 12** - Web Scraping
 9. **Oct 17 / Oct 19** - R 1 (Basics)
10. **Oct 24 / Oct 26** - R 2 (Data Analysis)
11. **Oct 31 / Nov 2** - R 3 (Visualization)
12. **Nov 7 / Nov 9** - Text Analysis (Guest Speaker)
13. **Nov 14 / Nov 16** - Qualtrics and MTurk
14. **Nov 21** - GeoSpatial Analysis (Guest Speaker) **[No section Nov 23 due to Thanksgiving]**
15. **Nov 28 / Nov 30** - Git and Wrap-up
16. **Dec 7** - Final Project Presentations **[Note that this is during reading week, not finals]**
