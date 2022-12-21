-- Schema teachers_portal
CREATE SCHEMA IF NOT EXISTS `teachers_portal` DEFAULT CHARACTER SET utf8 ;
USE `teachers_portal` ;
-- Table `teachers_portal`.`students`
CREATE TABLE IF NOT EXISTS `teachers_portal`.`students` (
  `studentId` INT NOT NULL AUTO_INCREMENT,
  `studentName` VARCHAR(45) NOT NULL,
  `enrolledInCourseID` INT NULL,
  `grade` FLOAT NOT NULL,
  PRIMARY KEY (`studentId`))
ENGINE = InnoDB;
-- Table `teachers_portal`.`courses`
CREATE TABLE IF NOT EXISTS `teachers_portal`.`courses` (
  `courseId` INT NOT NULL AUTO_INCREMENT,
  `courseName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`courseId`),
  UNIQUE INDEX `courseId_UNIQUE` (`courseId` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO STUDENTS VALUE('1','Maria Jozef', '1', '90');
INSERT INTO STUDENTS VALUE('2','Linda Jones','2', '89');
INSERT INTO STUDENTS VALUE('3','John McGrail','1', '98');
INSERT INTO STUDENTS VALUE('4','Patty Luna','2','78');

INSERT INTO Courses VALUES('1','Database Design');
INSERT INTO Courses VALUES('2','Calculus');
INSERT INTO Courses VALUES('3','Physics I');

DELIMITER &&  
CREATE PROCEDURE studentsWithGrade() 
BEGIN  
SELECT * FROM   students
LEFT JOIN courses
ON enrolledInCourseID = courseID;   
END &&  
DELIMITER ;

CALL studentsWithGrade ();  
