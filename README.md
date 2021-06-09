### Project Name
Transfer Equivalency

### Project Theme
This project is an app meant to help students and institutions search for course and credit transfer equivalency between institutions.

### Project Vertical
Education

### Hub Group Link
https://powerofus.force.com/s/group/0F91E000000brOzSAI/transfer-equivalency

### Project Team
Help us give you the thanks you deserve and ensure future contributors know who to contact if they have questions! Please ensure that all contributing members of the team are included.
* Team Leader(s): Kathy Lueckeman (https://github.com/Kathy-Lueckeman)

From past sprints:
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

### Current 

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
