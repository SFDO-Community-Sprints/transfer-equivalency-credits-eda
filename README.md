### Project Name
Transfer Equivalency

### Project Theme
This project is an solution meant to help students and institutions search for course and credit transfer equivalency between institutions.

### Project Vertical
Education

### Hub Group Link
https://powerofus.force.com/s/group/0F91E000000brOzSAI/transfer-equivalency

### Current 

**May 2022 Sprint**

Team Leaders:
Kathy Lueckeman, Olivet Nazarene University (https://github.com/Kathy-Lueckeman)
Riley Schill, Go Stratus (https://github.com/Riley-Schill)

Team Members:

Rebecca Ovall, Western Governors University (https://github.com/rebeccaovall1)
Stephanie Sisson, EDACS, (https://github.com/EDACS)
Amy Strojkovich, Herzing University (https://github.com/ASTOJK)

Sprint Activities:

The team edited custom objects and fields to align the configuration with Salesforce.org object names from Student Success Hub. Two new ERDs were created. The team also used the proof-of-concept Screen Flow from the last sprint to draft a UI that can be used by students and staff to detail transcripts. It looks up the Account object to find the school, then looks up the Course Equivalency object to find the course at that school, and displays the equivalent course at your school. If no Account is found, a holding record is created. If no Course is found, a new Course Equivalency record is created and a Case is created for the Registrar's office to do an evaluation to determine whether or not the course is transferrable. The Screen Flow process map documents this process.

Next Steps:

1. Update sample data: Remove the Registrar Office record to which the Course object's Department field looks up to, so that it looks up directly to the Educational Institution Account.
2. Create a second version that will work with Student Success Hub objects.
3. Modify the UI to use the custom Course Equivalency Rules object.


**From past sprints:**

**June 2021 Sprint**

### Project Team
Help us give you the thanks you deserve and ensure future contributors know who to contact if they have questions! Please ensure that all contributing members of the team are included.
* Team Leader(s): 
Peter Bernardi, Elevate Actual; 
Kathy Lueckeman, Olivet Nazarene University (https://github.com/Kathy-Lueckeman); 
Riley Schill, Go Stratus

* June 2021 AMER Team Members
Matthew Blanski, Salesforce.org; 
Andy Corbus, Olivet Nazarene University; 
Emma Hutchinson, Coastal Cloud; 
Emily Rector, Traction on Demand; 
Steph Sisson, EDACS; 
Corey Snow, Salsforce.org; 

The team adopted the vision from previous sprints. It updated the ERD from the Detroit sprint to reflect the new objects added at but not documented during the Philly sprint.

The team proposed removing the relationship from Course Transfer to Program Plan, since it's related to Course and the Philly. sprint introduced an object related to course to store rules associated with the course (e.g., program-specific rules). 

The team also proposed updating the solution to include Affiliations, Application and Education History.

* Next Steps
The team should draw the new ERD and replace the one in the Rsources link.
The team should configure the relationships with the existing EDA objects proposed by this projedt team.
The team should refresh the data in the repository to include data for these new objects.

July 2019 Sprint

* Team Leader(s): [Eric Kenney](https://github.com/IAmEricKenney)
* GitHub Scribe(s): 
* List of all Contributors: [Starley Flynn](https://github.com/StarleyFlynn), [Kim Schaefges](https://github.com/kschaefges), [Corey Snow](https://github.com/csnow-storm), [Marc Beaulieu](https://github.com/SoundSkulptor), [Jace Bryan](https://github.com/jacebryan)

### Past Project Team

Full Name       | Github Username                                      | Sprint(s)               
------------    | -------------                                        | -------------   
Ethan Savage    | [Ejsavage](https://github.com/Ejsavage)              | Detroit 2019
Tiago Ruivo     | [tiagoruivo](https://github.com/tiagoruivo)          | Detroit 2019
Robert Watson   | [robertbwatson](https://github.com/robertbwatson)    | Detroit 2019
Margaret Fako   | [margaretfako](https://github.com/margaretfako)      | Detroit 2019
Ryan Klein      | [kleinryan](https://github.com/kleinryan)            | Detroit 2019
Zach Field      | [P0und-cake](https://github.com/P0und-cake)          | Detroit 2019
Scott Lieberman | [ScottLiebermnn](https://github.com/ScottLiebermn)   | Detroit 2019
Corey Rittvo    | [coreyrittvo](https://github.com/coreyrittvo)        | Detroit 2019
Dave Lea        | [Dave-SFDO](https://github.com/Dave-SFDO)            | Detroit 2019
Haley Gould     | [haleymgould](https://github.com/haleymgould)        | Detroit 2019
Victoria Tang   | [vtangToD](https://github.com/vtangToD)              | Detroit 2019
Kathy Zimmerman | [KathyZimmerman](https://github.com/KathyZimmerman)  | Philadelphia 2019
Matthew Blanski | [MatthewBlanski](https://github.com/MatthewBlanski)  | Philadelphia 2019

### Project Vision (Please make this your first task as a team)

When students want to transfer from one institution to another, they want to know how their course history will transfer to equivalent course credit at the desired institution. This project creates a schema to capture the information about transfer equivalency: details about the course at the originating institution, details about the course at the destination institution, how many transfer credits a course is worth, a history of course transfer information, and other course details.

### Project Resources
Documentation can be found in the repository [wiki](https://github.com/SFDO-Community-Sprints/transfer-equivalency/wiki):

* [Welcome to Transfer Equivalency](https://github.com/SFDO-Community-Sprints/transfer-equivalency/wiki/Welcome-to-Transfer-Equivalency)
* [Setup Transfer Equivalency](https://github.com/SFDO-Community-Sprints/transfer-equivalency/wiki/Setup-Transfer-Equivalency)
* [Use Cases](https://github.com/SFDO-Community-Sprints/transfer-equivalency/wiki/Use-Cases)
* [Entity Relationship Diagram](https://github.com/SFDO-Community-Sprints/transfer-equivalency/wiki/Entity-Relationship-Diagram)
* [Requirements Mapping & Process Flows](https://github.com/SFDO-Community-Sprints/transfer-equivalency/wiki/Requirements-Mapping-&-Process-Flows)

### Past
Project Team Accomplishments
What did the Project Team get done during the Sprint?
March 2020: Updated the schema from July 2019 using my EDA objects. Included Application, Course with new recordtype (External), as well as Contact and Account (Education Institution record type). Built 3 custom objects: Transcript, Transcript Course, and Course Equivalency Rule.
Transcript is a parent for Transcript Course. Transcript Course has a double look up to Course. Course Equivalency Rule is the object that matches an external course with the approved internal course.

### Project Team Accomplishments (YTD)
* In July 2019, the project team created a schema, some record types, and an outline of the setup guide.

### Future Contributions (AKA what were you unable to finish at the Sprint)
See the [Issues](https://github.com/SFDO-Community-Sprints/transfer-equivalency/issues) tab for open enhancements. Feel free to add additional suggestions and use cases!

### Roadmap
Students will be able to see how their courses transfer to the destination institution. This database of transfer equivalencies is exposed to students so students can "window shop" to see how their existing credits could transfer to different institutions.
