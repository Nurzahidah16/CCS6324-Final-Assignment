-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2026 at 05:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`) VALUES
(1, 'Admin01', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `stu_email` varchar(100) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `attendance_percentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `stu_email`, `course_id`, `attendance_percentage`) VALUES
(1, 'zulaikhabeewan@gmail.com', 10, 92),
(2, 'zulaikhabeewan@gmail.com', 9, 88),
(3, 'zulaikhabeewan@gmail.com', 11, 95);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` text NOT NULL,
  `course_desc` text NOT NULL,
  `course_author` varchar(255) NOT NULL,
  `course_img` text NOT NULL,
  `course_duration` text NOT NULL,
  `course_price` int(11) NOT NULL,
  `course_original_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_desc`, `course_author`, `course_img`, `course_duration`, `course_price`, `course_original_price`) VALUES
(1, 'Introduction to Programming', 'Learn programming fundamentals using Python including variables, loops and functions.', 'Dr Sarah Lim', '../image/courseimg/programming.png', '12 Weeks', 350, 500),
(2, 'Database Systems', 'Understand SQL, database design, normalization and relational database management.', 'Mr Daniel Lee', '../image/courseimg/database.jpg', '10 Weeks', 400, 550),
(3, 'Web Application Development', 'Build responsive web applications using HTML, CSS, JavaScript and PHP.', 'Ms Nur Aisyah', '../image/courseimg/Web.jpg', '14 Weeks', 450, 650),
(4, 'Cyber Security Fundamentals', 'Learn networking security, OWASP vulnerabilities and secure coding practices.', 'Mr Amir Hakim', '../image/courseimg/cybersecurity.jpeg', '12 Weeks', 500, 700),
(5, 'Artificial Intelligence Basics', 'Introduction to machine learning concepts and AI applications.', 'Dr Melissa Wong', '../image/courseimg/ai.jpg', '10 Weeks', 480, 650),
(6, 'Mobile Application Development', 'Develop Android applications and understand mobile UI principles.', 'Mr Jason Tan', '../image/courseimg/mobileApp.png', '12 Weeks', 450, 600),
(7, 'Data Structures and Algorithms', 'Study sorting, searching and problem-solving algorithms.', 'Dr Farhan Ismail', '../image/courseimg/dataStructure.jpg', '14 Weeks', 500, 700),
(8, 'Cloud Computing Essentials', 'Learn cloud deployment, virtualization and infrastructure concepts.', 'Ms Alicia Chong', '../image/courseimg/cloud.jpeg', '8 Weeks', 380, 550);

-- --------------------------------------------------------

--
-- Table structure for table `courseorder`
--

CREATE TABLE `courseorder` (
  `co_id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `stu_email` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `respmsg` text NOT NULL,
  `amount` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `courseorder`
--

INSERT INTO `courseorder` (`co_id`, `order_id`, `stu_email`, `course_id`, `status`, `respmsg`, `amount`, `order_date`) VALUES
(11, 'ORDS8854384', 'zulaikhabeewan@gmail.com', 8, '', '', 1655, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `f_id` int(11) NOT NULL,
  `f_content` text NOT NULL,
  `stu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`f_id`, `f_content`, `stu_id`) VALUES
(1, 'The course materials were clear and easy to understand. The exercises helped improve my programming skills.', 171),
(2, 'The learning platform is user friendly and course enrollment process was smooth.', 172),
(3, 'Cyber Security Fundamentals was very informative. I learned practical security concepts.', 173),
(4, 'The instructors explained concepts clearly and responded quickly to questions.', 174),
(5, 'The search feature made it easy to browse courses that matched my interests.', 180),
(6, 'The learning dashboard and attendance tracking helped me monitor my progress effectively.', 182);

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int(11) NOT NULL,
  `lesson_name` text NOT NULL,
  `lesson_desc` text NOT NULL,
  `lesson_link` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `course_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`lesson_id`, `lesson_name`, `lesson_desc`, `lesson_link`, `course_id`, `course_name`) VALUES
(1, 'Programming Basics', 'Introduction to variables, data types and programming concepts', '../lessonvid/testvideo1.mp4', 1, 'Introduction to Programming'),
(2, 'Control Structures', 'Learn loops and conditional statements', '../lessonvid/testvideo2.mp4', 1, 'Introduction to Programming'),
(3, 'Functions and Modules', 'Understand reusable code and functions', '../lessonvid/testvideo1.mp4', 1, 'Introduction to Programming'),
(4, 'Database Fundamentals', 'Introduction to relational databases', '../lessonvid/testvideo2.mp4', 2, 'Database Systems'),
(5, 'SQL Queries', 'Learn SELECT, INSERT, UPDATE and DELETE operations', '../lessonvid/testvideo1.mp4', 2, 'Database Systems'),
(6, 'Normalization', 'Understand database normalization techniques', '../lessonvid/testvideo2.mp4', 2, 'Database Systems'),
(7, 'HTML and CSS', 'Build webpage layouts and styling', '../lessonvid/testvideo1.mp4', 3, 'Web Application Development'),
(8, 'PHP Backend Development', 'Develop backend applications using PHP', '../lessonvid/testvideo2.mp4', 3, 'Web Application Development'),
(9, 'Cyber Security Threats', 'Understand common cyber attacks', '../lessonvid/testvideo1.mp4', 4, 'Cyber Security Fundamentals'),
(10, 'OWASP Top 10', 'Study common web vulnerabilities', '../lessonvid/testvideo2.mp4', 4, 'Cyber Security Fundamentals'),
(11, 'Machine Learning Basics', 'Introduction to AI and machine learning', '../lessonvid/testvideo1.mp4', 5, 'Artificial Intelligence Basics'),
(12, 'Android Fundamentals', 'Introduction to Android mobile development', '../lessonvid/testvideo2.mp4', 6, 'Mobile Application Development'),
(13, 'Sorting Algorithms', 'Learn bubble sort and merge sort algorithms', '../lessonvid/testvideo1.mp4', 7, 'Data Structures and Algorithms'),
(14, 'Cloud Infrastructure', 'Understand virtualization and cloud computing', '../lessonvid/testvideo2.mp4', 8, 'Cloud Computing Essentials');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL,
  `parent_name` varchar(100) DEFAULT NULL,
  `parent_email` varchar(100) DEFAULT NULL,
  `parent_pass` varchar(100) DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`parent_id`, `parent_name`, `parent_email`, `parent_pass`, `student_email`) VALUES
(2, 'Ali Parent', 'zulaikhaparent@test.com', '123456', 'zulaikhabeewan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL,
  `stu_name` varchar(255) NOT NULL,
  `stu_email` varchar(255) NOT NULL,
  `stu_pass` varchar(255) NOT NULL,
  `stu_occ` varchar(255) NOT NULL,
  `stu_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stu_id`, `stu_name`, `stu_email`, `stu_pass`, `stu_occ`, `stu_img`) VALUES
(171, 'Ahmad Firdaus', 'firdaus@student.edu', '123456', 'Computer Science Student', '../image/stu/malestudent1.jpg'),
(172, 'Nur Aisyah', 'aisyah@student.edu', '123456', 'Software Engineering Student', '../image/stu/femalestudent1.jpg'),
(173, 'Daniel Lee', 'daniel@student.edu', '123456', 'Information Technology Student', '../image/stu/malestudent2.jpeg'),
(174, 'Siti Nurhaliza', 'siti@student.edu', '123456', 'Cyber Security Student', '../image/stu/femalestudent2.jpg'),
(176, 'Muhammad Haziq', 'haziq@student.edu', '123456', 'Computer Science Student', '../image/stu/malestudent3.jpeg'),
(180, 'Alicia Wong', 'alicia@student.edu', '123456', 'Software Engineering Student', '../image/stu/femalestudent3.jpeg'),
(182, 'Zarul Hakim', 'zarul@student.edu', '123456', 'Information Systems Student', '../image/stu/malestudent4.jpg'),
(183, ' Zulaikha', 'zulaikhabeewan@gmail.com', 'Zulaikha2001.', ' Cybersecurity', '../image/stu/femalestudent4.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `courseorder`
--
ALTER TABLE `courseorder`
  ADD PRIMARY KEY (`co_id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `courseorder`
--
ALTER TABLE `courseorder`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
