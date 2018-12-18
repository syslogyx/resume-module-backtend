-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 18, 2018 at 12:58 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-3+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_rec_bakup`
--

-- --------------------------------------------------------

--
-- Table structure for table `basic_screening_questions`
--

CREATE TABLE `basic_screening_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `stream_id` int(10) UNSIGNED DEFAULT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_screening_result`
--

CREATE TABLE `basic_screening_result` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refereral_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_of_interview` double(8,2) DEFAULT NULL,
  `observation` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_details`
--

CREATE TABLE `candidate_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opprtunity_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indian_languages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foreign_languages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corresponding_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `pan_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objective` text COLLATE utf8mb4_unicode_ci,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_experience` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ctc` double(8,2) DEFAULT NULL,
  `job_description_id` int(10) UNSIGNED DEFAULT NULL,
  `unique_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidate_details`
--

INSERT INTO `candidate_details` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `opprtunity_for`, `gender`, `marital_status`, `indian_languages`, `foreign_languages`, `currency_unit`, `mobile_no`, `corresponding_address`, `permanent_address`, `date_of_birth`, `pan_number`, `passport`, `objective`, `summary`, `status`, `timestamp`, `total_experience`, `ctc`, `job_description_id`, `unique_token`, `created_at`, `updated_at`) VALUES
(48, 'Mamta', '', 'Lawrence', 'mamtalawrence@gmail.com', 'Experience', 'Female', 'Unmarried', 'NA', 'NA', 'Lac', '9922303640', 'H No. 206, Sahkar Nagar, Nagpur 440025, MH, India', 'H No. 206, Sahkar Nagar, Nagpur 440025, MH, India', '1986-08-02', 'AETPL1904R', 'H3316447', '["NA"]', '["Associate Consultant with 6+ years of experience in the IT Industry.","Proficient with all phases of Software Development Life Cycle with concentration on design, development and implementation of various languages and Capable of resolving high complexity bugs.","In-depth knowledge of Android (APP, SDK and Library), Core Java, SQLite","Basic knowledge in AngularJS, Objective C, HTML, CSS.","Client site experience of requirement gathering, creating technical design docs, developing the apps, solving high complexity bugs.","Working experience in SCRUM, Waterfall and Agile Software Development Methodology.","Good communication skills, verbal as well as written coupled with good presentation skills with the ability to perform as per expectations."]', 'Active', '1540998321', '6.0', 7.34, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-10-31 15:05:21', '2018-10-31 15:05:21'),
(49, 'Palash ', '', 'Kohli', 'palashkohli@hotmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9765169473', 'G-5 utkarsh uttra apartment,\n New colony sadar\n Nagpur (440001)', 'G-5 utkarsh uttra apartment,\n New colony sadar\n Nagpur (440001)', '1992-12-19', 'DEXPK5332F', 'NA', '["To succeed in an environment of growth and self-development and help me achieve personal as well as organizational goals."]', '["Currently working as an Android Developer at Dolphin RFID Pvt. Ltd from Feb 2016."]', 'Active', '1540998541', '2.9', 6.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-10-31 15:09:01', '2018-10-31 15:09:01'),
(50, 'Vaibhav', '', 'Yerawar', 'vaibhav.yerawar@yahoo.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9096820845', 'S/o. Mr. Deepak Yerawar, Madhuban Society,\nHouse No. 66, Dhamangaon Road,\nYavatmal – 445001', 'S/o. Mr. Deepak Yerawar, Madhuban Society,\nHouse No. 66, Dhamangaon Road,\nYavatmal – 445001', '1986-08-02', 'AFSPY6958G', 'H3316447', '["To work in an intellectually challenging work environment, which would provide scope to put to use my skills and energy for the progress of the organization I work for, as well as maintain highest quality of work standard."]', '["Currently working as a System Analyst in Cybage Software with 6.5 years of experience in mobile application development."]', 'Active', '1540999256', '6.5', 14.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-10-31 15:20:56', '2018-10-31 15:20:56'),
(52, 'Nilesh', '', 'Manker', 'nileshmanker1990@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '08698998731', 'Flat No.Q-603, Heliconia-1, Magarpatta City Pune.', 'Flat No.Q-603, Heliconia-1, Magarpatta City Pune.', '1990-04-23', 'BTBPM5489N', 'M8942217', '["Scaling new heights of success and leaving a mark of excellence in ‘Digital and Mobile Engineering’ &‘Cloud Computing’."]', '["A focused and hardworking professional with 6.2 years of experience currently working with Infosys Technologies, India in Digital Experience Department as Android Technology Analyst Worked on Agile Methodology which resulted in reaching market faster by monthly releases, minimal requirement gaps by time to time show case and continuous contact with Product Owner. Expertise to Android Application Development from starting to deployment on app store. Skilled in Android App Development and Core Java, implemented reusable components to reduce development efforts, cost and time for fast product development and delivery. Maintained Code Quality by analyzing Android Lint Reports and using third part libraries like SonarQube. Proficient in Tracking development progress and Change Management through JIRA, used CICD (Continuous Integration and Continuous Development) Pipeline (Jenkins) for fast build process and distribution. Strong understanding of analyzing performance and application behavior by implementing analyzing tools like Crashalatics, Google Analytics Tool (FCM), Adobe (Network Performance), New Relic (App CrashMonitoring) Good understanding of SDLC, IT Industry	Security Threats and vulnerabilities, Prod Deployment and Support. Skilled with capability to analyses and interpret unique problems, with a combination of positive attitude and logical thinking to find the right solutions An effective communicator and team  player with excellent interpersonal, negotiation and decision-making abilities. "]', 'Active', '1541001978', '6.2', 7.60, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-10-31 16:06:18', '2018-10-31 16:06:18'),
(53, 'Harshal', 'D', 'Kamble', 'harshalkamble2002@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '09960507286', 'Flat No. 01,Divya Appartment,Borate wasti ,Kharadi\nPune - 411014', '871, Dr. Ambedkar Marg, Near Chandramani Buddha Pali\nVihar, Buddha Nagar, Nagpur-440017', '1988-11-13', 'AAADE1234Z', 'PA132456', '["To work with my full attitude towards the objectives of the organization to bottom line with a sense of dedication and with my best knowledge."]', '["Not Mentioned"]', 'Active', '1541072620', '7.0', 16.00, 2, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-01 11:43:40', '2018-11-01 11:43:40'),
(66, 'VIJAY', '', 'PATLE', 'vpatle95@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9752023820', 'Sai Krupa Apartment, Maitree Nagar,Beltarodi,Nagpur ,Maharashtra441108', 'Not Mentioned', '1987-10-02', 'CQYPP6659N', 'NA', '["Not Mentioned"]', '["4.5 years hands on experience in Android Technologies in developing Mobile application.","Worked on all the SDLC phases including analysis, design, development, testing and support.","Write unit test cases before develop module.","Excellent communication, collaboration & team skills.","Proficiency at grasping new technical concepts quickly."Excellent exposure to Status reporting, Client interaction, written communication skills." ," An experienced team player with excellent communication and interpersonal skills who has the ability to work independently."]', 'Active', '1541415751', '4.10', 7.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-05 11:02:31', '2018-11-05 11:02:31'),
(67, 'Ajay', '', 'Harwani', 'a.harwani4289@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '8956891810', '223/A, Jaripatka, Nagpur', '223/A, Jaripatka, Nagpur', '1989-02-04', 'AGLPH2302R', 'NA', '["Not Mentioned"]', '["Experience of 66 months in Android App Development (GlobalLogic) using Java language and 6 months in Databases (Infocepts)","Experience in Android Components: Activity, Services, Broadcast Receiver, Content Providers, Database such as SQLite, Room DB","Actively worked and involved in Agile Process, requirement gathering, sprint planning, estimation, retrospection etc","Well versed with Kotlin language and trending libraries like Fabric, Dagger2, Glide, Retrofit, okhttp, etc","Consistently discover, evaluate, develop, fixing and improving performance to maximize development efficiency","Hands on with various IDE like Eclipse, Android Studio, Intellij, and have working knowledge required for gradle","Experience with Git, SVN, Charles Proxy tool, JIRA, Confluence, Hockey, Jenkins, SonarQube","Hands on on various design patterns like Singleton, Command , Factory, builder, Memento, Strategic patterns","Poses beginner level skills on React Native and IBM Bluemix","Strong Optimization and debugging skills","Possess excellent Communication and Analytical skills","Mentored training sessions for Fresher Batches","Used Linux and Windows OS for Android Development"]', 'Active', '1541417535', '6.0', 8.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-05 11:32:16', '2018-11-05 11:32:16'),
(70, 'Pavan', '', 'Gulhane', 'gulhane24pvn@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9036453942', 'Manewada, Nagpur, Maharashtra, 444708', 'Manewada, Nagpur, Maharashtra, 444708', '1993-06-24', 'BQPPG7515L', 'NA', '["Dedicated and disciplined Software professional 3 years of experience, seeking the position of Software Development Engineer, to contribute to the company\'s growth and in turn ensuring personal growth within the organization."]', '["3 years of experience in Development of Web and enterprises application using JAVA and J2EE Technologies.","Working as Software Development Backend Engg. with Health & Glow, Bangalore.","Hands on experience in Core Java, Servlets, Spring, Hibernate, Web Services.","Have strong understanding of Algorithms and Data-Structures.","Ability to develop new applications and creative resolution for complex technical problems.","Extensive experience in writing and tuning complex sub queries, SQL, PL/SQL stored procedures, functions, and triggers.","Ability to communicate with the clients directly and fulfill their requirements.","Cohesive team worker, having strong analytical, problem solving and interpersonal skills.","Having exposure to work on all phases of SDLC from requirement gathering - development - testing - deployment to maintenance."]', 'Active', '1541420831', '3.0', 5.60, 2, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-05 12:27:11', '2018-11-05 12:27:11'),
(72, 'JIteshkumar', '', 'Patle', 'jpatle2308@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9421805134', 'Netaji Colony, Trimurti Nagar, Nagpur-22', 'Netaji Colony, Trimurti Nagar, Nagpur-22', '1991-08-23', 'CTWPP7073B', 'J1234567', '["To gain a dynamic and challenging role in the area in Electronics and Tele-Communication Engg. that will offer me the best opportunity for further development of my abilities, skills and knowledge in an established firm with long term carrier growth possibilities."]', '["A self-motivated Embedded Professional with a career spanning of 2 years of experience. Qualified Engineer in E&TC, currently working as Embedded Engineer (Role: Hardware and Software Developer) in Syslogyx Technologies Pvt. Ltd., Nagpur from June 2016. Possessing good knowledge on Embedded C and Electronics. Involved in various phases of hardware and software engineering viz. Analyzing Requirements specifications, Hardware development, Coding / Build / Compilation, Integration, Module testing and System testing. Good understanding of embedded system and real time system concept and software Development cycle. Knowledge of development tools such as Atmel Studio, Eclipse, Code Block, Code Composer Studio, Proteus and Eagle. Flexible to work on different technologies. Ability to meet tight deadlines and work under pressure. Experience in Debugging and testing on Target Controller Board: Atmega2560 (Smart Factory), MSP430G2302 (EITDSDRDO/ TBRL Project). Outstanding analytical ability and grasping power that enables to learn new technology and tools quickly."]', 'Active', '1541522419', '2.5', 3.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-06 16:40:19', '2018-11-06 16:40:19'),
(73, 'Umesh', '', 'Singh', 'umeshsngh182@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9970336697', 'Pnnasay Layout, Nagpur-22', 'Pnnasay Layout, Nagpur-22', '1989-02-20', 'FFNPS3004F', 'U1234567', '["To pursue a career which gives me an opportunity to use my technical skills in the field of Embedded Systems Design and Development and to add value and continuous improvement for the organization where I can apply and integrate my technical skills, knowledge and my working experiences."]', '["Detailed-oriented Embedded System Engineer with over seven years\' experience and a strong technical/coding background that is essential to this role, including C, C++, and Assembly languages."]', 'Active', '1541530288', '7.0', 3.60, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-06 18:51:29', '2018-11-06 18:51:29'),
(74, 'Nikhil', '', 'Muley', 'nikhilmuley7@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9021411447', 'Sahakar Nagar, Nagpur-25', 'Sahakar Nagar, Nagpur-25', '1983-03-07', 'ASJPM2439G', 'N1234567', '["To obtain a embedded system engineer position with an electronics company where my electronics and programming skills together can help in the design and development of Embedded Systems"]', '["Results-oriented Embedded Engineer with more than seven years experience in analysis design development testing and implementation of various embedded systems. Adept at designing and building applications with usability and high performance in mind."]', 'Active', '1541581052', '7.0', 6.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-07 08:57:32', '2018-11-07 08:57:32'),
(76, 'Pravin', '', 'Kosurkar', 'pravinkosurkar@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9049672390', 'Pathan Layout, Trimurti Nagar, Nagpur-440022', 'At post Ajansara Tah. Hinganghat Dist. Wardha-                        442307', '1990-05-15', 'CROPK0788G', 'NA', '["Not Mentioned"]', '["Technically Sophisticated Professional with 5.2 years of experience in Android Application Development.","Currently associated with Ceinsys Tech Ltd. Nagpur, a CMMI dev. 3.0 company.","Good Knowledge in Core Java, Android, Android studio, Gradle, GIT, Device management, Activity Lifecycle, Broadcast Receiver, Content Provider, Services, IPC,  FCM, Payment gateway, Social media API, Sqlite, JSON, GSON, Volley, retrofit, REST API, Soap, Geo fencing, MVVM, Dragger 2, Room, Google map and OSM.","Good Knowledge in Object oriented programming.","Good Knowledge in UI design for Android application.","Good knowledge of CMMI Development, become a CMMI appraisal team member.","Exposure in end-to-end Android Application Development, right from requirement analysis, system study, designing, coding, unit testing and documentation.","Strong analytical and problem solving skills, excellent communication and presentation skills and a good team player."]', 'Active', '1542190386', '5.4', 6.80, 2, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-14 10:13:06', '2018-11-14 10:13:06'),
(77, 'NALLAKUKKALA', '', 'JAYACHANDRA', 'nallakukkalajayachandra@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9700103996', 'Not Mentioned', 'Not Mentioned', '1994-07-01', 'BFKPN4994N', 'NA', '["I want to achieve a remarkable position in my career where I could be recognized as an expert resolving every task assigned to me. To excel in IT industry and possess every goal assigned to me in effective way."]', '["Have 2.3 Years of experience in Embedded Systems with HMI application development on automotive head units."," Hands on Experience in Settings and Multimedia (HMI) application development.","Proficiency in working with Embedded C, C++, Data Structures."," Good in understanding HMI framework and software development cycle.","Good understanding of various tools like JIRA, Visual Studio, SVN."," Good understanding in working Scrum enabled projects."," Having knowledge on Linux Operating System and RTOS concepts."," Good knowledge on GDB debugging in Linux."," Working experience on requirements management application tool DOORS."]', 'Active', '1542284515', '2.3', 3.50, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-15 12:21:55', '2018-11-15 12:21:55'),
(78, 'Harshal', '', 'Borikar', 'borikarharshal@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9028426844', 'Plot No.144, Priyadarshini Nagar,\nB/H NIT Garden, Nagpur-440022', 'Plot No.144, Priyadarshini Nagar,\nB/H NIT Garden, Nagpur-440022', '1993-07-15', 'BHCPB5140C', 'NA', '["To work as an android developer in an organization where I can utilize my skills and knowledge related to mobile development and develops robust applications."]', '["A Software Developer with total 3.6 years of experience of which 2.6 years of experience on Android Mobile Application Development, Application Maintenance & Support."," Worked on Recycler view, Activity, Fragments, Layouts, Retrofit, Volley, Fused API, Picasso,GSON Parsing, Google Map, SQLite database.","Worked on payment gateway integration like CCAvenue, Instamojo."," Worked on social media integration like Facebook, Google and Twitter."," Worked on Google advertisement integration through Google Ad Mod."," Good knowledge of Android Application Development."]', 'Active', '1542435243', '3.6', 2.76, 2, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-17 06:14:03', '2018-11-17 06:14:03'),
(79, 'SMITESH', '', 'SHENDE', 'smitesh.shende@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '7709627740', 'Jawahar Navodaya vidyalaya campus, navegaon khairi, tq. parshivni, dist. nagpur', 'Jawahar Navodaya vidyalaya campus, navegaon khairi, tq. parshivni, dist. nagpur', '1990-11-28', 'CVYPS6499E', 'NA', '["Along with career growth, I want to use my skills where human life can be simplified."]', '["3.3 years of Experience in the area of android application development.","Excellent working knowledge of core java, Android","SDK, UI Development, XML Parsing, JSON Parsing, Sqlite Database, Android Framework, Jenkins, GIT."," Experience in creating Task estimation and Sprint planning.","Experience in creating SDD (Software Design Document) for implemented modules."," Experience in writing JUnit Test Cases and Automation Scripts for implemented module.","Able to work collaboratively with testers, developers, and other team members in developing complex projects and in the overall enhancement of software product quality."]', 'Active', '1542437180', '3.3', 5.23, 2, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-17 06:46:20', '2018-11-17 06:46:20'),
(80, 'RAJAT', '', 'GUPTA', 'rajat201301@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9873479643', 'House no-1309, Gali no-19\nVandana Enclave\nNear Himgiri Public School\nSector-62, NOIDA\nPin Code - 201309', 'House no-1309, Gali no-19\nVandana Enclave\nNear Himgiri Public School\nSector-62, NOIDA\nPin Code - 201309', '1992-03-13', 'BGXPG3902K', 'NA', '["To be a part of an organization that offers me a stable work place where there are ample amount of opportunities to explore my skills and implement them for the betterment of the business"]', '["Extensive experience in C-language, Embedded-C."," Good expertise in developing  micro controller like ARM, MICROCHIP, ATMEL, 8051"," Knowledge of Compiler, Simulator Knowledge of tools like Kiel µVision IDE, AVR Studio 7.0, MPLAB-IDE, Proteus","A good knowledge of Communication protocol like I2C, UART, SPI, TCP-IP","Sound knowledge of hardware software interfacing and interaction"]', 'Active', '1542461202', '4.9', 5.28, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-17 13:26:42', '2018-11-17 13:26:42'),
(81, 'Shivani ', '', 'Poddar', 'shivani.poddar.pune@gmail.com', 'Experience', 'Female', 'Unmarried', 'NA', 'NA', 'Lac', '9373009565', 'Vidya Nagar\nKoradi, Nagpur -441111', 'Vidya Nagar\nKoradi, Nagpur -441111', '1990-09-04', 'BUOPP0594D', 'NA', '["To be a part of a growing organization where my skills are put to optimum use and I am presented with ample opportunities to explore my horizons."]', '["Embedded Test Engineer with 4.2 years of experience in C, SHELL Scripting, and LINUX."," Worked on Application and middleware layers.","Excellent debugging skills and analytical ability.","Experience in manual testing, white box testing, test case preparation and test automation using Shell scripting."," Experience in creating Test Approach, Test Strategy, Test Plans, Test Phase summary report etc."," Experience in test integration on LTP (Linux Testing Project)."," Proficiency in analyzing business and functional requirement documents and executing the Test Cases. "," Self-motivated and highly adaptable to the latest technologies."," Worked on test design and development for GENIVI components."," Worked on a Testing project for “Automotive Infotainment Domain”"]', 'Active', '1542462052', '4.2', 5.33, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-17 13:40:52', '2018-11-17 13:40:52'),
(84, 'VAIBHAV', '', 'KUMAR ROY', 'vroy598@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '8660823175', 'Bokaro, Jharkhand', 'Bokaro, Jharkhand', '1994-03-03', 'GLWPS2111F', 'NA', '["Not Mentioned"]', '["2years 11months of work experience as R&D engineer in, Rove Labs Pvt Ltd, Bangalore","Experience in hardware designing and testing of different ECU(Engine control unit), CNC boards, sensors, smart switches.","Experience in hardware design of IOT platforms, Robotics platform boards.","Experience in PCB designing.","Experience on Protocols (UART, I2C, SPI, CAN).","C coding for different family of MCUs(Microcontrollers).","Experience in interfacing with Wifi(esp8266 family), Bluetooth(HC-05), different types of sensors, motor drivers.","I am Enthusiastic team player, Self-Confident. Currently working as, a R&D engineer for design and development in Rove Labs Pvt Ltd."]', 'Active', '1542464366', '3.0', 4.20, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-17 14:19:26', '2018-11-17 14:19:26'),
(85, 'Ashish', '', 'Sharma', 'ashish.sharma.2992@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '7057626901', 'D13,  Supriya gardens\nAundh, Pune', 'Village-Zikriwala\nPost office-Afzalgarh,\nTehsil-Dhampur,\nDistrict-Bijnor,U.P.', '1995-09-29', 'GIKPS5833P', 'NA', '["To become a successful professional in a company and to work in an innovative, developing and competitive environment where I can enhance my technical skills and become a good person."]', '["Not Mentioned"]', 'Active', '1542465573', '3.0', 7.29, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-17 14:39:33', '2018-11-17 14:39:33'),
(86, 'Vivek', '', 'Yadav', 'er.vkky@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '916263282007', 'H.No.-18, Awadhpuri PhaseII, Bhopal,Madhya Pradesh-462021', 'H.No.-18, Awadhpuri PhaseII, Bhopal,Madhya Pradesh-462021', '1988-01-01', 'AICPY5714F', 'NA', '["Not Mentioned"]', '["Ambitious Engineer who continuously exceeds both company/Institute and personal goals, Expertise in Electronics and design Inventor. Results-oriented specializing in high-level problem solving, process efficiency and day-to-day maintenance in adaptive environment.","1. Total 6 year of professional experience in core electronics, involved in various phases of Hardware, firmware, circuit design and PCB layout design, development, implementation and deployment of various Technologies or products under Agile Methodology","2. Profound working experience in Microcontroller Programming, Circuit debugging & Simulation, PCB Layout Design Double side, Use of instruments or core related activities."," 3. Working Experience in 8-bit microcontroller(8051, AVR, STM8), esp8266, Arduino, STM32, Firmware Development using open source IDEs","4. Working experience in PCB Design, Orcad9.1, Diptrace, kicad, gschem.","5. Good working experience in EDA (Electronic Design Automation) using open source gEDA, Ngspice, gSchem, Fritzing, pspice, LTspice.","6. Working experience in Industrial Automation, Product making, Simulation of electronic circuit and making prototypes.","7. Flair to adapt new software applications, Technology and products, good communication and understanding of business workflow. Effective Team Player with excellent problem solving abilities, a willing and quick learner with strong technical skills. "]', 'Active', '1542604994', '6.0', 4.00, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-19 05:23:14', '2018-11-19 05:23:14'),
(87, 'Amar', 'Hemraj', 'Vaidya', 'amarvaidya86@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9766114611', 'Snehal nagar, In front of Samarth Apartment, Sewagram road, Wardha-442001', 'Snehal nagar, In front of Samarth Apartment, Sewagram road, Wardha-442001', '1986-04-25', 'ALGPV4447F', 'NA', '["To excel in the field of embedded system design with cognitive learning and technical abilities while being resourceful, innovative and flexible."]', '["2.5+ years of experience in Embedded & Hardware design Engineer, 3 year experience in Testing & Project engineering department. Hands on experience on Schematic and PCB design in Eagle and Proteus. Excellent in testing, fault finding, troubleshooting and debugging skills. Good in Embedded C programming and developing modules. Good knowledge of JSS55555 naval environmental test. Good knowledge of Ingress Protection (IP) test. Good exposure to Auto-cad for making wiring diagram. Good knowledge of MATLAB."]', 'Active', '1542605040', '6.0', 5.16, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-19 05:24:00', '2018-11-19 05:24:00'),
(88, 'Dhiraj', '', 'Chimurkar', 'dhirajchimurkar@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9970807397', 'Tropica Scoiety,\nRawet, Pune. 411044', 'Tropica Scoiety,\nRawet, Pune. 411044', '1992-08-28', 'ABCDE1234C', 'NA', '["I would like to work in challenging atmosphere that will provide an opportunity for learning, for growth and my professional knowledge and skills will make an effective contribution to growth of company or institution."]', '["Software Engineer with a demonstrated history of working in the automotive services industry. Have experience of 2 years in all aspects of software development life cycle, including requirement analysis, design development and integration testing at module level. Supportive and enthusiastic team player dedicated to streamlining processes and efficiently resolving the project issues."]', 'Active', '1542618810', '2.0', 0.00, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-19 09:13:30', '2018-11-19 09:13:30'),
(93, 'Anoop P K', '', 'NA', 'anoopsreepuram@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9961608834', 'Sreepuram House, Poroa,Porora(PO),Mattannur, Kannur-670702, Kerala.', 'Sreepuram House, Poroa,Porora(PO),Mattannur, Kannur-670702, Kerala.', '1990-05-25', 'EMZPK1021C', 'NA', '["To earn a job which provides me job satisfaction and help me achieve personal as well as organization goals."]', '["4 +Years of Industrial Experience, that includes Embedded firmware development. ","Proficiency in design and development of 32bit,8bit Micro controllers Skill in Embedded C programming, Firmware development, IoT(AWS) system Designing, Free RTOS."]', 'Active', '1542807370', '3.9', 2.75, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-21 13:36:10', '2018-11-21 13:36:10'),
(94, 'VAIBHAV', '', 'DESHPANDE', 'vaibhav@syslogyx.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '8380097982', 'Nagpur', 'Nagpur', '1982-03-23', 'ALFPD4197D', NULL, '["OK"]', '["OK","Not OK","Still OK","Lets C"]', 'Active', '1542808937', '0.0', 1.00, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-21 14:02:18', '2018-11-21 14:02:18'),
(99, 'testing', '', 'NA', 'aniruddha@syslogyx.com', 'Experience', NULL, 'Unmarried', 'NA', 'NA', 'Lac', '9960407014', 'tresing', 'testing2', '1989-01-02', 'ASDVV1233B', NULL, '["testinghh"]', '["testingjhfjfjfj"]', 'Active', '1542814531', '0.0', 0.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-21 15:35:31', '2018-11-21 15:35:31'),
(100, 'testing', '', 'NA', 'nikhil@syslogyx.com', 'Experience', NULL, 'Unmarried', 'NA', 'NA', 'Lac', '9021592175', 'test', 'test', '2018-11-21', 'ASDFG1234F', NULL, '["IDEs: Eclipse, Notepad++ and sublime.","Frameworks: PHP LARAVEL and Express node  ( MVC pattern)","Web Services (API): HTTP, RESTful etc.","	Version control:  Tortoise SVN, Tortoise Git.","Bug Tracking Tool: JIRA and Mantis.","Operation platforms: Windows XP/Vista/7/8.","Others:  Manual testing & debugging."]', '["IDEs: Eclipse, Notepad++ and sublime.","Frameworks: PHP LARAVEL and Express node  ( MVC pattern)","Web Services (API): HTTP, RESTful etc.","	Version control:  Tortoise SVN, Tortoise Git. ","Bug Tracking Tool: JIRA and Mantis.","Operation platforms: Windows XP/Vista/7/8.","Others:  Manual testing & debugging."]', 'Active', '1542815010', '0.0', 0.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-21 15:43:30', '2018-11-21 15:43:30'),
(101, 'V Sai Teja', '', 'NA', 'vellankisaiteja114@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '8885432184', 'Saiteja.vellanki,\nS/o seshukumar,\nH.no 1-5\nKotha Gandigudem,\nKamavarapukota Mandalam,\nNear Eluru,\nWest Godawari District.', 'Saiteja.vellanki,\nS/o seshukumar,\nH.no 1-5\nKotha Gandigudem,\nKamavarapukota Mandalam,\nNear Eluru,\nWest Godawari District.', '1994-08-18', 'ABCDE1235F', 'NA', '["To attain a job in a well-established organization that allows self-growth by materializing my creative ideas that strengthen the organization."]', '["Experience in C Programming, Embedded C and Micro python. Familiar with code versioning tools such as GIT. Worked on BLE, Wi-Fi (IEEE802.11b/g/n), Zigbee (IEEE802.15.4), NRF24, SIM800C and SIM7600E. Microcontrollers –STM32 (ARM Cortex M0), Atmel (ATMEGA 2560), ESP8266. Protocols – I2C, SPI, UART, RS232, USB, JTAG, I2S, One-w ire, TCP/IP, MQTT. Operating Systems – Linux (Ubuntu),  Windows, Windows 10 IOT core. Worked with various sensors like IR, Temperature, Ultrasonic sensor, Moisture, etc. Platforms – Raspberry Pi, Arduino. Hands on working experience of Keil IDE (ARM MDK), Arduino IDE, XCTU (XBEE work bench) and Code Blocks. Experience on designing Schematics and PCB in Eagle, Kicad and Fritzing Software. Testing knowledge on PCB. Experience on LT spice Simulation."]', 'Active', '1542868864', '2.7', 2.06, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-22 06:41:04', '2018-11-22 06:41:04'),
(102, 'Gaurav', '', 'Likhar', 'gaurav.likhar89@yahoo.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '7769034499', 'Flat No 1, S. No 26/2/1, Wardhaman Enclaves, Near Gulmohar Parkview Society, Kharadi, Pune - 411014', 'Flat No 1, S. No 26/2/1, Wardhaman Enclaves, Near Gulmohar Parkview Society, Kharadi, Pune - 411014', '1989-04-03', 'AFGPL7549Q', 'M6514093', '["To associate with an organization which progresses dynamically and gives me a chance to update my knowledge and enhance my skills. At the same time be a part of the team that poises towards growth of the organization and that provides personal and professional satisfaction thereof."]', '["Professional Summary: -6 + years of experience in Embedded System Design, Banking Domain in various projects. Played an active role in requirement gathering & understanding, design, development and code review. Expertise on development of stacks for Industrial Automation Protocols for WirelessHART, HART over UDP, Modbus TCP. C / C++ and Object Oriented concepts in Linux and Windows SYBASE, perl and SQL development experience in Banking domain Knowledge of CAN in Automotive Domain Cross compilation of libraries, packages and applications Good knowledge of Linux, Filesystem, Operating System and Kernel internals Debugging Tools GDB and Valgrind in Linux Involved in complete development life cycle Exposure on Bug tracking tool Mantis and Version control tool CVS"]', 'Active', '1542873158', '7.0', 6.06, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-22 07:52:38', '2018-11-22 07:52:38'),
(103, 'Cibin', '', 'Baby', 'cbcbaby20@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '8593943980', 'Chungath House, Mundur P.O, Thrissur,\nPin Code-680541 Kerala, India.', 'Chungath House, Mundur P.O, Thrissur,\nPin Code-680541 Kerala, India.', '1991-02-09', 'DRCPB6670K', 'P0468912', '["To associate myself with an organization that provides a challenging career and effectively contributes towards the goal of the organization."]', '["2 years and 10 months experience in the design, development and testing of multiple embedded system projects. Embedded Software Developer at Pan tech Solutions Pvt Ltd, Cochin - December 2015-till date."]', 'Active', '1542891075', '2.6', 2.45, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-22 12:51:15', '2018-11-22 12:51:15'),
(106, 'Mayank', '', 'Jena', 'mayankjena1995@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9916543842', 'A-108, Yogi Hills, Near Balaji Temple, Amli, Silvassa, Union Territory of Dadra and Nagar Haveli -369230.', 'A-108, Yogi Hills, Near Balaji Temple, Amli, Silvassa, Union Territory of Dadra and Nagar Haveli -369230.', '1995-03-15', 'BDTPJ7352K', 'NA', '["To secure a challenging position in a reputable organization to expand my leanings, knowledge, and skills."]', '["Two years\' experience in Automotive Embedded Software Development for Powertrain application in Bosch Experience in application development using ASCET Experience in integration and configuration using BCT, Bos ch in-house AUTOSAR configuration tool Basic Know-how of AUTOSAR architecture Bachelor of Engineering (B.E) in Electrical and Electronics Engineering from B.M.S College of Engineering with C.G.P.A of 9.23 "]', 'Active', '1542953199', '2.0', 4.73, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-23 06:06:39', '2018-11-23 06:06:39'),
(107, 'Mayur', 'Manohar', 'Chaudhari', 'mayurch07@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9890680658', 'Flat no.4, soan sarowar building, lane no. 4, morya park, Pimple gurav. 411027', 'Mayur niwas, near state bank, Gandhi ward, Tirora. 441911', '1989-12-02', 'AWVPC6560C', 'NA', '["Having extensive experience in development of projects, ramping-up projects within time, budget & quality parameter, as per project requirement."]', '["Embedded software developer with 3 years of experience in product design, testing & validation number of projects for multiple clients in defence & automotive sector. Ability to work alone on tight deadlines or in a team environment."]', 'Active', '1542956010', '3.0', 3.45, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-23 06:53:31', '2018-11-23 06:53:31'),
(108, 'Aboli', '', 'Bajare', 'bajareaboli5@gmail.com', 'Experience', 'Female', 'Unmarried', 'NA', 'NA', 'Lac', '9113977603', 'eshwara layout,Indira nagar, Bangalore', 'Chhaya colony, akoli road, Amravati', '1995-05-24', 'CKDPB8464J', 'NA', '["I am seeking a competitive and challenging envy where I can use my experience and education and skills to meet company goals."]', '["Qualified B.E (Electronics & Telecommunication Engineering) from S.S.G.M.C.E, with 2 years of experienced as an Embedded Test Engineer Presently working as an Embedded Engineer in EPSON (from 17/01/2017 till present date) of experience in firmware testing and development for Printer product (Dot matrix, ink jet and Thermal printers) Worked on site for the Bank project in Thailand  Expertise in firmware testing and manual, unit testing and design of N PD products."]', 'Active', '1542967663', '2.0', 3.06, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-23 10:07:43', '2018-11-23 10:07:43'),
(109, 'Vikas', '', 'Dhote', 'vikasdhote3@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9479777799', 'Flat No. B103 Sls Saphhire, Panathur Road, Bangalore, Karnataka-560087', 'Pratap ward gadaghat tikari Betul,Madhya Pradesh 460001.', '1992-04-22', 'BRCPD4184J', 'N5435264', '["NA"]', '["A versatile and professional embedded engineer with experience of more than one years in completing Industrial Automation projects from early inception to release to manufacturing. Demonstrated track record of successfully transferring designs into manufacturing."]', 'Active', '1542970940', '1.10', 2.04, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-23 11:02:20', '2018-11-23 11:02:20'),
(110, 'Mayur', '', 'Badnerkar', 'mayur.badnerkar07@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9561309841', '301, C/O Amol Raskar, jaimala Nagar lane no 6, near girija ambi clininc Old sangavi Pune 411027.', 'Sai Nagar, Plot no.145, Amravati, Maharashtra 444607.', '1992-11-19', 'CFCPB3198B', 'NA', '["I want to succeed in a stimulating and challenging environment that will improvise me with the advancement opportunities.","I want to succeed in an environment of growth and excellence to meet personal and organizational goals.","I want to excel in this field with hard work, perseverance and dedication."]', '["Specialization in Electronics with more than 1.10 year of experience in Embedded Technologies.","Working Experience with Biomedical based applications.","Experience of program development on on-chip peripherals and off-chip peripherals.","Ability to understand user manual, data sheets to implement software& hardware.","Experience in development and implementation of serial protocols like UART.","Working knowledge of Linux internals: Task Creation and Deletion, Socket.","Working knowledge of serial protocols like I2C and CAN.","Working Experience on networking protocols TCP/IP, Blue tooth.","Working Experience on PCB design up to 4 layers (Auto desk _Eagle 8.5+):-","Hardware designing, Schematic designing, Layout designing."]', 'Active', '1542973504', '1.10', 1.02, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-23 11:45:04', '2018-11-23 11:45:04'),
(111, 'Sweta', '', 'Mishra', 'sweta3283@gmail.com', 'Experience', 'Female', 'Unmarried', 'NA', 'NA', 'Lac', '9811902440', 'C-58/26, Oriental Housing Society, Sector-62, Noida, U.P-201301', 'C-58/26, Oriental Housing Society, Sector-62, Noida, U.P-201301', '1991-02-03', 'ABCDE1236F', 'NA', '["In quest of challenging career opportunities in IT Operations / Software Development with an organization of repute."]', '["A dynamic professional with more than 5+ years of working experience in developing web based and standalone applications using Java/JEE (MVC architecture). As part of my assignments, involved in Requirement Analysis, Application Development, Application Maintenance and Functional Studies. Extensive experience in developing and managing enterprise IT project life cycle through all phases and post production support. Proven ability to deliver high quality IT products and services on schedule and within budget. An effective communicator with excellent skills in building relationships. Possesses strong analytical, problem solving and organizational abilities. Actively using agile business tools like JIRA, Trello, Taiga and  project management tools like SVN, Git. Presently working as Technical Lead with Sopra Steria. (April 2016 till date). "]', 'Active', '1543211398', '5.10', 8.23, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-26 05:49:58', '2018-11-26 05:49:58'),
(112, 'Vaibhav', '', 'Asole', 'vaibhav.asolejava@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '8861536490', 'Shri Rama Sai PG, #6/1 Puttapa layout, Outer Ring Road, Mahadevpura, Bangalore. PIN-560048', 'Jagdamba Colony, Ward no.13, Karanja (Ghadge), Dist. Wardha, Maharashtra. PIN-442203', '2018-11-26', 'BMEPA6335B', 'R9786725', '["To work with a growth-oriented organization where I can utilize my potential for professional growth."]', '["Having around 3 years of IT experience in developing and maintaining Client/Server, Web based Applications using JAVA and J2EE. Strong Programming Knowledge in Java, Jsp, Servlets, Hibernate, Spring. Experience on Ajax, JQuery, Web service. Experience in core java technologies. Develop components using Hibernate. Good understanding over the web and application servers like Tomcat, Web sphere and Web logic. Good programming, Analytical and Trouble Shooting skills. Good analytical abilities, quick grasping power zeal for learning new things. Good understanding Oracle, MySql database. Dynamic, highly motivated and result-oriented professional."]', 'Active', '1543212592', '3.0', 4.05, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-26 06:09:52', '2018-11-26 06:09:52'),
(113, 'Vikas', '', 'Rastogi', 'rastogivikas08@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '8010416264', 'B 194 , sector 31 , Noida 201301', 'Vill – Sisendi , Post – Mohan Lal Ganj , Lucknow', '1990-08-07', 'BJFPR2541J', 'N7764759', '["To work in a lively professional environment where I can establish delivery by complying with all deliverable schedules and find my place for success of the organization along with my personal growth by meeting the precise quality standards and deadlines."]', '["Working as Design Engineer for Firmware Engineer in Embedded field with experience of 4 year in industry. Worked on many Microcontroller and sensors and on C language and made many industrial and consumer electronics products."]', 'Active', '1543490794', '4.0', 9.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-29 11:26:35', '2018-11-29 11:26:35'),
(114, 'Ritesh', 'Bhaurao', 'Rewatkar', 'ritesh.allmact@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '7385904326', 'Manish layout, Kharabi road, Shesh nagar, Nagpur-440024(M.S.)', 'Manish layout, Kharabi road, Shesh nagar, Nagpur-440024(M.S.)', '1990-03-14', 'BKMPR9393C', 'N6918063', '["Aim to be associated with a progressive organization, apply my technical skills to expedite the growth of the Organization that provides a promising career in Cloud computing Technology."]', '["Total IT experience: - Five years Four months 1. Currently working as an AWS cloud administrator with middleware team from last one year four months. 2. Worked as a Java Application Developer at Allmact Management Pvt. Ltd. for more than four years. 3. JAVA trainer at Global Career Computer Academy, Nagpur (an ISO 9001:2008 institute) since more than Six Years."]', 'Active', '1543492769', '4.1', 4.50, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-29 11:59:29', '2018-11-29 11:59:29'),
(115, 'Nikhil', '', 'Choudhary', 'inikhil001@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9866320029', 'C-10/403, Singapore Township, Near Infosys SEZ, Hyderabad - 500088', '13,Anupam Society,Near Gurukul Vidya Mandir,Post – Katol Road,Nagpur - 440013', '1994-06-25', 'AXPPC0876N', 'M9115095', '["I seek challenging opportunities where I can fully utilize my skills for the success of the organization."]', '["I have total 3.5 years of experience in Java,Node and AWS. Started my carrier working with as a Software Developer. Currently working in B2B gateway project and involved in learning new tools and technologies. Developed micro services in JAVA and Node. Traveled to Australia for micro services production deployment and support."]', 'Active', '1543496133', '3.0', 4.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-29 12:55:34', '2018-11-29 12:55:34'),
(116, 'Sreenu', '', 'Ganta', 'sreenu5859@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '8056886064', 's/o Satyam, Locherla (Vill), Therlam(MD), Vizianagaram (Dt). Andhra Pradesh. PIN : 535126', 's/o Satyam, Locherla (Vill), Therlam(MD), Vizianagaram (Dt). Andhra Pradesh. PIN : 535126', '1983-08-05', 'AXHPG8254G', 'NA', '["Apply my skills as a Software Engineer to a new challenge with a company focused on quality,dedication,and ingenuity."]', '["Having Total 6 Years Experience in software development on Banking domain, Product management software, Telecommunication domain and MSEB domain."]', 'Active', '1543572513', '4.6', 7.00, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-30 10:08:34', '2018-11-30 10:08:34'),
(117, 'Roshan', '', 'Thakare', 'roshan.thakare8@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9860887785', '2D-504 , near Infinity It Park, Goregoan east 400065', '– Plot no 48,Gadge Nagar,Nagpur - 440009', '1988-05-09', 'AMXPT4204E', 'NA', '["To contribute towards the design and development of better and usable solutions by using profound software engineering methodologies and tools."]', '["Having Total 6 Years Experience in software development on Banking domain, Product management software, Telecommunication domain and MSEB domain."]', 'Active', '1543582176', '5.5', 7.15, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-11-30 12:49:36', '2018-11-30 12:49:36'),
(121, 'Sagar', '', 'Bawne', 'bawnesagar@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '8779394244', 'Survey 124,Shivaji Park', 'Plot no 82,Suraj Society,New Manish Nagar,Nagpur.', '1992-07-23', 'AZSPB1793Q', 'NA', '["To secure a challenging position where I can effectively contribute my skills as Software Professional, possessing competent Technical Skills."]', '["Overall 2.4 years of experience in development of Web applications using JAVA. Working with Atos Syntel from July 2016 to till date. Hands on experience in  Java Spring MVC,MS Sql,My Sql , Servlets, JSP, JDBC, JPA, JSF, Angular js. Knowledge of Spring tool suite for the development of Java projects. Hands on experience Spring boot and Tomcat web servers.Cohesive team worker, having strong analytical, problem solving and interpersonal skills. Leading and handling a team of 4 employees."]', 'Active', '1543841145', '2.4', 3.74, 1, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-12-03 12:45:45', '2018-12-03 12:45:45'),
(122, 'Nomesh', 'Ashok', 'Padole', 'nomeshpadole@yahoo.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9096411278', 'Corresponding address –75B Shaktimata Nagar, Near water tank kharbi road,Nagpur-440009', 'Teacher Colony, Shahapur, Bhandara-441906', '1990-04-14', 'CCFPP8468N', 'N4228826', '["NA"]', '["Currently working with Tacktile Systems Nagpur, I have 2.9yrs of total work experience on android development and I also worked on some IoT devices like AWS Dashboard button, Echo show/Dot, Arduino Board, Raspberry pie etc.\\nI have work on more than 7 to 8 app which has release on play store."]', 'Active', '1543902664', '5.3', 5.00, 2, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-12-04 05:51:05', '2018-12-06 10:48:57'),
(123, 'Ankita', '', 'Prasad', 'ankitaprasad.prasad90@gmail.com', 'Experience', 'Female', 'Unmarried', 'NA', 'NA', 'Lac', '8521458318', 'HOUSE NO D15/303, Sandeep Vihar, Kannamangala,Hoskote, Bengaluru-560067', 'HOUSE NO D15/303, Sandeep Vihar, Kannamangala,Hoskote, Bengaluru-560067', '1990-08-22', 'BRYPP8911R', 'NA', '["To pursue a challenging and creating career where I can apply my existing knowledge and creativity to acquire new skil ls contributed effectively to the organization. A qualified Professional with 2.10 years\' experience working with a startup with knowledge in Hardware Design and Software Development. I am looking for an opportunity in Embedded Systems. "]', '["NA"]', 'Active', '1543908257', '2.11', 5.00, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-12-04 07:24:17', '2018-12-04 07:24:17'),
(124, 'Hiren', 'Rameshbhai', 'Thumar', 'hiren.thumar2702@gmail.com', 'Experience', 'Male', 'Unmarried', 'NA', 'NA', 'Lac', '9426570128', '239,Bblock, pratap nagar,Udaiput,State-Rajasthan', 'street no 4,govind para,kalavad,Dist -Jamnagar,State- Gujarat.', '1991-02-27', 'ALIPT5592M', 'NA', '["Give the best effort to the organization through my best creative skills to rise up the position of organization in competitive environment as well as to grooming the skills of myself also."]', '["Presently working in Secure Meters Ltd. as a Senior\\nFirmware Developer.\\nHave 4.5 Years of experience in the field of\\nembedded system design and development.\\nHave good Experience of Firmware/software\\ndesign,development of 8-bit/16-bit/32-bit\\nmicrocontrollers,Unit Testing and also Experience in\\nEmbedded Hardware development.\\nProduct Architecture designing, Project resource\\nEstimation, Planning, Finalization of Technical\\nspecifications and project Execution, Product design\\ndocumentation, product life cycle.\\nStrong software and Hardware peripheral debugging\\nskills with handling of debugging tools- JTAG\\nDebugger, Oscilloscope, Signal generator and Analyzer."]', 'Active', '1544001970', '4.5', 5.00, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-12-05 09:26:11', '2018-12-06 10:47:03');
INSERT INTO `candidate_details` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `opprtunity_for`, `gender`, `marital_status`, `indian_languages`, `foreign_languages`, `currency_unit`, `mobile_no`, `corresponding_address`, `permanent_address`, `date_of_birth`, `pan_number`, `passport`, `objective`, `summary`, `status`, `timestamp`, `total_experience`, `ctc`, `job_description_id`, `unique_token`, `created_at`, `updated_at`) VALUES
(125, 'Bhupendra', 'Panchamlal', 'Vishwakarma', 'bhupendra6130@gmail.com', 'Experience', 'Male', 'Unmarried', 'English, Hindi', 'Not Mentioned', 'Lac', '7829103028', '#645,30th main road.J.P. Nagar 1st Phase, Bangalore 560078  K.A.', '#645,30th main road.J.P. Nagar 1st Phase, Bangalore 560078  K.A.', '1990-08-15', 'AOLPV9872L', NULL, '["To obtain a position that would provide me an opportunity to apply and expand my skills, knowledge and experience."]', '["4.5 years  of experience in IT Industry with expertise in Embedded Systems as Embedded Developer.","Expertise in Schematics design in Orcad capture 16.6.","Electronics  Circuit Design and Analysis for Railway and Industrial Automation applications","Experience in Programming in embedded C.","Experience in 8bit ,16bit and 32bit Microcontrollers.","Experience in Oscilloscope and Logic Analyzer.","Have good understanding of OS concepts, IPCs in Linux and Vxworks(RTOS).","Have hands on experience as a learner on Embedded Linux with Beagle bone black hardware.","Be a self-starter, able to work independently with minimum supervision, positive attitude and highest ethics.","Able to work collaboratively with cross-functional team."]', 'Active', '1544192984', '4.5', 2.00, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-12-07 14:29:47', '2018-12-07 14:29:47'),
(126, 'Deepika', 'Raju', 'Shinde', 'deepika.shinde08@gmail.com', 'Experience', 'Female', 'Unmarried', 'English, Hindi', 'English', 'Lac', '9960897914', 'A1-503,Haritshilp vistacore,Rahatani,Pune.', 'Plot no. 15,Meenatai Thakre nagar,satara parisar, Aurangabad.', '1994-03-12', 'GGGPS3711E', 'NA', '["Want to work in an organisation where i can use my skills effectively to develop and learn new technology which will give exposure to handle projects."]', '["2 years of Automotive infotainment experience with good knowledge in embedded\\nsystem development with embedded LINUX -across system level, with extensive\\nusage of embedded C/C++ language.\\nBasic Knowledge of Android Applications Development (JAVA, HTML5) for an\\nAndroid POC which involves android porting on Raspberry 3B and developing\\nMultimedia, Phone Call and Bluetooth Low Energy based android application.\\nGood experience in Coding, Defect analysis, Software maintenance.\\nHaving PG-Diploma in Embedded Systems from CDAC Pune.\\nStrong Problem-Solving, Designing and Debugging Skill.\\nA systematic, disciplined & organized personality.\\nExcellent Communication and Interpretation skills."]', 'Active', '1544445430', '2.3', 4.04, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-12-10 12:37:10', '2018-12-10 12:37:10'),
(127, 'Dheeraj', 'Arjun', 'Sawant', 'dheerajsawant5@gmail.com', 'Experience', 'Male', 'Unmarried', 'English, Hindi', 'English', 'Lac', '9819368634', '1/B 701, Sai Darshan C.H.S. Sector-19 kamothe Navi    Mumbai', '1/B 701, Sai Darshan C.H.S. Sector-19 kamothe Navi    Mumbai', '1990-10-25', 'CFXPS0339Q', 'S1285284', '["NA"]', '["3+ Years of experience in Embedded ​ System with various electronics devices.\\nGood in C language & Embedded C as well as familiar with C++..\\nHands on experience with NXP JN516x family,Microchip’s IC .\\nBasic knowledge of LINUX Operating System.\\nProficient in I2C, UART Protocols.\\nHands on experience on MPLAB IDE, Beyond Studio, Eclipse(kepler)."]', 'Active', '1544504173', '3.5', 3.00, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-12-11 04:56:14', '2018-12-11 04:56:14'),
(128, 'Gautam', 'Kumar', 'Koushal', 'gautamkoushal@gmail.com', 'Experience', 'Male', 'Married', 'English, Hindi', 'English', 'Lac', '9039977134', '348/2, Street No. 17, Ashok Vihar Phase II, Gurugram, Haryana 122022', 'H. No. 78, Acharya Narendra Dev Nagar, Govindpura Bhopal - 462023, M.P.', '1988-08-20', 'EEVPK3792C', 'N5967614', '["To work in an organization, where innovation and excellence is the way of life, where my full potential will be explored and where I will get adequate scope for development."]', '["Total 5 yrs. of experience as an Embedded Software Design Engineer. Design and Implementation were based on bare-metal platforms, Embedded C Application development & Board Bring up, debugging & testing etc.\\nExposed to projects intended for Indian Defence communication and control etc.\\nPG Diploma in Embedded Systems Design (PG-DESD) from CDAC, Hyd"]', 'Active', '1544506396', '3.0', 3.00, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-12-11 05:33:16', '2018-12-11 05:33:16'),
(129, 'Yogesh', 'R P', 'Singh', 'yogeshsingh073@gmail.com', 'Experience', 'Male', 'Married', 'Hindi', 'English', 'Lac', '9555844391', '119 2nd floor , Bhao Rao devras, Pratap Vihar , Ghaziabad', '2/3 Mahamanpuri , Varanasi', '1991-03-07', 'CFSPS7988Q', 'P5125111', '["To be asset to the firm, while in process improving both my technical and social skill."]', '["Results-oriented Embedded Software Engineer with more than four years experience in analysis design development testing and implementation of various embedded software systems. Adept at designing and building applications with usability and high performance in mind."]', 'Active', '1544791574', '4.0', 4.20, 3, 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', '2018-12-14 12:46:15', '2018-12-17 07:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_document`
--

CREATE TABLE `candidate_document` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidate_document`
--

INSERT INTO `candidate_document` (`id`, `file_name`, `candidate_id`, `path`, `timestamp`, `created_at`, `updated_at`) VALUES
(8, '1541522420.docx', 72, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1541522419', '2018-11-06 16:40:20', '2018-11-06 16:40:20'),
(9, '1541530290.docx', 73, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1541530288', '2018-11-06 18:51:30', '2018-11-06 18:51:30'),
(10, '1541581053.docx', 74, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1541581052', '2018-11-07 08:57:33', '2018-11-07 08:57:33'),
(56, '1542093520.pdf', 48, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1540998321', '2018-11-13 07:18:40', '2018-11-13 07:18:40'),
(57, '1542093613.pdf', 49, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1540998541', '2018-11-13 07:20:13', '2018-11-13 07:20:13'),
(58, '1542093712.pdf', 50, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1540999256', '2018-11-13 07:21:52', '2018-11-13 07:21:52'),
(59, '1542094173.docx', 66, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1541415751', '2018-11-13 07:29:33', '2018-11-13 07:29:33'),
(60, '1542094276.pdf', 67, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1541417535', '2018-11-13 07:31:16', '2018-11-13 07:31:16'),
(62, '1542190387.docx', 76, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542190386', '2018-11-14 10:13:07', '2018-11-14 10:13:07'),
(63, '1542267349.docx', 70, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1541420831', '2018-11-15 07:35:50', '2018-11-15 07:35:50'),
(64, '1542284516.docx', 77, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542284515', '2018-11-15 12:21:56', '2018-11-15 12:21:56'),
(65, '1542435244.pdf', 78, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542435243', '2018-11-17 06:14:04', '2018-11-17 06:14:04'),
(66, '1542437181.pdf', 79, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542437180', '2018-11-17 06:46:21', '2018-11-17 06:46:21'),
(67, '1542461203.docx', 80, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542461202', '2018-11-17 13:26:43', '2018-11-17 13:26:43'),
(68, '1542462052.docx', 81, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542462052', '2018-11-17 13:40:52', '2018-11-17 13:40:52'),
(71, '1542464367.pdf', 84, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542464366', '2018-11-17 14:19:27', '2018-11-17 14:19:27'),
(72, '1542465573.docx', 85, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542465573', '2018-11-17 14:39:33', '2018-11-17 14:39:33'),
(73, '1542604995.pdf', 86, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542604994', '2018-11-19 05:23:15', '2018-11-19 05:23:15'),
(74, '1542605040.pdf', 87, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542605040', '2018-11-19 05:24:00', '2018-11-19 05:24:00'),
(75, '1542618810.docx', 88, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542618810', '2018-11-19 09:13:30', '2018-11-19 09:13:30'),
(77, '1542807370.docx', 93, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542807370', '2018-11-21 13:36:11', '2018-11-21 13:36:11'),
(78, '1542808938.pdf', 94, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542808937', '2018-11-21 14:02:18', '2018-11-21 14:02:18'),
(79, '1542814534.docx', 99, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542814531', '2018-11-21 15:35:34', '2018-11-21 15:35:34'),
(80, '1542815011.docx', 100, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542815010', '2018-11-21 15:43:31', '2018-11-21 15:43:31'),
(81, '1542868865.docx', 101, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542868864', '2018-11-22 06:41:05', '2018-11-22 06:41:05'),
(82, '1542873158.docx', 102, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542873158', '2018-11-22 07:52:38', '2018-11-22 07:52:38'),
(83, '1542891076.docx', 103, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542891075', '2018-11-22 12:51:16', '2018-11-22 12:51:16'),
(84, '1542953199.pdf', 106, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542953199', '2018-11-23 06:06:39', '2018-11-23 06:06:39'),
(85, '1542956012.pdf', 107, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542956010', '2018-11-23 06:53:32', '2018-11-23 06:53:32'),
(86, '1542967663.docx', 108, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542967663', '2018-11-23 10:07:43', '2018-11-23 10:07:43'),
(87, '1542970940.docx', 109, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542970940', '2018-11-23 11:02:21', '2018-11-23 11:02:21'),
(88, '1542973504.docx', 110, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1542973504', '2018-11-23 11:45:04', '2018-11-23 11:45:04'),
(89, '1543211399.docx', 111, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543211398', '2018-11-26 05:49:59', '2018-11-26 05:49:59'),
(90, '1543212593.docx', 112, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543212592', '2018-11-26 06:09:53', '2018-11-26 06:09:53'),
(91, '1543490796.pdf', 113, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543490794', '2018-11-29 11:26:37', '2018-11-29 11:26:37'),
(92, '1543492770.docx', 114, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543492769', '2018-11-29 11:59:30', '2018-11-29 11:59:30'),
(93, '1543496135.docx', 115, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543496133', '2018-11-29 12:55:35', '2018-11-29 12:55:35'),
(94, '1543572515.docx', 116, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543572513', '2018-11-30 10:08:35', '2018-11-30 10:08:35'),
(95, '1543582177.docx', 117, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543582176', '2018-11-30 12:49:37', '2018-11-30 12:49:37'),
(96, '1543841146.pdf', 121, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543841145', '2018-12-03 12:45:46', '2018-12-03 12:45:46'),
(97, '1543902666.docx', 122, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543902664', '2018-12-04 05:51:06', '2018-12-04 05:51:06'),
(98, '1543908258.pdf', 123, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1543908257', '2018-12-04 07:24:18', '2018-12-04 07:24:18'),
(99, '1544001973.pdf', 124, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1544001970', '2018-12-05 09:26:13', '2018-12-05 09:26:13'),
(100, '1544192989.docx', 125, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1544192984', '2018-12-07 14:29:49', '2018-12-07 14:29:49'),
(101, '1544445431.pdf', 126, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1544445430', '2018-12-10 12:37:11', '2018-12-10 12:37:11'),
(102, '1544504175.pdf', 127, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1544504173', '2018-12-11 04:56:15', '2018-12-11 04:56:15'),
(103, '1544506398.pdf', 128, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1544506396', '2018-12-11 05:33:18', '2018-12-11 05:33:18'),
(104, '1544791579.pdf', 129, 'C:\\Inetpub\\vhosts\\syslogyx.com\\recruitmentapi.syslogyx.com\\app\\public\\/doc', '1544791574', '2018-12-14 12:46:19', '2018-12-14 12:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_jd_assoc`
--

CREATE TABLE `candidate_jd_assoc` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `job_description_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidate_jd_assoc`
--

INSERT INTO `candidate_jd_assoc` (`id`, `candidate_id`, `job_description_id`, `created_at`, `updated_at`) VALUES
(11, 129, 3, '2018-12-14 12:46:15', '2018-12-14 12:46:15'),
(12, 129, 3, '2018-12-17 07:24:31', '2018-12-17 07:24:31'),
(76, 48, 1, NULL, NULL),
(77, 49, 1, NULL, NULL),
(78, 50, 1, NULL, NULL),
(79, 52, 1, NULL, NULL),
(80, 66, 1, NULL, NULL),
(81, 67, 1, NULL, NULL),
(82, 72, 1, NULL, NULL),
(83, 73, 1, NULL, NULL),
(84, 74, 1, NULL, NULL),
(85, 99, 1, NULL, NULL),
(86, 100, 1, NULL, NULL),
(87, 111, 1, NULL, NULL),
(88, 112, 1, NULL, NULL),
(89, 113, 1, NULL, NULL),
(90, 114, 1, NULL, NULL),
(91, 115, 1, NULL, NULL),
(92, 116, 1, NULL, NULL),
(93, 117, 1, NULL, NULL),
(94, 121, 1, NULL, NULL),
(95, 53, 2, NULL, NULL),
(96, 70, 2, NULL, NULL),
(97, 76, 2, NULL, NULL),
(98, 78, 2, NULL, NULL),
(99, 79, 2, NULL, NULL),
(100, 122, 2, NULL, NULL),
(101, 77, 3, NULL, NULL),
(102, 80, 3, NULL, NULL),
(103, 81, 3, NULL, NULL),
(104, 84, 3, NULL, NULL),
(105, 85, 3, NULL, NULL),
(106, 86, 3, NULL, NULL),
(107, 87, 3, NULL, NULL),
(108, 88, 3, NULL, NULL),
(109, 93, 3, NULL, NULL),
(110, 94, 3, NULL, NULL),
(111, 101, 3, NULL, NULL),
(112, 102, 3, NULL, NULL),
(113, 103, 3, NULL, NULL),
(114, 106, 3, NULL, NULL),
(115, 107, 3, NULL, NULL),
(116, 108, 3, NULL, NULL),
(117, 109, 3, NULL, NULL),
(118, 110, 3, NULL, NULL),
(119, 123, 3, NULL, NULL),
(120, 124, 3, NULL, NULL),
(121, 125, 3, NULL, NULL),
(122, 126, 3, NULL, NULL),
(123, 127, 3, NULL, NULL),
(124, 128, 3, NULL, NULL),
(125, 129, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `candidate_user_assoc`
--

CREATE TABLE `candidate_user_assoc` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `technical_round` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_date` date DEFAULT NULL,
  `schedule_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode_of_interview` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `educationl_details`
--

CREATE TABLE `educationl_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `qualification_id` int(10) UNSIGNED DEFAULT NULL,
  `stream` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,2) DEFAULT NULL,
  `university` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `college` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educationl_details`
--

INSERT INTO `educationl_details` (`id`, `candidate_id`, `qualification_id`, `stream`, `percentage`, `university`, `college`, `start_year`, `end_year`, `timestamp`, `created_at`, `updated_at`) VALUES
(16, 48, 4, 'BSC (Physic, Computer, Math’s)', 55.00, 'Sagar University - Chhindwara, Madhya Pradesh', 'Gov. Girls college Chhindwada MP', '2005', '2008', '1540998321', NULL, NULL),
(17, 48, 5, 'MCA', 78.00, 'Rajiv Gandhi Technical University - Bhopal, Madhya Pradesh', 'RKDF college, Bhopal MP', '2008', '2011', '1540998321', NULL, NULL),
(18, 49, 4, 'Bachelor of Engineering in Computer Science and Engineering', 76.40, 'Rashtrasant Tukdoji Maharaja Nagpur University, Nagpur', 'G.H.Raisoni College of Engineering, Nagpur', '2011', '2014', '1540998541', NULL, NULL),
(19, 49, 3, 'Computer Science and Engineeringneering, Nagpur', 75.86, 'MSBTE', 'G.H.Raisoni Polytechnic, Nagpur', '2008', '2011', '1540998541', NULL, NULL),
(20, 50, 5, 'MCA', 63.71, 'Nagpur', 'Shri Ramdeobaba Kamla Nehru Engineering College', '2007', '2010', '1540999256', NULL, NULL),
(21, 50, 4, 'BCS', 60.00, 'Amaravati', 'College of Management and Computer Science, Engineering College', '2004', '2007', '1540999256', NULL, NULL),
(25, 52, 4, 'B.E. (Electronics and Communication Engineering)', 79.14, 'Autonomous', 'Samrat Ashok Technological Institute, Vidisha', '2008', '2012', '1541001978', NULL, NULL),
(26, 52, 2, 'Science', 90.00, 'MP Board', 'Excellence	School, Betul', '2007', '2008', '1541001978', NULL, NULL),
(27, 52, 1, 'Science', 87.40, 'MP Board', 'Excellence	School, Betul', '2006', '2007', '1541001978', NULL, NULL),
(28, 53, 4, 'BE (Information Technology)', 79.31, 'Dr. Babasaheb Ambedkar Marathwada University, Aurangabad.', 'Government College of Engineering, Aurangabad.', '2007', '2010', '1541072620', NULL, NULL),
(29, 53, 2, 'Information Technology', 65.00, 'Nagpur University', 'Shri Datta Meghe Polytechnic College, Nagpur.', '2004', '2007', '1541072620', NULL, NULL),
(30, 53, 1, 'Science', 90.00, 'Nagpur Board', 'Kaka Tilokchand Sindhi Hindi High School, Nagpur.', '2003', '2004', '1541072620', NULL, NULL),
(49, 66, 2, 'Science', 80.88, 'M.P. Board, Bhopal', 'Not Mentioned', '2004', '2005', '1541415751', NULL, NULL),
(50, 66, 4, 'BCA', 70.20, 'M,C.U. Bhopal, MP', 'Not Mentioned', '2006', '2009', '1541415751', NULL, NULL),
(51, 66, 5, 'MCA', 77.50, 'R.G.P.V. Bhopal, MP', 'Not Mentioned', '2011', '2013', '1541415751', NULL, NULL),
(52, 67, 1, 'Science', 72.60, 'CBSE', 'K.P.S BHILAI', '2003', '2004', '1541417535', NULL, NULL),
(53, 67, 2, 'K.P.S BHILAI', 64.60, 'CBSE', 'K.P.S BHILAI', '2005', '2006', '1541417535', NULL, NULL),
(54, 67, 4, 'BE(I.T)', 80.17, 'Chhattisgarh Swami Vivekanand Technical University, Bhilai.', 'S.S.C.E.T BHILAI', '2006', '2010', '1541417535', NULL, NULL),
(63, 70, 1, 'Science', 78.61, 'Not Mentioned', 'Waman Maharaj Vidyalay Saoner', '2007', '2008', '1541420831', NULL, NULL),
(64, 70, 2, 'Science', 66.00, 'Not Mentioned', 'Shivaji Science Collage Nandgaon Khandeshwar', '2009', '2010', '1541420831', NULL, NULL),
(65, 70, 4, 'B.E. (I.T.)', 88.50, 'SGBAU, Amravati', 'Not Mentioned', '2010', '2014', '1541420831', NULL, NULL),
(66, 70, 5, 'PG-DAC', 65.00, 'Not Mentioned', 'Electronic City, Bangalore', '2015', '2016', '1541420831', NULL, NULL),
(68, 72, 4, 'B.E (Electronics and Communication)', 60.14, 'Nagpur', 'PIGCE, Nagpur', '2010', '2014', '1541522419', NULL, NULL),
(69, 72, 3, 'Electronics and Communication Engineering', 66.55, 'Nagpur', 'SDMP, Nagpur', '2007', '2010', '1541522419', NULL, NULL),
(70, 73, NULL, 'B Tech (Electronics)', 65.00, 'Rajasthan University', 'JRN, Rajasthan', '2011', '2014', '1541530288', NULL, NULL),
(71, 73, NULL, 'Electronics', 67.00, 'Nagpur', 'PC, Nagpur', '2008', '2011', '1541530288', NULL, NULL),
(72, 74, 5, 'M.Tech (VLSI)', 68.88, 'Nagpur University', 'SRKNEC, Nagpur', '2007', '2009', '1541581052', NULL, NULL),
(73, 74, 4, 'B.E (Electronics)', 59.34, 'Nagpur University', 'SRKNEC, Nagpur', '2003', '2007', '1541581052', NULL, NULL),
(74, 74, 3, 'Electronics and Communication Engineering', 66.95, 'Nagpur University', 'SDMP, Nagpur', '2000', '2003', '1541581052', NULL, NULL),
(76, 76, 4, 'Computer Science & Engineering', 73.00, 'RTMNU, Nagpur', 'OM college of engineering', '2008', '2012', '1542190386', NULL, NULL),
(77, 76, 2, 'Science', 61.33, 'State Board of Maharashtra', 'NM juniour college, wadner', '2007', '2010', '1542190386', NULL, NULL),
(78, 76, 1, 'Science', 65.33, 'State Board of Maharashtra', 'SSBM high school', '2005', '2006', '1542190386', NULL, NULL),
(79, 77, 4, 'B.E (EEE)', 64.48, 'Jawaharlal Nehru Technological University, Anantapur', 'Siddhartha institute of science and technology, Puttur', '2012', '2016', '1542284515', NULL, NULL),
(80, 77, 2, 'Science', 68.30, 'Not Mentioned', 'Sri Sai Jyothijr. College, Puttur', '2011', '2012', '1542284515', NULL, NULL),
(81, 77, 1, 'Science', 78.50, 'Not Mentioned', 'Jnana JyothiVidyamandhir, Puttur', '2009', '2010', '1542284515', NULL, NULL),
(82, 78, 4, 'B.E (Electronics)', 61.03, 'Autonomous', 'Ramdeobaba College of Engg & Mgmt.', '2011', '2014', '1542435243', NULL, NULL),
(83, 78, 3, 'Diploma (Electronics)', 80.85, 'MSBTE', 'Shri Datta Meghe Polytechnic', '2008', '2011', '1542435243', NULL, NULL),
(84, 78, 1, 'Science', 81.69, 'Maharashtra State Board', 'Yashoda High School', '2007', '2008', '1542435243', NULL, NULL),
(85, 79, 3, 'Essential Diploma for Graduate Engineer (EDGE)', 50.00, 'CMC ACADEMY NAGPUR', 'CMC ACADEMY NAGPUR', '2014', '2014', '1542437180', NULL, NULL),
(86, 79, 4, 'B.E. (Computer Engineering)', 60.52, 'UNIVERCITY OF MUMBAI', 'VIT MUMBAI', '2009', '2013', '1542437180', NULL, NULL),
(87, 79, 2, 'Science', 73.40, 'Central Board of Secondary Education', 'JAWAHAR NAVODAYA VIDYALAYA', '2007', '2008', '1542437180', NULL, NULL),
(88, 79, 1, 'Science', 75.40, 'Central Board of Secondary Education', 'JAWAHAR NAVODAYA VIDYALAYA', '2005', '2006', '1542437180', NULL, NULL),
(89, 80, 4, 'B.E (Electronics & Instrumentation)', 65.00, 'UPTU', 'Not Mentioned', '2009', '2013', '1542461202', NULL, NULL),
(90, 80, 2, 'Science', 67.80, 'CBSE', 'Not Mentioned', '2008', '2009', '1542461202', NULL, NULL),
(91, 80, 1, 'Science', 68.60, 'CBSE', 'Not Mentioned', '2006', '2007', '1542461202', NULL, NULL),
(92, 81, 4, 'B.E (Hons.) Information and Technology', 70.00, 'Nagpur University', 'Not Mentioned', '2008', '2012', '1542462052', NULL, NULL),
(93, 81, 2, 'Science', 75.00, 'Maharashtra State Board', 'Not Mentioned', '2007', '2008', '1542462052', NULL, NULL),
(94, 81, 1, 'Science', 84.00, 'Maharashtra State Board', 'Not Mentioned', '2005', '2006', '1542462052', NULL, NULL),
(98, 84, 4, 'B.E in Electronics and Communication', 65.57, 'Vishveshwariah Technological University (VTU), Belgaum', 'NIEIT, Maysore', '2011', '2015', '1542464366', NULL, NULL),
(99, 85, 3, 'Embedded Systems & Design', 70.00, 'CDAC ACTS PUNE', 'Not Mentioned', '2015', '2015', '1542465573', NULL, NULL),
(100, 85, 4, 'B.E (Electronics& Communication)', 75.20, 'UPTU LUCKNOW', 'Not Mentioned', '2010', '2014', '1542465573', NULL, NULL),
(101, 85, 2, 'Science', 80.88, 'Board of Secondary Examination, Rajasthan', 'Not Mentioned', '2009', '2010', '1542465573', NULL, NULL),
(102, 85, 1, 'Science', 78.50, 'Board of Secondary Examination, Rajasthan', 'Not Mentioned', '2007', '2008', '1542465573', NULL, NULL),
(103, 86, 4, 'B.E (Electronics and Communication,)', 69.00, 'Not Mentioned', 'NIIST-Bhopal', '2006', '2010', '1542604994', NULL, NULL),
(104, 86, 2, 'Science', 69.00, 'Not Mentioned', 'Dayanand Anglo Vedic public school (DAV), Dudhichua', '2005', '2006', '1542604994', NULL, NULL),
(105, 86, 1, 'Science', 68.00, 'CBSE', 'kendriya vidyalaya sangathan(KVS), Singrauli', '2003', '2004', '1542604994', NULL, NULL),
(106, 87, 4, 'Bachelor of Engineering in Electronics and Telecommunication', 64.53, 'Pune', 'Sinhgad Institutes of Technology, Lonavala', '2010', '2013', '1542605040', NULL, NULL),
(107, 87, 3, 'Diploma in Electronics and Telecommunication', 80.06, 'MSBTU', 'Not Mentioned', '2006', '2009', '1542605040', NULL, NULL),
(108, 88, 4, 'B.E. (ELECTRONICS & TELECOMMUNICATION)', 74.46, 'Pune University', 'Not Mentioned', '2012', '2016', '1542618810', NULL, NULL),
(109, 88, 2, 'Science', 71.80, 'CBSC', 'Jawahar Navodaya Vidyalaya', '2009', '2010', '1542618810', NULL, NULL),
(110, 88, 1, 'Science', 80.20, 'CBSC', 'Jawahar Navodaya Vidyalaya', '2007', '2008', '1542618810', NULL, NULL),
(111, 84, 2, 'Science', 70.40, 'CBSE', 'MGMHSS, Bokaro', '2010', '2011', '1542464366', NULL, NULL),
(112, 84, 1, 'Science', 79.80, 'CBSE', 'RPGS, Ramgarh', '2008', '2009', '1542464366', NULL, NULL),
(119, 87, 2, 'Science', 45.83, 'Nagpur', 'Agnihotri school of technology, Wardha', '2005', '2006', '1542605040', NULL, NULL),
(120, 87, 1, 'Science', 47.33, 'Nagpur', 'Agnihotri school of technology, Wardha', '2003', '2004', '1542605040', NULL, NULL),
(130, 93, 4, 'Bachelor of Technology (B-TECH) in Electronics and Communication', 63.00, 'Calicut University, Kerala, India.', 'Vedavyasa Institute of Technology', '2007', '2011', '1542807370', NULL, NULL),
(131, 93, 3, 'Diploma in Electronics', 65.00, 'Kerala Board', 'Koodali higher secondary School, Kannur', '2005', '2008', '1542807370', NULL, NULL),
(132, 93, 1, 'NA', 80.00, 'Kerala borad', 'Raja’s higher secondary School, Kannur, Kerala', '2004', '2005', '1542807370', NULL, NULL),
(133, 94, 4, 'Electronics', 71.00, 'RTMNU', 'YCCE', '2002', '2006', '1542808937', NULL, NULL),
(138, 99, 1, 'dfsfsds', 45.00, 'RTMNU', 'testing clg', '1979', '1999', '1542814531', NULL, NULL),
(139, 100, 1, 'sfdds', 67.00, 'RTMNU', 'text', '2018', '2020', '1542815010', NULL, NULL),
(140, 101, 4, 'B. Tech – Electrical and Electronics Engineering', 60.10, 'Jawaharlal Nehru Technological University Kakinada', 'Ramachandra College of engineering', '2011', '2015', '1542868864', NULL, NULL),
(141, 101, 2, 'Science', 74.70, 'Andhra pradesh State Board', 'SKVS junior kalsala', '2009', '2011', '1542868864', NULL, NULL),
(142, 101, 1, 'NA', 77.80, 'Andhra pradesh State Board', 'Jai Akshara Residential school', '2008', '2009', '1542868864', NULL, NULL),
(143, 102, 4, 'BE - Electronics & Communications', 64.00, 'RTMNU', 'Pandav College of Engineering', '2006', '2010', '1542873158', NULL, NULL),
(144, 102, 2, 'Science', 65.00, 'CBSC', 'Kendri Vidyalaya', '2005', '2006', '1542873158', NULL, NULL),
(145, 102, 1, 'NA', 72.00, 'CBSC', 'Kendri Vidyalaya', '2003', '2004', '1542873158', NULL, NULL),
(146, 103, 4, 'B.Tech in Electronics and Communication Engineering', 62.00, 'APJ Abdul Kalam Technological University, Thiruvananthapuram', 'Malabar college of engineering and technology', '2011', '2015', '1542891075', NULL, NULL),
(147, 103, 2, 'Science', 83.00, 'State Board', 'S.H.S.S. Avanoor', '2010', '2011', '1542891075', NULL, NULL),
(148, 103, 1, 'NA', 85.00, 'State Board', 'S.D.V.H.S ,Peramangalam', '2008', '2009', '1542891075', NULL, NULL),
(155, 106, 4, '(B.E) in Electrical and Electronics Engineering', 84.80, 'Autonomous Under V.T.U', 'B.M.S College Of Engineering', '2012', '2016', '1542953199', NULL, NULL),
(156, 106, 2, 'Science', 87.20, 'CBSE', 'J.N.V Thane', '2011', '2012', '1542953199', NULL, NULL),
(157, 106, 1, 'NA', 80.50, 'CBSC', 'J.N.V Silvassa', '2009', '2010', '1542953199', NULL, NULL),
(158, 107, 4, 'B.E. (Electronics & Telecom.)', 56.60, 'S.R.T.M.U. Nanded', 'MCE Nilanga', '2010', '2017', '1542956010', NULL, NULL),
(159, 107, 2, 'Science', 65.10, 'Nagpur University', 'S.M.J.C.Tirora', '2006', '2007', '1542956010', NULL, NULL),
(160, 107, 1, 'NA', 58.20, 'Mumbai University', 'S.M.H.S. Tirora', '2004', '2005', '1542956010', NULL, NULL),
(161, 108, 4, 'B.E. (Electronics and Telecommunication Engineering)', 78.70, 'Amravati University', 'SSGMCE', '2013', '2016', '1542967663', NULL, NULL),
(162, 108, 3, 'Diploma (Electronics and Telecommunication Engineering)', 85.53, 'Government Polytechnic', 'Government Polytechnic, Amravati', '2010', '2013', '1542967663', NULL, NULL),
(163, 108, 1, 'NA', 92.00, 'State Board', 'Sri Samarth High school', '2009', '2010', '1542967663', NULL, NULL),
(164, 109, 4, 'Electronics & Communications Engineering', 60.50, 'Rajiv Gandhi Proudyogiki Vishwavidyalaya', 'Shri Balaji Institute of Technology & Management', '2011', '2015', '1542970940', NULL, NULL),
(165, 109, 2, 'Science', 60.00, 'MP Board', 'Govt .Excellence Betul', '2010', '2011', '1542970940', NULL, NULL),
(166, 109, 1, 'NA', 72.00, 'MP Board', 'Govt. Excellence Btl', '2008', '2009', '1542970940', NULL, NULL),
(167, 110, 4, 'B.E (Electronics & Tele Comm.)', 60.80, 'Amravati University', 'Dr.Rajendra Gode Institute of Technology & Research, Amravati', '2012', '2015', '1542973504', NULL, NULL),
(168, 110, 3, 'B.E (Electronics & Tele Comm.)', 67.15, 'MSBTE', 'Amravati Polytechnic, Amravati', '2009', '2012', '1542973504', NULL, NULL),
(169, 110, 1, 'NA', 72.15, 'Maharashtra State Board', 'SRKV', '2008', '2009', '1542973504', NULL, NULL),
(170, 111, 4, 'B.Tech (Computer Science & Engineering)', 79.20, 'UPTU', 'Greater Noida Institute of Technology,', '2008', '2012', '1543211398', NULL, NULL),
(171, 111, 2, 'Science', 82.00, 'CBSC', 'NA', '2006', '2007', '1543211398', NULL, NULL),
(172, 111, 1, 'NA', 69.40, 'Bihar School Examination Board', 'NA', '2004', '2005', '1543211398', NULL, NULL),
(173, 112, 4, 'B.E. (CSE)', 61.87, 'Amravati University', 'SIPNA C.O.E.T. Amravati', '2013', '2016', '1543212592', NULL, NULL),
(174, 112, 3, 'Diploma in Computer Engg.', 65.73, 'Diploma in Computer Engg.', 'Diploma in Computer Engg.', '2010', '2013', '1543212592', NULL, NULL),
(175, 112, 1, 'NA', 83.64, 'State Board of Maharashtra', 'Indian Military School, Pulgaon', '2009', '2010', '1543212592', NULL, NULL),
(176, 113, 5, 'NA', 70.50, 'Amity University', 'Amity', '2013', '2015', '1543490794', NULL, NULL),
(177, 113, 4, 'B.E', 68.00, 'UPTU', 'HRIT', '2007', '2011', '1543490794', NULL, NULL),
(178, 113, 2, 'Science', 62.00, 'CBSC', 'Red Rose school', '2006', '2007', '1543490794', NULL, NULL),
(179, 113, 1, 'NA', 63.00, 'CBSC', 'APS Academy', '2004', '2005', '1543490794', NULL, NULL),
(180, 114, 4, 'Electronics', 67.00, 'RTMNU', 'Umrer College of Engineering', '2009', '2013', '1543492769', NULL, NULL),
(181, 114, 2, 'Science', 60.00, 'State Board of Maharashtra', 'Abhinandan Jr. College,', '2008', '2009', '1543492769', NULL, NULL),
(182, 114, 1, 'NA', 68.00, 'State Board of Maharashtra', 'Keshav nagar, Nagpur', '2005', '2006', '1543492769', NULL, NULL),
(183, 115, 4, 'Bachelor Of Engineering(B.E)', 82.00, 'RTMNU,Nagpur University', 'Shri Ramdeobaba College of Engineering and Management, Nagpur', '2011', '2015', '1543496133', NULL, NULL),
(184, 115, 2, 'Science', 76.33, 'State Board of Maharashtra', 'Bharti Krishna Vidhya Vihar', '2010', '2011', '1543496133', NULL, NULL),
(185, 115, 1, 'NA', 84.70, 'ICSE', 'Seventh-Day Adventist Higher Secondary School Nagpur', '2008', '2009', '1543496133', NULL, NULL),
(186, 116, 5, 'MCA', 74.23, 'Jawaharlal Nehru Technological University, Kakinada', 'NA', '2009', '2011', '1543572513', NULL, NULL),
(187, 116, 4, 'BSC', 66.53, 'Andhra University', 'NA', '2004', '2007', '1543572513', NULL, NULL),
(188, 116, 2, 'Science', 66.00, 'State Board of Maharastra', 'NA', '2003', '2004', '1543572513', NULL, NULL),
(189, 116, 1, 'NA', 73.12, 'State Board of Maharastra', 'NA', '2001', '2002', '1543572513', NULL, NULL),
(190, 117, 5, 'MCA', 68.00, 'Nagpur University', 'NA', '2010', '2012', '1543582176', NULL, NULL),
(191, 117, 4, 'BSC', 61.00, 'Nagpur University', 'NA', '2005', '2008', '1543582176', NULL, NULL),
(192, 117, 2, 'Science', 58.00, 'State Board of Maharashtra', 'Rajendra college', '2004', '2005', '1543582176', NULL, NULL),
(193, 117, 1, 'NA', 59.00, 'State Board of Maharashtra', 'New English', '2002', '2003', '1543582176', NULL, NULL),
(203, 121, 4, 'Electronics Engineering', 60.00, 'Nagpur University', 'Gaikwad Patil College of Engineering.', '2010', '2015', '1543841145', NULL, NULL),
(204, 121, 2, 'Science', 56.67, 'State Board of Maharashtra', 'Hislop Junior College', '2009', '2010', '1543841145', NULL, NULL),
(205, 121, 1, 'NA', 79.00, 'CBSC', 'Delhi Public School,Surat', '2007', '2008', '1543841145', NULL, NULL),
(210, 123, 5, 'M. E.', 91.00, 'Birla Institute of Technology, Mesra, Ranchi', 'Birla Institute of Technology, Mesra, Ranchi', '2013', '2015', '1543908257', NULL, NULL),
(211, 123, 4, 'B. T ECH (ELECTRONICS AND C OMMUNICATION )', 84.50, 'Maulana Abul Kalam Azad University of Technology', 'Dr. B. C. Roy Engg. College (W.B)', '2008', '2012', '1543908257', NULL, NULL),
(212, 123, 2, 'Science', 76.00, 'CBSC', 'Delhi Public School, Ranchi', '2007', '2008', '1543908257', NULL, NULL),
(213, 123, 1, 'NA', 88.60, 'CBSC', 'DAV PUBLIC SCHOOL Hazaribagh', '2005', '2006', '1543908257', NULL, NULL),
(222, 124, 5, 'NA', 58.55, 'C-DAC', 'Sunbeam Institute of information Technology Pune', '2011', '2013', '1544001970', NULL, NULL),
(223, 124, 4, 'Electronics & Communication Engineering', 70.07, 'Gujarat Technologic al University, Ahmedabad', 'Maa Kankeshwari Devi Inst Of Technology', '2008', '2012', '1544001970', NULL, NULL),
(224, 124, 2, 'Science', 70.07, 'Gujarat Secondary and Higher Secondary Education Board', 'H.L.Gandhi School', '2007', '2008', '1544001970', NULL, NULL),
(225, 124, 1, 'NA', 75.14, 'Gujarat Secondary and Higher Secondary Education Board', 'Vandana School', '2006', '2007', '1544001970', NULL, NULL),
(226, 122, 4, 'B.E. (IT)', 64.85, 'Rashtrasant Tukadoji Maharaj Nagpur University', 'NA', '2010', '2013', '1543902664', NULL, NULL),
(227, 122, 3, 'Diploma in IT', 77.73, 'MSBTE', 'NA', '2007', '2010', '1543902664', NULL, NULL),
(228, 122, 2, 'Science', 71.50, 'State Board of Maharashtra', 'NA', '2006', '2007', '1543902664', NULL, NULL),
(229, 122, 1, 'NA', 65.20, 'State Board of Maharashtra', 'NA', '2004', '2005', '1543902664', NULL, NULL),
(230, 125, 4, 'BE in Electronics & Communication', 62.41, 'MP University', 'IIST, Indore', '2008', '2012', '1544192984', NULL, NULL),
(231, 125, 2, 'Science', 62.00, 'CBSE Board', 'Jawaharlal Navodaya Vidyalay', '2006', '2007', '1544192984', NULL, NULL),
(232, 125, 1, 'Science', 67.80, 'CBSE Board', 'Jawaharlal Navodaya Vidyalay', '2004', '2005', '1544192984', NULL, NULL),
(233, 126, 5, 'Embedded System Designing', 75.00, 'Central board', 'CDAC ACTS', '2015', '2016', '1544445430', NULL, NULL),
(234, 126, 4, 'Electronics & Communication', 75.00, 'Dr. Babasaheb Ambedkar Marathwada University', 'Deogiri Institute of Engineering and Management Studies', '2012', '2015', '1544445430', NULL, NULL),
(235, 126, 3, 'Electronics & Telecommunication', 80.00, 'Atomonomus', 'Grading in education', '2009', '2012', '1544445430', NULL, NULL),
(236, 126, 1, 'NA', 90.00, 'State Board of Maharashtra', 'Sharda mandir girls high school', '2008', '2009', '1544445430', NULL, NULL),
(237, 127, 4, 'Electronics and Telecommunication', 67.00, 'Mumbai Univerisity', 'Yadavrao Tasgaonkar College of Management and Engineering', '2011', '2014', '1544504173', NULL, NULL),
(238, 127, 3, 'Electronics and Telecommunication', 80.00, 'MSBTE', 'Sahyadri Polytechinic', '2008', '2011', '1544504173', NULL, NULL),
(239, 127, 1, 'NA', 63.00, 'State BOard of Maharashtra', 'Sadhana Vidyalay', '2005', '2006', '1544504173', NULL, NULL),
(240, 128, 5, 'DESD', 65.71, 'CDAC ACTS, Hyderabad', 'CDAC ACTS, Hyderabad', '2014', '2016', '1544506396', NULL, NULL),
(241, 128, 4, 'Electronics & Communication', 73.72, 'Rajiv Gandhi Proudyogiki Vishwavidyalaya', 'Rajiv Gandhi Proudyogiki Vishwavidyalaya', '2008', '2012', '1544506396', NULL, NULL),
(242, 128, 2, 'Science', 71.44, 'M.P Board', 'St. Francis H. S. School', '2007', '2008', '1544506396', NULL, NULL),
(243, 128, 1, 'NA', 81.40, 'M.P Board', 'St. Francis H. S. School', '2005', '2006', '1544506396', NULL, NULL),
(248, 129, 5, 'PGD in Embedded System and Design', 64.57, 'CDAC', 'PGD', '2012', '2013', '1544791574', NULL, NULL),
(249, 129, 4, 'Bachelor of Technology – Electronics and Communication', 69.50, 'GBTU', 'ABES Engineering College, GBTU', '2006', '2012', '1544791574', NULL, NULL),
(250, 129, 2, 'HSC', 80.00, 'CBSE', 'JKG', '2007', '2008', '1544791574', NULL, NULL),
(251, 129, 1, 'ssc', 88.00, 'CBSE', 'JKG', '2005', '2006', '1544791574', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `hobbie_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hobbies`
--

INSERT INTO `hobbies` (`id`, `candidate_id`, `hobbie_name`, `timestamp`, `created_at`, `updated_at`) VALUES
(14, 48, 'NA', '1540998321', NULL, NULL),
(15, 49, 'NA', '1540998541', NULL, NULL),
(16, 50, 'Not Mentioned', '1540999256', NULL, NULL),
(18, 52, 'NA', '1541001978', NULL, NULL),
(19, 53, 'Playing video games', '1541072620', NULL, NULL),
(20, 53, 'Singing', '1541072620', NULL, NULL),
(30, 66, 'Not Mentioned', '1541415751', NULL, NULL),
(32, 70, 'Not Mentioned', '1541420831', NULL, NULL),
(34, 72, 'Playing Outdoor Games', '1541522419', NULL, NULL),
(35, 72, 'Listening Songs', '1541522419', NULL, NULL),
(36, 73, 'Listening Music', '1541530288', NULL, NULL),
(37, 73, 'Playing cricket', '1541530288', NULL, NULL),
(38, 74, 'Listening Music', '1541581052', NULL, NULL),
(39, 74, 'Playing cricket', '1541581052', NULL, NULL),
(41, 76, 'Not Mentioned', '1542190386', NULL, NULL),
(42, 77, 'Not Mentioned', '1542284515', NULL, NULL),
(43, 78, 'Not Mentioned', '1542435243', NULL, NULL),
(44, 79, 'Sketching, Painting, Tattooing, Singing', '1542437180', NULL, NULL),
(45, 80, 'Travelling, Watching Movies, Listening Music', '1542461202', NULL, NULL),
(46, 81, 'Not Mentioned', '1542462052', NULL, NULL),
(49, 84, 'Not Mentioned', '1542464366', NULL, NULL),
(50, 85, 'Playing cricket, Swimming, watching movies', '1542465573', NULL, NULL),
(51, 86, 'Not Mentioned', '1542604994', NULL, NULL),
(52, 87, 'Not Mentioned', '1542605040', NULL, NULL),
(53, 88, 'Reading Novels', '1542618810', NULL, NULL),
(54, 88, 'Badminton', '1542618810', NULL, NULL),
(55, 88, 'Travelling', '1542618810', NULL, NULL),
(57, 93, 'NA', '1542807370', NULL, NULL),
(58, 94, 'Jungle', '1542808937', NULL, NULL),
(59, 99, '	IDEs: Eclipse, Notepad++ and sublime.  	Frameworks: PHP LARAVEL and Express node  ( MVC pattern)', '1542814531', NULL, NULL),
(60, 100, 'ghddd', '1542815010', NULL, NULL),
(61, 101, 'NA', '1542868864', NULL, NULL),
(62, 102, 'NA', '1542873158', NULL, NULL),
(63, 103, 'NA', '1542891075', NULL, NULL),
(64, 106, 'Watching Movies and TV Series', '1542953199', NULL, NULL),
(65, 107, 'Reading, Cooking, Playing video games.', '1542956010', NULL, NULL),
(66, 108, 'NA', '1542967663', NULL, NULL),
(67, 109, 'NA', '1542970940', NULL, NULL),
(68, 110, 'NA', '1542973504', NULL, NULL),
(69, 111, 'NA', '1543211398', NULL, NULL),
(70, 112, 'NA', '1543212592', NULL, NULL),
(71, 113, 'NA', '1543490794', NULL, NULL),
(72, 114, 'NA', '1543492769', NULL, NULL),
(73, 115, 'Exploring new technologies,Cricket,Badminton', '1543496133', NULL, NULL),
(74, 116, 'NA', '1543572513', NULL, NULL),
(75, 117, 'learning new skill, technology', '1543582176', NULL, NULL),
(76, 121, 'Sports,Exploring new AI technologies,reading.', '1543841145', NULL, NULL),
(78, 123, 'NA', '1543908257', NULL, NULL),
(81, 124, 'Meditation,Yoga', '1544001970', NULL, NULL),
(82, 122, 'NA', '1543902664', NULL, NULL),
(83, 125, 'Not Mentioned', '1544192984', NULL, NULL),
(84, 126, 'singing,cooking.', '1544445430', NULL, NULL),
(85, 127, 'Swimming', '1544504173', NULL, NULL),
(86, 128, 'Reading, Cooking & Watching Hollywood Movies', '1544506396', NULL, NULL),
(88, 129, 'NA', '1544791574', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `industrial_experience`
--

CREATE TABLE `industrial_experience` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_in_project` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_or_tools` text COLLATE utf8mb4_unicode_ci,
  `project_description` text COLLATE utf8mb4_unicode_ci,
  `timestamp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `industrial_experience`
--

INSERT INTO `industrial_experience` (`id`, `candidate_id`, `company_name`, `project_name`, `role_in_project`, `language_or_tools`, `project_description`, `timestamp`, `created_at`, `updated_at`) VALUES
(10, 48, 'Not mentioned', 'Medtronic PAH (Programmable Infusion Pump) (US)', 'Associate Consultant', '["[Android,JFrameWork]","[MVP, Mockito]"]', '["Currently working on Medtronic PAH is patient care application, which is capable of providing precise drug delivery for chronic therapy. The Medtronic PAH is the programmable drug infusion system. The PAH pump is implanted under skin and programmed by android tablets. The pump has reservoir to store drug and has mechanism to deliver drug at desired rate. The clinician will configure pump that can deliver medication at either a constant rate or a variable rate. Responsible for new module development (like Drug, Catheter feature), defects fixing and Script app implementation.  Coordination with onshore team, Requirement clarification, Defect Triage Calls."]', '1540998321', NULL, NULL),
(11, 48, 'Not mentioned', 'Verizon FIOS (US)', 'Senior Software Engineer', '["[Android, SQLite database, MVC, OkHttp, Volley Networking Library.]","[NA]"]', '["Verizon FiOS Mobile is an IPTV based application that allows users to stream download and record their content. The application captures the live and on-demand streams and renders them on Android devices. It provides users with TV Guide of channels for the next 7 days. User has the option of interacting with their personal video recorders (IPTV set top boxes) provided by Verizon and perform actions like recording and managing content. Users can download content towhich they have subscribed and play them on their device. Responsible for new module development (like Watch Now feature,Parental control, DVR), defects fixing. Coordination with onshore team, Requirement clarification, Defect Triage Calls."]', '1540998321', NULL, NULL),
(12, 48, 'Not mentioned', 'Kohl’s (US)', 'Senior Software Engineer', '["[Android, SQLite database, Gradle, Volley Networking Library]","[NA]"]', '["The Kohl’s App delivers a unique experience to discover style and savings, anytime, anywhere—online, at home, on the road or in Kohl’s store. You can even use it to check out with Kohl’s Pay and view and create wish lists—all from the palm of your hand. Responsible for leading Product Detail Page, BOPUS (Buy online pickup from store) and Black Friday module. Coordination with onshore team, Requirement clarification, Defect Triage Calls."]', '1540998321', NULL, NULL),
(13, 48, 'Not mentioned', 'Mitel (MBS) SDK (US)', 'Senior Software Engineer', '["[Android, JNI Library]","[NA]"]', '["The Mitel App delivers a unique experience one on one and group chatting feature using JNI library. Also provide facility to share DOC. Images and many more. Responsible for leading Product Detail one-on-one and group chat module. Coordination with offshore team, Requirement clarification, Defect Triage Calls."]', '1540998321', NULL, NULL),
(14, 48, 'Not Mentioned', 'Gemalto (CEPAS Library) (Singapore)', 'Senior Software Engineer', '["[Android, Secure Element]","[NA]"]', '["This is Bank security domain project using Secure Element (save and retrieved data from secure element). Created Library project and Robotium test project (Add test cases).Solve issues in Secure Key Pad Library which is use to provide encrypted keys for security purpose. Involved in Technical Design and implementation for the application as per the Functional Designs. Coordination with onshore team, Requirement clarification, Defect Triage Calls."]', '1540998321', NULL, NULL),
(15, 48, 'Not mentioned', 'Excellon 5 (Mobile Client)', 'Software Developer', '["[Android, WCF Web services, SOAP, SAX Parsing]","[NA]"]', '["Excellon 5 Mobile Client application is developed to automate sale process of automobile companies to provide their customer better service and facility. It enables the user to create Lead and Job card. Also, user can show product catalogue of their products to the customers. App provides, User dashboards: Enables user to see the statistical data like graphs, reports, etc. Enquiry, Job card and Customer Follow up forms. Product catalogue. Responsible for end-end delivery of the application. Responsible for end-end delivery of the application modules."]', '1540998321', NULL, NULL),
(16, 48, 'Not mentioned', 'SOS Claims', 'Software Developer', '["[Android, SQLite database, Animation, handling Camera functionalities, web services]","[NA]"]', '["In this application customer fill all the details which is used for providing the claim by the company. In this application customers will send these details of insurance claims with the capture receipt to the company. Responsible for writing Database, animation, handling Camera functionalities, web services and many more."]', '1540998321', NULL, NULL),
(17, 48, 'Not mentioned', 'Santa’s Magic Phone', 'Software Developer', '["[Android, Web service, Recording, Player]","[NA]"]', '["This application is Christmas occasion based for kids. Using this application kid has a illusion to directly talk with Santa Claus. In manage kid section parents can add his/her child’s name with name recording. Children can call Santa to tell him their Gift lists as many times whenever they like! And Parents can secretly listen to recorded wish list anytime you want in the Hear Wish lists section and you can even email the recording to yourself as save it forever as a keepsake. Parents can encourage behavior by Requesting Santa with Personalized Calls and Message via Selecting from numerous Naughty or Nice prerecorded messages. Children receive the call of Santa on particular time and the amazing factor for child that doesn’t guess how to know Santa about his behavior and habits"]', '1540998321', NULL, NULL),
(18, 49, 'Dolphin RFID Pvt. Ltd', 'Dolphin ATS', 'Senior android developer', '["[java/ Android]","[NA]"]', '["An asset tracking application"]', '1540998541', NULL, NULL),
(19, 49, 'Dolphin RFID Pvt. Ltd', 'Dolphin POS', 'Senior android developer', '["[java/ Android]","[NA]"]', '["A point of sale application made for Jatayu earth center"]', '1540998541', NULL, NULL),
(20, 49, 'Dolphin RFID Pvt. Ltd', 'TrackWizard', 'Senior android developer', '["[java/ Android]","[NA]"]', '["An application for tracking people visiting client sites.(on Google play store)"]', '1540998541', NULL, NULL),
(21, 49, 'Dolphin RFID Pvt. Ltd', 'DolphinUTS', 'Senior android developer', '["[java/ Android]","[NA]"]', '["An user tracking application with features like pickup and drop for schools."]', '1540998541', NULL, NULL),
(22, 50, 'Not Mentioned', 'Cspire', 'Not Mentioned', '["[Xamarin Android]","[NA]"]', '["CSpire is a new generation internet TV application. It is designed and developed for IPTV devices, mobiles and tablets. This application enables user to watch live shows, VOD (Video On Demand) and movies. User can record live content of TV channels and watch them later. It also provides catch-up service for live TV channels, so user can watch missed part of live TV programs. Android Leanback API components used to implement UI for TV screen and the UI for mobile and tablet is implemented using Android UI components."]', '1540999256', NULL, NULL),
(23, 50, 'Not Mentioned', 'AA – MyDrive', 'Not Mentioned', '["[Xamarin Android]","[NA]"]', '["The updated AA MyDrive app for franchisees of the AA Driving School allows our driving instructors to manage their business on the go and manage their pupils learning journey. The AA progression bar monitors and communicates development of key skills, with GPS and telematics providing feedback on each lesson."]', '1540999256', NULL, NULL),
(24, 50, 'Not Mentioned', 'AA – Ldrive', 'Not Mentioned', '["[Xamarin Android]","[NA]"]', '["The AA L Drive app puts your driving lessons in your hands. Track your progress with our new learning to drive syllabus. Some great features to help you pass your test including -Track your progress - your AA instructor will mark your progress after each lesson so you can see exactly how close you are to being test ready. Record your drive - we use telematics to map your route, along with some useful insights into your driving style. “How to” videos - access our suite of videos to continue your development wherever you are. Manage your account - see your lesson history, book future lessons with your instructor and see how much credit you have left."]', '1540999256', NULL, NULL),
(25, 50, 'Not Mentioned', 'BSM – Ldrive', 'Not Mentioned', '["[Xamarin Android]","[NA]"]', '["The BSM L Drive app puts over 100 years of experience in your hands. Track your progress with our new learning to drive syllabus. Some great features to help you pass your test including -Track your progress - your BSM instructor will mark your progress after each lesson so you can see exactly how close you are to being test ready. Record your drive - we use telematics to map your route, along with some useful insights into your driving style. “How to” videos - access our suite of videos to continue your development wherever you are. Manage your account - see your lesson history, book future lessons with your instructor and see how much credit you have left."]', '1540999256', NULL, NULL),
(26, 50, 'Not Mentioned', 'BSM – MyDrive', 'Not Mentioned', '["[Xamarin Android]","[NA]"]', '["The updated BSM MyDrive app for franchisees of BSM allows our driving instructors to manage their business on the go and manage their pupils learning journey. The BSM tutorial wheel monitors and communicates progression of key skills, with GPS and telematics providing feedback on each lesson."]', '1540999256', NULL, NULL),
(27, 50, 'Not Mentioned', 'GCC', 'Not Mentioned', '["[Java Spring, Android]","[NA]"]', '["The Global Customer Conclave (GCC) application is developed for Zensar’ s annual customer event where thought leaders from all over the world come to our global headquarters in Pune for a 3-day grand event that combines engaging sessions with mutual exchange of the best practices in the business. This conference gives Zensarians and industry experts a platform to share their insights, thoughts and knowledge, along with a forum to educate others about new technologies trending across industries."]', '1540999256', NULL, NULL),
(28, 50, 'Not Mentioned', 'Nakumatt CRM', 'Not Mentioned', '["[Android]","[NA]"]', '["Nakumatt CRM mobile application is developed for existing and new customers in Kenya. This application provides people to become a member of Nakumatt global card program to get various benefits on loyalty programs. Nakumatt CRM Mobile App within the CRM which can facilitate its members to view their point balances and transaction history. The Mobile App will also provide a platform for Nakumatt to communicate personalised messages as well as offers, promotions to its members via push notifications. The Mobile App will not just help Nakumatt expand their reach to new customers but also will help increase the wallet share for Nakumatt through innovative features such as Shopping List, Gift Registry and Cooking Recipes."]', '1540999256', NULL, NULL),
(29, 50, 'Not Mentioned', 'BWSSB My Complaint', 'Not Mentioned', '["[Android]","[NA]"]', '["BWSSB MyComplaint mobile application is developed for Bangalore Water Supply and Sewerage Board (BWSSB) to provide facility to lodge complaints, track complaint status, water timing information, kiosks information and BWSSB senior management contact details. This application communicates with PHP web services for lodging, tracking complaints and for data support. XML is used for data transfer over the network. Google maps used for displaying BWSSB kiosks location and getting direction information to kiosks location from user current location. To get direction information Google API Client used in an application.\']', '1540999256', NULL, NULL),
(30, 50, 'Not Mentioned', 'PMC – Smart City', 'Not Mentioned', '["[Android Java Spring]","[NA]"]', '["As Pune city moving forward to become a smart city, PMC Smart city Android application helping PMC community members to understand what are the pros and cons in existing facilities for public in Pune. This application communicates with Java REST web services for data support and user login. JSON is used for data transfer over the network. ViewPager view used to manage response card UI objects for gathering feedback from citizens. Third party library ViewPagerIndicator for displaying page index. Fragments used for creating panel for user sign in and sign up."]', '1540999256', NULL, NULL),
(31, 50, 'Not Mentioned', 'OTTO', 'Not Mentioned', '["[Android]","[NA]"]', '["This project is developed to perform site survey of premium properties. This application is developed using Android native platform and based on client – server architecture. ASP.Net web services are used to provide backend support."]', '1540999256', NULL, NULL),
(32, 50, 'Not Mentioned', 'Intellis', 'Not Mentioned', '["[Android]","[NA]"]', '["Intellis Android application is designed to provide effective, reliable and safe remedy for pain and paraesthesia problem in patient. Intellis application communicates with external devices INS (Implantable Nero-stimulation System) and ENS (External Nero stimulation System) via telemetry. This remedy works better then medicines to suppress pain and paraesthesia without side effects. INS and ENS both connect human spinal cord to block the pain and paraesthesia scenes to reach to brain. Beagle Board is used to implement ZEN tool develop to test telemetry communication between CTM (Clinical Telemetry Module) and INS with Python program and Java client."]', '1540999256', NULL, NULL),
(33, 50, 'Not Mentioned', 'Excellon5 (Mobile Client) (on Google Play store)', 'Not Mentioned', '["[Android]","[NA]"]', '["ExcellonSoft Mobile Client application is designed and developed to automate after sale process of automobile companies to provide their customer better service and facility. This application directly communicates with Excellon cloud server for authentication and other data support. ASP.NET WCF Web Service & XML files use for providing data support to application. SAX parser used to parse XML files. KSOAP library used to create http request object and connect with webservice. Base64 class is used for converting images from byte array to bitmap image. Bluetooth technology used for connecting with Bluetooth enable thermal printer for printing the job cards. Socket programming is used for connecting with printer via WIFI for printing job cards."]', '1540999256', NULL, NULL),
(34, 50, 'Not Mentioned', 'Guest Pad', 'Not Mentioned', '["[Android]","[NA]"]', '["Guest Pad application is developed for five star hotels to provide quick and better facilities to their guests. This application provides information about the food menu, hospitality services, spa services and other useful traveling information. This application provides the security to Android device by disabling the device dashboard keys and restrict user to use other device application. To launch the application when devices booted, it uses Broadcast Receiver and Intent Filters. Android C2DM (Cloud to Device Messaging) is a service is used to send push notifications about server database updates. To analysis the user interaction with the application Google Analytics service is used. ASP.NET Web Service & JSON is used for providing data support to application along with these Base64 class is used for converting images from string format to bitmap image & vice versa."]', '1540999256', NULL, NULL),
(35, 50, 'Not Mentioned', 'Travel Mate', 'Not Mentioned', '["[Android]","[NA]"]', '["Travel Mate application is mainly developed for users those who travel frequently. This application help user to get information related to travel mediums such as train, buses, airlines, etc. User can also get information about hotels and famous tourist places in a particular country. Information about famous hotels and tourist places is maintained in a MySQL database. Weather conditions updates of a particular city can also provide to the user in this application use RSS feed weather links by some weather news sites like The Weather Channel. The XML file received via RSS feed, is parsed using DOM parser. Travel Mate also provides Google Maps facility using Google Android API. XML file is used for defining 2D scale animation for applying opening and closing effect to the information panels."]', '1540999256', NULL, NULL),
(36, 50, 'Not Mentioned', 'Easy Password Generator (on Google Play store)', 'Not Mentioned', '["[Android]","[NA]"]', '["Easy Password Generator application helps user to generate password with different combinations of special characters, upper case alphabets, lower case alphabets and numbers and with upto 64 characters’ length. User can set generated password for different authentication process. User can store generated password or any other sensitive data into safe vault. Java Random class methods used to generate different combinations of password. External mail jar file used to send vault password recovery email on user’s email id. AsyncTask used for implementing thread to handle email send operation."]', '1540999256', NULL, NULL),
(44, 52, 'Infosys Technologies, Pune', 'Not Mentioned', 'Technology Analyst', '["[Android, JAVA]","[NA]"]', '["Not Mentioned"]', '1541001978', NULL, NULL),
(45, 52, 'Tata Consultancy Sevices Limited, Pune', 'Not Mentioned', 'Technology Analyst', '["[Android, JAVA]","[NA]"]', '["Not Mentioned"]', '1541001978', NULL, NULL),
(46, 52, 'Not Mentioned', 'Telstra 24x7 (Telstra	Corporation Limited, Australia)', 'Not Mentioned', '["[Android, JAVA]","[NA]"]', '["Not Mentioned"]', '1541001978', NULL, NULL),
(47, 52, 'Not Mentioned', 'SCB Go (Siam Commercial	Bank, Thailand)', 'Not Mentioned', '["[Android, JAVA]","[NA]"]', '["Not Mentioned"]', '1541001978', NULL, NULL),
(48, 52, 'Not Mentioned', 'MediCoach (Pfizer Pharmaceutical Group, USA)', 'Not Mentioned', '["[Android, JAVA]","[NA]"]', '["Not Mentioned"]', '1541001978', NULL, NULL),
(49, 52, 'Not Mentioned', 'Tateem-1 and Tateem-2 (Pfizer	Pharmaceutical	Group, USA)', 'Not Mentioned', '["[Android, JAVA]","[NA]"]', '["Not Mentioned"]', '1541001978', NULL, NULL),
(50, 52, 'Not Mentioned', 'Smartr (Sony Pictures Entertainments-USA)', 'Not Mentioned', '["[Android, JAVA]","[NA]"]', '["Not Mentioned"]', '1541001978', NULL, NULL),
(51, 53, 'Tquanta Technologies', 'ABC', 'Developer', '["[JAVA]","[NA]"]', '["I Worked with Intellect Design Arena Ltd (A Polaris Group Company ) as a Java Developer worked under a project which is enterprise application based on liquidity solutions for corporate banks.","I was working here since Mar 2015 till Jan 2018. worked on projects applications based on struts 2.0, core java and javascript and oracle database."]', '1541072620', NULL, NULL),
(52, 53, 'Bobtech Solutions Pvt Ltd', 'ABC', 'Developer', '["[JAVA]","[NA]"]', '["I worked here as a Core Java Developer for the project which is an enterprise application based on securities and derivatives daily statement  generation and delivery. The technolgoies used for the project are spring, core java and GWT and GXT."]', '1541072620', NULL, NULL),
(53, 53, 'Aevitas Technologies pvt ltd', 'ABC', 'Developer', '["[JAVA]","[NA]"]', '["I worked here as a Core Java Developer for the project which is an enterprise application based on securities and derivatives daily statement  generation and delivery. The technolgoies used for the project are spring, core java and GWT and GXT."]', '1541072620', NULL, NULL),
(54, 53, 'Not Mentioned', 'Global Liquidity Management', 'Developer', '["[JAVA,Javascript]","[NA]"]', '["Not Mentioned"]', '1541072620', NULL, NULL),
(55, 53, 'Not Mentioned', 'Strive ( Securities and Derivatives Management )', 'Developer', '["[JAVA,Javascript]","[NA]"]', '["Not Mentioned"]', '1541072620', NULL, NULL),
(56, 53, 'Not Mentioned', 'VehicleCampus', 'Developer', '["[Core Java,,Memcached, Html, jQuery (client side Scripting), Ajax, iText 5.3]","[NA]"]', '["VehicleCampus” is a web application which is mainly use by for vehicle seekers and vehicle dealers. VehicleCampus is our ongoing project it still in development phase. The idea behind vehicleCampus is just to show the organized Information to the Vehicle seekers about new vehicle like what the other choices are and which one is convenient for them. Vehicle seekers can directly contact to dealers or service centers from vehicleCampus. It is helpful application for vehicle owners too, like we show what to do if some problem occurs on the way. In this website we use jquery, ajax, jsps struts 2.0 framework and mysql database server and we will implement it on Android, iOS and Blackberry platform."]', '1541072620', NULL, NULL),
(57, 53, 'Not Mentioned', 'Job Portal', 'Developer', '["[Core Java, J2EE (Servlets and JSP’s), Struts 2.0, Mysql, Tomcat 7.0, Memcached, Html, jQuery (client side Scripting), Ajax, iText 5.3]","[NA]"]', '["Job Portal” is for job seekers and employers like “naukri.com”. It list all the job which is posted by employers to our website. By using this website job seekers can easily search the job by their choice. Actually we are implementing nice filter criteria in it for efficient searching for job seekers and for employers to for searching the resumes. In this website we use jquery, Ajax, jsps struts 2.0 framework and mysql database server and I-text for automatic Pdf resume generation."]', '1541072620', NULL, NULL),
(58, 53, 'Not Mentioned', 'Property Listing Web Application', 'Developer', '["[Memcached, Html, jQuery (client side Scripting), Ajax, iText 5.3]","[NA]"]', '["Property Listing Web Application is a project which lists all the new residential and commercial properties. This web Application is build on struts 2.0, JSP’s and servlets with mysql database.This web Application is for the users who are searching the new properties and for builders who want to publish their properties in the market. This web Application track all the user sessions and appropriately send the notifications to the user and builders too regarding the property information.  this website we use jquery, Ajax, jsps struts 2.0 framework and mysql database server."]', '1541072620', NULL, NULL),
(59, 53, 'Not Mentioned', 'XDBDocManager', 'Developer', '["[Memcached, Html, jQuery (client side Scripting), Ajax, iText 5.3]","[NA]"]', '["XDBDocManager is a project which document the database schema in different formats Such as pdf, chm, html files. XDBDocManager is done for a software companies by which project managers, users, team leads can use our product. The solution is XDBDocManager. XDBDocManager gets the database information like username and password and port of the database and according to the database information, it read all the schema information and store it in XDBDocManager’s database which we design in Mysql database server.For Front End we use JSPs for interacting to the users. JQuery and Ajax are used for event handling and backend request and response on pages.The whole application is build on Struts 2.0 framework. It supports multiple databases like Mysql, Oracle, Postgres, IBM DB2, Informix, Ms-sql etc."]', '1541072620', NULL, NULL),
(102, 66, 'Not Mentioned', 'Khanapal', 'Project Developer', '["[Android Studio 1.3,Android SDK, targeting Android devices 4.2 & higher, JDK 1.8]","[NA]"]', '["KhanaPal app is food pal for living a healthier lifestyle. Happy tummy = happy life. Take pictures or enter what you are having by voice and KhanaPal does the rest. No more tedious days of entering food by writing it down or filling in forms. Tracking your food intake has never been this fun. When you feed KhanaPal, the system becomes smarter and more personalized. Through KhanaPal you will know it is time to eat more fruit instead of donuts! What you digest defines how you feel. KhanaPal can be used in many scenarios such as weight watching, food logging, and more. "]', '1541415751', NULL, NULL),
(103, 66, 'Not Mentioned', 'Shift Assistant', 'Project Developer', '["[Android Studio 1.3,Android SDK, targeting Android devices 4.2 & higher, JDK 1.8]","[NA]"]', '["This application is single screen application And always used in background with no user interaction. This is a real time location tracking system which track workforce(hospital nurse) location. Shift assistant application assist to workforce and provide his/her real time activity like if she/he visit then show notification for checked in and check out from particular patient. Hospital Digital portal can watch all activity for each workforce. Using this app we get all the shift information and according to shift we will post workforce location. Using this application user will able to extend his/her shift and this time will be recorded digital care portal. If shift will end then do not post workforce location. Using this application notify user to before shift time and send notification for shift and also send notification before shift end."]', '1541415751', NULL, NULL),
(104, 66, 'Not Mentioned', 'RoundApp', 'Project Developer', '["[Android Studio 1.3, Eclipse IDE 1.6, Android SDK, targeting Android devices 2.3 & higher, JDK 1.6]","[NA]"]', '["This app is camera based app. This app has two parts 1. Single Shoot and 2. Double Shoot. In single shoot user can continuously shoot images till 20 seconds and make those images Spin ,Show images rounded form and also can share with social site (facebook, Twitter and G+). 2. Double Shoot-Here User can connect multiple devices (one of them is Master device and other is slave devices)using same network either  WiFi or Socket .From master  device  shoot image take images from all slave devices and make spin and show this images Spin and can share on social site."]', '1541415751', NULL, NULL),
(105, 66, 'Not Mentioned', 'TruliaCare', 'Project Developer', '["[Android Studio 1.3, Eclipse IDE 1.6, Android SDK, targeting Android devices 2.3 & higher, JDK 1.6]","[NA]"]', '["Communication breakdown significantly impacts in delivering high quality patient care. This happens due to existing infrastructure failing to address the innate complexity in today\'s clinical communication processes. Designed by physicians and nurses, TruliaCare facilitates timely care and team collaboration by enabling communication-driven work flows across all the facilities in a single and comprehensive solution. Features: Secure clinical communication with message status and read receipt: TruliaCare improves the efficiency of clinical communication with encrypted and HIPAA compliant testing, file sharing, video conversation, group chat, message broadcast with real time delivery receipts. Rule based communication: With TruliaCare clinicians can manage communication preferences with multiple rules based on specific activity, condition, time or location. Whiteboard sharing experience: Real time experience of doodling, placing text, sharing images with the all new feature \'Whiteboard\' where clinical team can share opinions and thoughts easily. Care team member availability and on call status: Care team members can view the other member\'s physical and on-call availability with the facility to call/message with quick links. Clinical alerts, notification and escalation: TruliaCare easily provides information about patient schedule, critical orders and results, charge master, drug cost, high risk patients, hospital patients etc. If member doesn\'t respond, automatic escalation is engaged. Routing Algorithm: Smart routing algorithm automatically identifies and provides immediate access to the best available care at every critical moment. TruliaAssist: Context aware intelligent assistance for better health care coordination. Emergencies: Remotely treat emergency cases with rich communication experience. Connects paramedics to care team eg. Neurologists in case of stroke emergencies. "]', '1541415751', NULL, NULL),
(106, 66, 'Not Mentioned', 'Bus tracking   (School Application)', 'Project Developer', '["[JDK 1.6, Eclipse IDE 1.5, Android SDK, targeting Android devices 2.3 & higher]","[NA]"]', '["This application handle all the transport system for any school. This application will uses for Bus Conductor. Using this application we can manage all students trip and drop record also by the video recording feature management can watch all the things which are happening during the trip. Application send current location of bus, record video over trip journey and upload video to Google drive or FTP server in particular Wi-Fi. Application has capability to mark attendance and send attendance to transport systems."]', '1541415751', NULL, NULL),
(107, 66, 'Not Mentioned', 'MDM App', 'Project Developer', '["[JDK 1.6, Eclipse IDE 1.5, Android SDK, targeting Android devices 2.3 & higher, Sqlite(Database)]","[NA]"]', '["This app MDM (Mobile device management) is basically developing for school level or may be in college level in future. This is based on scheduling the events to the students so that they can see for particular event and join them. Like teacher wants to schedule the events or class at particular day or time then he can put his event inside the app calendar which will sync to the Google+ calendar and device calendar as well. So that students will get the alert for that events and can see when it scheduled inside the app. The entire concepts of this app is large enough but main goal is that in this app one device which play role as a device owner have the teacher and remains are for students. If teacher is teaching any topic at device owner, it will broadcast to all students and they can see whatever teacher  is teaching. Because in this app streaming concepts we are using, but entire control have device owner and can control all students devices like : freeze device buttons, dismiss the screen whenever students watching something else apart from whatever teacher is teaching. This will be good enough app for teaching with some restrictions for students and knowledge sharing to the others. "]', '1541415751', NULL, NULL),
(108, 66, 'Not Mentioned', 'TagParent', 'Project Developer', '["[JDK 1.6, Eclipse IDE 1.5, Android SDK, targeting Android devices 2.3 & higher]","[NA]"]', '["TagParent is an instant messaging app for school parents and teachers to enable efficient communication with each other. All NYC schools are preloaded on this app. The app automatically connects parents to other parents and the teacher of their child\'s school and class. The app allows parents and teachers to easily start communicating without having phone numbers or emails of other parents right. Parents and teachers can also form specific interest groups for school bus, dramatics, football and any other group."]', '1541415751', NULL, NULL),
(109, 66, 'Not Mentioned', 'Vagabond', 'Project  Developer', '["[JDK 1.6, Eclipse IDE 1.5, Android SDK, targeting Android devices 5.0 & higher, Sqlite(Database)]","[NA]"]', '["This is Location Based Application In this user Visited location for business  purpose and shade this country and can also drop pin for routes where user visited and user can share this post on social site like face book, twitter and G+. "]', '1541415751', NULL, NULL),
(110, 66, 'Not Mentioned', 'AppMerge', 'UI and Project Developer', '["[JDK 1.6, Eclipse IDE 1.5, Android SDK, targeting Android devices 5.0 & higher, Sqlite(Database)]","[NA]"]', '["This App is basically a Social App. In this cover all app facebook, twitter, Instagram, Tumblr, picassa, YouTube ,vine. Integrate them in a single App and calling API to get data from official site and can change theme styles etc."]', '1541415751', NULL, NULL),
(111, 66, 'Not Mentioned', 'Camasphere', 'Project Developer', '["[JDK 1.6, Eclipse IDE 1.5, Android SDK, targeting Android devices 2.3 & higher]","[NA]"]', '["This App is Location based and video sharing App ,in this App user can upload 360 degree video from admin panel and show on app .User can search video according to their need as video title,video size and video location and play 360 degree on device .User can capture and record video and send to their multiple friend or Social site  and also get posts and likes for particular video."]', '1541415751', NULL, NULL),
(112, 66, 'Not Mentioned', 'Fitness App', 'Developer', '["[JDK 1.6, Eclipse IDE 1.5, Android SDK, targeting Android devices 2.3 & higher, Sqlite(Database)]","[NA]"]', '["This Application is Event based application and used to create update delete event.In this App showing event on Google map and also user can show event detail and event creator profile."]', '1541415751', NULL, NULL),
(129, 70, 'Not Mentioned', 'Carriear Integration (Ecom-Express, Shadow Fax, BlueDart)', 'Software Development Backend Engineer', '["[JDK 1.8, Spring, Hibernate, Restful, MySQL]","[NA]"]', '["Ecom-Express provides APIs to cover every business process involved in the whole  Life cycle of a shipment starts from manifestation until its closure. In order to use  these APIs customers, have to have API credentials and production server IPS  have to be whitelisted in Ecom systems. For setting this up, customers are requested to get in touch with Ecom IT team. "]', '1541420831', NULL, NULL),
(130, 70, 'Not Mentioned', 'Alfred - (Baymax, Mystique, Rocket, Scrooge)', 'Software Development Backend Engineer', '["[JDK 1.8, Spring, Hibernate, Restful, MySQL]","[NA]"]', '["Baymax is an internal portal for Catalogue Evaluation & Correction and its part of"]', '1541420831', NULL, NULL),
(131, 70, 'Not Mentioned', 'Digital Scratch & Win', 'Jr. Software Engineer', '["[JDK 1.8, Spring, Hibernate, Restful, MySQL]","[NA]"]', '["Digital Scratch & Win provides, itching to get some great discount on products. Customer scratch that itch by scratch the card get assured discount on purchase in the campaign period, the coupon received by the customer is completely randomized and its working on assurance logic algorithm. Customer can redeem-ed the scratch coupon online (App, Website) and Offline as well in the campaign period."]', '1541420831', NULL, NULL),
(132, 70, 'Not Mentioned', 'Autobot Processing System', 'Trainee Software Engineer', '["[JDK 1.8, Spring, Hibernate, Restful, MySQL]","[NA]"]', '["This project provided the facility of processing the orders quickly. Operations team can select which products are available in any order and select the available quantities and then do \'Ready To Ship\'. In the background, \'Autobot\'  takes care everything else (like inventory adjustment, correct invoice generation etc.)"]', '1541420831', NULL, NULL),
(133, 70, 'JDK 1.8, Spring, Hibernate, Restful, MySQL', 'Customer Ticketing', 'Trainee Software Engineer', '["[Java, Jsp, Servlet, Mysql]","[NA]"]', '["A Customer Ticketing system is a software that collects all customer support  requests from a wide range of sources and manages them in one location. The customer emails get pulled into a convenient interface where you can easily respond to them. This is the best way to handle customer service emails even when you use several email IDs. The quickest and most convenient  way to communicate chat with customers and understand their concerns better."]', '1541420831', NULL, NULL),
(135, 72, 'Syslogyx Technologies Pvt Ltd', 'EITDS(Electronic Impact cum Time Delay System)', 'Testing Engineer', '["[Atmel Studio, CCS, WIFI, Restful API, Eagle, Proteus]","[NA]"]', '["EITDS is a confidential project as this project is related to the defence. EITDS Testing System is used to test the functional tests of the EITDS system. This system will handle the functional testing of the EITDS as per the DRDO/ARDE standard requirements and collect the required details of the EITDS System and send to server."]', '1541522419', NULL, NULL),
(136, 72, 'Syslogyx Technologies Pvt Ltd', 'Smart Factory Implementation (IIoT)', 'Firmware Engineer', '["[Atmel Studio, WIFI, Restful API, Bluetooth, Proteus]","[NA]"]', '["Smart Factory is a project based on Industrial Internet Of Things (IIoT). The concept is based on Industry 4.0. Factory where everything is controlled in “Human error- Safe” way and tractable to when and where required independent of man, time, area, process capabilities, efficiency etc. and accessible to all who requires Live / updated information. The project consists of collaboration of Embedded hardware, Android Tablet and Mobile based application and Website Application"]', '1541522419', NULL, NULL),
(137, 72, 'Syslogyx Technologies Pvt Ltd', 'SmartModProBus', 'Firmware Engineer', '["[Atmel Studio, Profibus, Modbus]","[NA]"]', '["Energy Meter Monitoring is an Industrial Project. This Project is used to collect the electrical parameter from the energy meter through the modbus (MAX 485) communication lines. This System also convert the electrical parameter value which is in IEEE 754 standard format to human readable value and display the value on serial terminal via RS-232 communication. And also send converted electrical parameter value to the PLC system via profibus (MAX 485) communication line."]', '1541522419', NULL, NULL),
(138, 72, 'Syslogyx Technologies Pvt Ltd', 'Smart TBM', 'Firmware Engineer', '["[Atmel Studio, Restful API, WIFI]","[NA]"]', '["Smart TBM is based on the industrial purpose for the operation of industry machine. Smart TBM is used to check and maintain the life of the different spare parts of the machine. The purpose of the machine is to send the data of the machine (operation of machine/event of machine) to the server as well as to retrieve the data from the server to create events for machine using wireless communication. This project consists of collaboration of Embedded hardware and Website Application."]', '1541522419', NULL, NULL),
(139, 73, 'Syslogyx Technologies Pvt Ltd', 'EITDS', 'Testing Engineer', '["[Atmel Studio, CCS, WIFI, Restful API, Eagle, Proteus]","[NA]"]', '["EITDS is a confidential project as this project is related to the defence. EITDS Testing System is used to test the functional tests of the EITDS system. This system will handle the functional testing of the EITDS as per the DRDO/ARDE standard requirements and collect the required details of the EITDS System and send to server."]', '1541530288', NULL, NULL),
(140, 73, 'Syslogyx Technologies Pvt Ltd', 'Smart Factory Implementation (IIoT)', 'Firmware Engineer', '["[Atmel Studio, WIFI, Restful API, Bluetooth, Proteus]","[NA]"]', '["Smart Factory is a project based on Industrial Internet Of Things (IIoT). The concept is based on Industry 4.0. Factory where everything is controlled in “Human error- Safe” way and tractable to when and where required independent of man, time, area, process capabilities, efficiency etc. and accessible to all who requires Live / updated information. The project consists of collaboration of Embedded hardware, Android Tablet and Mobile based application and Website Application."]', '1541530288', NULL, NULL),
(141, 73, 'Syslogyx Technologies Pvt Ltd', 'SmartModPro Bus', 'Firmware Engineer', '["[Atmel Studio, Profibus, Modbus]","[NA]"]', '["Energy Meter Monitoring is an Industrial Project. This Project is used to collect the electrical parameter from the energy meter through the modbus (MAX 485) communication lines. This System also convert the electrical parameter value which is in IEEE 754 standard format to human readable value and display the value on serial terminal via RS-232 communication. And also send converted electrical parameter value to the PLC system via profibus (MAX 485) communication lines."]', '1541530288', NULL, NULL),
(142, 73, 'Syslogyx Technologies Pvt Ltd', 'Smart TBM', 'Firmware Engineer', '["[Atmel Studio, Restful API, WIFI]","[NA]"]', '["Smart TBM is based on the industrial purpose for the operation of industry machine. Smart TBM is used to check and maintain the life of the different spare parts of the machine. The purpose of the machine is to send the data of the machine (operation of machine/event of machine) to the server as well as to retrieve the data from the server to create events for machine using wireless communication. This project consists of collaboration of Embedded hardware and Website Application."]', '1541530288', NULL, NULL),
(143, 73, 'Syslogyx Technologies Pvt Ltd', 'Smart JH', 'Firmware Engineer', '["[Atmel Studio, Python, USB]","[NA]"]', '["The aim of the project is to control the machine through a web based interface, while keeping track of operation performed by the operator. System is also equipped with internal timer, so that operator should complete the specific task within given time limit, failing will result in degradation on operator performance. The system also has authority to stop the machine if any parameter doesn’t satisfy the provided range. The system was design with mixture of web technology and embedded technology. The system generates the different reports regarding job performed by the operator."]', '1541530288', NULL, NULL),
(144, 73, 'Syslogyx Technologies Pvt Ltd', 'Handheld Metal Detector (HHMD)', 'Firmware Engineer', '["[EMF]","[NA]"]', '["The HHMD is based on VLF (Very Low Frequency) Transmitter & Receiver. The electrical signal generated by the sensor circuit of the detector that is caused by a metal object disturbing the magnetic field generated by the detector. The output response is further used to generate the alarm indication. This device can provide a visual, auditory, and/or vibratory indication. For a visual indication LED is provided. For an auditory indication, the alarm generating device buzzer is used."]', '1541530288', NULL, NULL),
(145, 73, 'Syslogyx Technologies Pvt Ltd', 'Smart Switch BOX', 'Firmware Engineer', '["[Atmel Studio, RF]","[NA]"]', '["The main object of this project is to develop a home automation system with a four button key fob transmitter by using RF (Radio Frequency) technology. Nowadays, houses are gradually shifting from normal switches to centralized control system, involving a remote control transmitter. In order to achieve this, a RF remote is interfaced to the microcontroller on transmitter side which sends ON/OFF commands to the receiver where loads are connected. By operating the specified remote switch on the transmitter, the loads can be turned ON/OFF remotely through wireless technology.\']', '1541530288', NULL, NULL),
(146, 73, 'Syslogyx Technologies Pvt Ltd', 'EDBS (Electronic Detonator Blasting System)', 'Firmware Engineer', '["[Atmel Studio, Python UI, RS485,RS232]","[NA]"]', '["The aim of the project is to design a system such that, It should perform control detonation in mining field. The system comes with programming of detonator from 0-15 sec within 1 msec accuracy. The system is mainly divided into three parts. •	Logger ( Performs Logging of data with respect to Detonator ) •	Blaster ( Performs Logging of Logger with respect to Logger ) •	Detonator ( Stores the relevant data regarding blasting ) The System comes many safety features, such as Detonator once register with logger cannot be used with different logger etc. Detonator can only accepts the blasting command from blaster. FEATURES: •	The System was designed to provide the flexibility to mining engg. While designing the blast pattern. •	Special software was design to program detonator from computer through logger.  •	It also stores the blast report on PC. "]', '1541530288', NULL, NULL),
(147, 73, 'Syslogyx Technologies Pvt Ltd', 'VMDAS (Velocity Measurement)', 'Firmware Engineer', '["[Atmel Studio, Microsemi, FPGA, Atmega2560]","[NA]"]', '["The aim of the project is to acquire the data from 50 sensors, within specific time after getting the trigger signal. A Menu driven system was implemented. The System is equipped with built-in self test for all sensors. Store the data and then display it on LCD. This data is extremely useful while plotting the velocity profile of shrapnel."]', '1541530288', NULL, NULL),
(148, 74, 'SysLogyx Technologies Pvt Ltd', 'EITDS', 'Testing Engineer', '["[Atmel Studio, CCS, WIFI, Restful API, Eagle, Proteus]","[NA]"]', '["EITDS is a confidential project as this project is related to the defence. EITDS Testing System is used to test the functional tests of the EITDS system. This system will handle the functional testing of the EITDS as per the DRDO/ARDE standard requirements and collect the required details of the EITDS System and send to server"]', '1541581052', NULL, NULL),
(149, 74, 'SysLogyx Technologies Pvt Ltd', 'ML Chatbot', 'Firmware Engineer', '["[Python, SQLLite]","[NA]"]', '["Pythom based Chatbot implementation for gathering information on various product related queries. The aim of the project is to understand the use of ML algorithm used in chatbot."]', '1541581052', NULL, NULL),
(150, 74, 'SysLogyx Technologies Pvt Ltd', 'Smart Factory Implementation (IIoT)', 'Firmware Engineer', '["[Atmel Studio, WIFI, Restful API, Bluetooth, Proteus]","[NA]"]', '["Smart Factory is a project based on Industrial Internet Of Things (IIoT). The concept is based on Industry 4.0. Factory where everything is controlled in “Human error- Safe” way and tractable to when and where required independent of man, time, area, process capabilities, efficiency etc. and accessible to all who requires Live / updated information. The project consists of collaboration of Embedded hardware, Android Tablet and Mobile based application and Website Application"]', '1541581052', NULL, NULL),
(151, 74, 'SysLogyx Technologies Pvt Ltd', 'Email Notifier', 'Firmware Engineer', '["[Atmel Studio, Ethernet, Restful API]","[NA]"]', '["The AIM of the project is to sense a machine status signal to see that machine is in ON State/OFF State. When the machine goes form off to on state the device sends command to server to shoot email to the department head to indicate that machine is in breakdown state. when machine goes up another mail shoot by the device which indicate the machine is running state. A web interface is designed with role based management and email configuration screen."]', '1541581052', NULL, NULL),
(152, 74, 'SysLogyx Technologies Pvt Ltd', 'Smart TBM', 'Firmware Engineer', '["[Atmel Studio, Restful API, WIFI]","[NA]"]', '["Smart TBM is based on the industrial purpose for the operation of industry machine. Smart TBM is used to check and maintain the life of the different spare parts of the machine. The purpose of the machine is to send the data of the machine (operation of machine/ event of machine) to the server as well as to retrieve the data from the server to create events for machine using wireless communication. This project consists of collaboration of Embedded hardware and Website Application."]', '1541581052', NULL, NULL),
(153, 74, 'SysLogyx Technologies Pvt Ltd', 'Smart JH', 'Firmware Engineer', '["[Atmel Studio, Python, USB]","[NA]"]', '["The aim of the project is to control the machine through a web based interface, while keeping track of operation performed by the operator. System is also equipped with internal timer, so that operator should complete the specific task within given time limit, failing will result in degradation on operator performance. The system also has authority to stop the machine if any parameter doesn’t satisfy the provided range. The system was design with mixture of web technology and embedded technology. The system generates the different reports regarding job performed by the operator."]', '1541581052', NULL, NULL),
(154, 74, 'SysLogyx Technologies Pvt Ltd', 'Handheld Metal Detector (HHMD)', 'Firmware Engineer', '["[EMF]","[NA]"]', '["The HHMD is based on VLF (Very Low Frequency) Transmitter & Receiver. The electrical signal generated by the sensor circuit of the detector that is caused by an metal object disturbing the magnetic field generated by the detector. The output response is further used to generate the alarm indication. This device can provide a visual, auditory, and/or vibratory indication. For a visual indication LED is provided. For an auditory indication, the alarm generating device buzzer is used."]', '1541581052', NULL, NULL),
(155, 74, 'SysLogyx Technologies Pvt Ltd', 'Smart Switch BOX', 'Firmware Engineer', '["[Atmel Studio, RF]","[NA]"]', '["The main object of this project is to develop a home automation system with a four button key fob transmitter by using RF (Radio Frequency) technology. Nowadays, houses are gradually shifting from normal switches to centralized control system, involving a remote control transmitter. In order to achieve this, a RF remote is interfaced to the microcontroller on transmitter side which sends ON/OFF commands to the receiver where loads are connected. By operating the specified remote switch on the transmitter, the loads can be turned ON/OFF remotely through wireless technology."]', '1541581052', NULL, NULL),
(156, 74, 'SysLogyx Technologies Pvt Ltd', 'EDBS (Electronic Detonator Blasting System)', 'Firmware Engineer', '["[Atmel Studio, Python UI, RS485,RS232]","[NA]"]', '["The aim of the project is to design a system such that, It should perform control detonation in mining field. The system comes with programming of detonator from 0-15 sec within 1 msec accuracy. The system is mainly divided into three parts. •	Logger (Performs Logging of data with respect to Detonator) •	Blaster (Performs Logging of Logger with respect to Logger) •	Detonator (Stores the relevant data regarding blasting) The System comes many safety features, such as Detonator once register with logger cannot be used with different logger etc. Detonator can only accepts the blasting command from blaster. FEATURES: •	The System was designed to provide the flexibility to mining engg. While designing the blast pattern. •	Special software was design to program detonator from computer through logger.  •	It also stores the blast report on PC. "]', '1541581052', NULL, NULL);
INSERT INTO `industrial_experience` (`id`, `candidate_id`, `company_name`, `project_name`, `role_in_project`, `language_or_tools`, `project_description`, `timestamp`, `created_at`, `updated_at`) VALUES
(157, 74, 'SysLogyx Technologies Pvt Ltd', 'VMDAS (Velocity Measurement)', 'Firmware Engineer', '["[Atmel Studio, Microsemi, FPGA, Atmega2560]","[NA]"]', '["The aim of the project is to acquire the data from 50 sensors, within specific time after getting the trigger signal. A Menu driven system was implemented. The System is equipped with built-in self test for all sensors. Store the data and then display it on LCD. This data is extremely useful while plotting the velocity profile of shrapnel."]', '1541581052', NULL, NULL),
(159, 76, 'CEINSYS tech Ltd., Nagpur', 'Skoile', '1. Product owner 2. Team Leader 3.  Android application developer.', '["[1. Android 2. iOS 3. Core Java 4. Swift  5. FCM 6. OSM]","[NA]"]', '["Smart School Information System is a multi tenant application available 24×7 with the school administrator to monitor entire fleet of buses, Includes Dedicated App for parents to monitor bus location and safety of child, Notice from school delivered to parent instantly, Homework get delivered instantly from teacher to your mobile, Know about the school events in advance.  An App specifically for Driver to send location info to server and get the smart driving alert, No specific hardware required. It can be run on any smart phone for driver or parent and on any desktop or tab with internet for school admin, Both Parent and school authorities can monitor bus route violation, over speed incidents, and driver information."]', '1542190386', NULL, NULL),
(160, 76, 'CEINSYS tech Ltd., Nagpur', 'ULB', '1. Team Leader 2. Android application developer.', '["[1. Android 2. Core java]","[NA]"]', '["It is designed for urban local body."]', '1542190386', NULL, NULL),
(161, 76, 'CEINSYS tech Ltd., Nagpur', 'G-Travel', 'Android application developer', '["[1. Android 2. Core java 3. Esri]","[NA]"]', '["It’s tourist guide application for Jamaica Tourism."]', '1542190386', NULL, NULL),
(162, 76, 'Redbytes software pvt. ltd., pune', 'Softbreak Hiring Manager', 'Android application development', '["[1. Android 2. Core java]","[NA]"]', '["The Hiring Manager app aims at providing valuable job searchers/candidates data to Human Resource (HR) professionals like never before. As the HR of a company, you might have experienced difficulty in reaching out to the candidate profiles that matter from your existing data pools. The Hiring Manager app provides highly categorized data that makes it easy for you as an HR to identify candidates according to specific categories. Currently there are categories such as mobile application, web application, e-commerce application, enterprise application, Testing, Digital marketing, Information security, Database, JavaScript, CRM Applications, E-learning, BI Applications, ECM Application and SAP Application."]', '1542190386', NULL, NULL),
(163, 76, 'Redbytes software pvt. ltd., pune', 'Softbreaks Jobseeker', 'Android application development', '["[1. Android 2. Core java]","[NA]"]', '["Softbreaks Jobseeker mobile recruiting app brings all the job openings listed in the top career sites under one roof. Stop running from Monster to Naukri, Shine and Indeed. It\'s all here. This job searching app puts available jobs under simple categories, making it easy for you to find your favorite jobs. We concentrate on technology jobs because it\'s where you find the maximum number of job openings. From websites to mobile and web applications, software is geared to be the life and soul of Jobseeker."]', '1542190386', NULL, NULL),
(164, 77, 'Wipro Technologies', 'HMI development on Infotainment systems', 'Developer', '["[Languages: C, C++.]","[OS/Tools : QNX, JIRA, VISUAL STUDIO, DOORS]"]', '["This project is the development of HMI Applications to the Infotainment System\'s for 4-wheeler cars. In this majorly supports HMI Features implementations enhancement for Infotainment systems Head units. Infotainment systems that deliver entertainment and information content. Developed Settings, Multimedia applications based on the Spec. Typical tasks that can be performed with an in-vehicle infotainment system include managing and system General Settings Screens modules."]', '1542284515', NULL, NULL),
(165, 78, 'Logical Tech Consultants LLP', 'Fund Factory', 'Android Developer', '["[Android, Core Java]","[NA]"]', '["Fund Factory is Crowd funding which is basically system based on non-profit organization. This concept is based on crowd funding. Crowd funding is basically system based on non-profit organization were one will donate for the wellness of other, without expecting anything from others. It’s time to the most important that how one should work smart either then working hard with an investment values nothing in today’s life style, it’s just an investment which we spend for our hotel bill or for a movie expenses."]', '1542435243', NULL, NULL),
(166, 78, 'Logical Tech Consultants LLP', 'Ukey Health', 'Android Developer', '["[Android, Core Java]","[NA]"]', '["Ukey Health Group is actively and professionally behaving in ways that leaves you stronger and better nourished specially in this modern era to make you feel more relaxed, healthy in both the ways physically as well as mentally is our main focus. Good health is more than not being sick. When you are healthy, you enjoy many benefits from life. Play Store URL: https://play.google.com/store/apps/details?id=com.logicaltech.user21.ukeyhealth"]', '1542435243', NULL, NULL),
(167, 78, 'Logical Tech Consultants LLP', 'Wankhede Madam’s Academy', 'Android Developer', '["[Android, Core Java]","[NA]"]', '["Maintaining information like institute, small organization with full details of students, employs also there academic activity, performance, attendance, notice, document sharing to student, maintaining classes etc. Play Store URL: https://play.google.com/store/apps/details?id=com.logical.user21.wankhedeapp"]', '1542435243', NULL, NULL),
(168, 78, 'Logical Tech Consultants LLP', 'Ontario', 'Android Developer', '["[Android, Core Java]","[NA]"]', '["Ontario app is specially made up of marketing media to purchase, invest money in like crypto currency. In this app maintained all transaction up down reports with the help of global bit coin API."]', '1542435243', NULL, NULL),
(169, 78, 'Bhumati Consultancy Services', 'My Wahi', 'Android Developer', '["[Android, Core Java]","[NA]"]', '["Many SME find it difficult to keep track of issue being reported to them. Most of the communication is through emails and every time one has to search emails especially in case of escalations. To address this issue we have launched an affordable solution for SME. Play Store URL : https://play.google.com/store/apps/details?id=com.bhumati.incidentmanagementsystemapp "]', '1542435243', NULL, NULL),
(170, 78, 'Bhumati Consultancy Services', 'QISO Point of Sale Solution (BPOS), Dubai', 'Android Developer', '["[Android, Core Java]","[NA]"]', '["It\'s a tablet only application developed to bring ease of doing business. Application will be solution for retail shop and restaurant. Application basically, has two sections, Restaurant and Retail. In Retail section, operator will scan Barcode of the products selected by customers in their cart using Barcode Scanner. Customer display of POS also get update as per the selection of items along with total price, Retail section works completely offline while restaurant is working online. Restaurant section is token based and on submission, order bill will generate and order will get post to KOT (Kitchen). (QISO Point of Sale Solution (BPOS), Self Service QISO and BPOS KOT is launched and application is running at client location.) "]', '1542435243', NULL, NULL),
(171, 78, 'Bhumati Consultancy Services', 'Bonus', 'Android Developer', '["[Android]","[NA]"]', '["The Bonus App is a FREE marketing platform which allows businesses across all major categories to list Discount and Buy-1-GET-1-FREE Coupons....... FREE of Charge! Users have the opportunity to invite your favorite businesses to join the BONUS community, which will create a permanent income steam coming your way for every Coupon sold! Play Store URL: https://play.google.com/store/apps/details?id=bonusapp.bonus.com.bonusapp&hl=en "]', '1542435243', NULL, NULL),
(172, 78, 'Bhumati Consultancy Services', 'Self Service QISO, Dubai', 'Android Developer', '["[Android, Java, XML]","[NA]"]', '["It’s a tablet only application developed to for QISO Restaurant. Application will be given to customers when they occupy the table, and customer will place the order by selecting food items from various categories and this order will go to Kitchen and POS machine, waiter will print the bill from POS and will take payment from customer. This application is part of QISO POS (BPOS). "]', '1542435243', NULL, NULL),
(173, 78, 'Bhumati Consultancy Services', 'Bazm-E-Urdu, Dubai', 'Android Developer', '["[Android]","[NA]"]', '["This app has been developed to scan tickets of events organized by Bazm-E-Urdu in UAE. Play Store URL: https://play.google.com/store/apps/details?id=com.bhumati.bazm_e_urdu&hl=en (Bazm-E-Urdu is launched and application is running at client location.)"]', '1542435243', NULL, NULL),
(174, 78, 'Bhumati Consultancy Services', 'Physical Inventory App for QISO, Dubai', 'Android Developer', '["[Android, Java, XML]","[NA]"]', '["It’s a mobile application developed to maintain the storage stock count. With the help of this app manage stock add, edit & delete all types of inventory records."]', '1542435243', NULL, NULL),
(175, 79, 'Global logic india ltd.', 'Project 1', 'Software Engineer', '["[Android Studio, Android SDK, Jenkins, GIT]","[NA]"]', '["This application supports 13 medical devices (Neurostimulators). Neurostimulators automatically adjust stimulation to a patient\'s optimal setting. AdaptiveStim automatically recognizes and remembers the correlation between a change in body position and the level of stimulation needed. It offers flexible ambulatory recharge, lengthy recharge intervals, unparalleled programmability, and automatic amplitude adjustments. Spinal cord stimulation is delivered through one or more leads selected from a broad lead portfolio for greater customization of therapy. It is “Class C” application."]', '1542437180', NULL, NULL),
(176, 79, 'Global logic india ltd.', 'Project 2', 'Associate Software Engineer', '["[Android SDK, IntelliJ15,Cucumber, Gherkins, Jenkins, GIT","[NA]"]', '["This application was same as the previous one, only the difference is this application supports 3 different medical devices (neurostimulators)."]', '1542437180', NULL, NULL),
(177, 79, 'Not mentioned', 'Project 3', 'Freelancer', '["[Android, SQLite, MySQL, PHP","[NA]"]', '["It is an Android Application with features of finding bus routes, auto fare, picnic spots etc. in Nagpur City."]', '1542437180', NULL, NULL),
(178, 79, 'Not mentioned', 'Project 4', 'Trainee', '["[Java, Java Swings","[NA]"]', '["It is a Java based System Software, which will have around 4 utilities as mentioned below 1 Duplicate File Search 2 Rarely used file Search 3 Bluetooth Security 4 Temporary File Remover"]', '1542437180', NULL, NULL),
(179, 80, 'Powrtec Energy Pvt. Ltd', 'Prepaid Meter & Smart Meter', 'Firmware Developer', '["[Not Mentioned]","[NA]"]', '["Currently studying the Indian Standard related to smart meter and prepaid meter like IS: 13779, IS: 15884. And making a document related to Encryption & Decryption and the protocol used in the meter as according to Indian standard."]', '1542461202', NULL, NULL),
(180, 80, 'GENESIS', 'Earthing & Neutral Faulty', 'Software design', '["[Not Mentioned]","[NA]"]', '["In this project I have to detect the status of the power supply provided to a power station is on ‘ALL OK’, ‘EARTHING FAULTY’ , ‘NEUTRAL FAULTY’ , ’L&T FAULTY’, ‘LIVE FAULTY’ condition on the basis of intensity of light glowing in the socket holder provided by the power station."]', '1542461202', NULL, NULL),
(181, 80, 'GENESIS', 'Vehicle Tracking System', 'Software design', '["[Not Mentioned]","[NA]"]', '["VTS device is mainly used for catching the location of the Vehicle, which will send the co-ordinate of GPS through GSM module to a particular server, But we add a feature it that this device is also capable of sending the data of different sensor so we provide 6-analog input sensor & 2-Digital input sensor and send the data of the particular sensor to our server."]', '1542461202', NULL, NULL),
(182, 80, 'GENESIS', 'Smart DMS Sub-station', 'Software design', '["[Not Mentioned]","[NA]"]', '["In this project there is three unit i.e. FRTU, DT and RMU. In this project we have to take reading of sensors which are attached to transformer and put these values of sensor to a server using GSM Module"]', '1542461202', NULL, NULL),
(183, 80, 'GENESIS', 'Wireless Attendance System', 'Software design', '["[Not Mentioned]","[NA]"]', '["In this project we have to take the attendance of the employee using biometric sensor and send it to company server for the further processing."]', '1542461202', NULL, NULL),
(184, 80, 'GENESIS', 'Remote control using GSM', 'Software design', '["[Not Mentioned]","[NA]"]', '["In this project we have to control various thing using SMS with the help of GSM module with the location"]', '1542461202', NULL, NULL),
(185, 81, 'Not Mentioned', 'ADIT_LINUX_PORTING', 'Testing, Automation of test cases, Test code development', '["[C, Shell Script ,Unix and Embedded C]","[NA]"]\r\n', '["Testing of a product which is developed on GENIVI platform (iMX6q sabre AI, iMX6q sabre lite etc.) and Intel\'s product (Kendrick peak) for Automotive infotainment domain."]', '1542462052', NULL, NULL),
(186, 81, 'Not Mentioned', 'NSN FLEXI TRANSPORT 9.0', 'Providing support and maintenance', '["[C, Shell Script ,Unix]","[NA]"]\r\n', '["Flexi transport Module, also known as Ariel transport is part of the third generation (3G) networks. It is a transmission sub-module integrated in BTS. It functions as an interface between the BTS and the RNC"]', '1542462052', NULL, NULL),
(187, 81, 'Not Mentioned', 'NSN_BSC_MAINTAINENCE', 'Providing support and maintenance', '["[C, Shell Script ,Unix]","[NA]"]\r\n', '["The scope of this project is to enhance and maintain the functionality of O&M part of the BSC in the GSM domain. It includes the development of new features for the BSC and maintaining the software by fixing issues raised"]', '1542462052', NULL, NULL),
(192, 84, 'Avurtana Learning Pvt Ltd', 'Multi-purpose robotic platform board', 'Design Engineer', '["[Embedded C, Designspark CAD for pcb design, Atmel Studio]","[NA]"]\r\n', '["It uses Atmega 2560 controller and can handle 6 servos , 2 stepper and 4 DC motors. along with that it also includes Analog and Digital Sensors and peripheral vacancies. this robots can be used to construct an 1. Mini 3-Axis CNC machine 2. small and compact humanoid robots. 3. swarm robots 4. various sensor based projects. This robot comes with wireless connectivity option and using Atmega 16U2 controller is has been made on Board re-programmable robot. compact Board design gives an advantage to user to make it handy and portable. This robot can be programmed using different IDE environment both in Assembly and Embedded C coding methods. "]', '1542464366', NULL, NULL),
(193, 84, 'Rove Labs Pvt Ltd', 'Design and development of ECU(Engine Control Unit).', 'Design Engineer', '["[Embedded C, Eagle CAD for pcb design, Atmel Studio, Tuner studio.]","[NA]"]\r\n', '[" An engine control unit is a type of electronic control unit that takes various data from the different sensors present in the vehicle and  controls a series of actuators on an internal combustion engine to ensure optimal engine performance. This ECU uses AT91SAM3X8E a 32-bit ARM core microcontroller and consists of 4 injector channels and 4 ignition drivers."]', '1542464366', NULL, NULL),
(194, 84, 'Rove Labs Pvt Ltd', 'Design and development of 3 axis CNC milling machine.', 'Design Engineer', '["[Embedded C, Eagle CAD for pcb design, keil, Universal G-code sender]","[NA]"]\r\n', '["3 axis CNC machines have simple and intricate parts that can be cut rapidly and precisely with high quality toolpath. The cycle in 3 axis CNC machine can be modified to stay contained in one area or to avoid another area. It is based on Atmega328p microcontroller with 3 stepper motor driver and 5.5 kg Torque stepper motor."]', '1542464366', NULL, NULL),
(195, 84, 'Rove Labs Pvt Ltd', 'Design and development of Health Monitoring Band(IoT)', 'Design Engineer', '["[: Embedded C , designspark CAD, Arduino ide]","[NA]"]\r\n', '["IOT health monitoring band  has 4 sensors. First one is a temperature sensor, second is Heartbeat sensor, third one is humidity sensor and the fourth is force sesnor. All the sensor along with the controller is embedded into a band. This ban is very useful since the doctor can monitor patient health parameters just by visiting website or URL. And nowadays many IOT apps are also being developed. So now the doctor or family members can monitor or track the patient health through the Android apps."]\r\n', '1542464366', NULL, NULL),
(196, 85, 'Visteon Technical Services & Pvt. Ltd Pune', 'Mazda CMU', 'Software Engineer', '["[Not Mentioned]","[NA]"]', '["Performing validation duties for Double-Din In-Car Infotainment system for Mazda Automotive For Visteon, the defect escape rate to the Mazda (Client to Visteon) was very high. We were expected to understand the As-Is Validation process for Visteon and suggest the To-Be followed Validation framework for In-Car Infotainment devices"]', '1542465573', NULL, NULL),
(197, 85, 'Visteon Technical Services & Pvt. Ltd Pune', 'PSA', 'Software Engineer', '["[Not Mentioned]","[NA]"]', '["Performing development duties for cluster system for PSA Automotive"]', '1542465573', NULL, NULL),
(198, 86, 'ISRO', 'ISRO-Bhopal: 16 bit optical encoder design.', 'Trainee', '["[1. Platform Atmel Atmega16,2. Debug: AVR studio4,3. Tools: CVAVR ]","[NA]"]\n\n', '["This project was developed for MCF(master control facility) Bhopal for receiving current position of revolving satellite receiver. We use to send a 16 bit transmitting code to start communication and receives current possition in binary form i.e further decoded into decimal and this decoded signal is transmitted over rs232 to a VB based software where it is display. "]', '1542604994', NULL, NULL),
(199, 86, 'Sarge Green Energy Pvt. Ltd.', 'SMS based Street light Controller with Android App user interface', 'Lead Engineer', '["[1. Platform Atmel atmega8A,2. Debug: AVR studio4, Proteus,3. Tools: CVAVR ]","[NA]"]', '["This project was developed for BMC(Bhopal Municipal Corporation) the aim of this project was to auto ON OFF Streetlights Lights based on time i.e changeable remotely though an android APP. This app only works when it is authorised by a central person through SMS."]', '1542604994', NULL, NULL),
(200, 86, 'SD Electronics', 'Bluetooth based home automation with Android App user interface', 'Lead Engineer', '["[1. Platform Atmel atmega8A,2. Debug: AVR studio4, Proteus,3. Tools: CVAVR ]","[NA]"]', '["This project was developed for providing solution to consumer an easy solution to control home utility such as lamp and speed regulation of single-phase induction motor. User can easily regulateappliances with an Android app this app pass protected that can further change as required, this pass code key to communicate appliances."]', '1542604994', NULL, NULL),
(201, 86, 'Transline Pvt. Ltd.', 'Waste Incinerator control system', 'Lead Engineer', '["[1. Platform Atmel atmega8A,2. Debug: AVR studio4, Proteus,3. Tools: CVAVR ]","[NA]"]', '["This project was aimed to develop a controller for waste incinerator machine that can easily mounted with the system. This project include display to monitor data and keypad to give inputs "]', '1542604994', NULL, NULL),
(202, 86, 'SD Electronics', 'Arduino based Bluetooth control P10 moving message display', 'Lead Engineer', '["[1. Platform Arduino Uno,2. Debug: Arduino, Proteus]","[Tools: Arduino]"]', '["This project was developed for BMC(Bhopal Municipal Corporation) the aim of this project was to auto ON OFF Streetlights Lights based on time i.e changeable remotely though an android APP. This app only works when it is authorised by a central person through SMS. Android App user interface "]', '1542604994', NULL, NULL),
(203, 86, 'SD Electronics', 'IOT sim 300 based Honeywell HIH-4000 sensor.', 'Lead Engineer', '["[1. Platform Arduino Uno,2. Role: Lead Engineer]","[Tools: Arduino]"]', '["This project was developed to monitor and display humidity and temperature of warehouse cold storage and data can easily monitor using website. That is developed by our counterpart."]', '1542604994', NULL, NULL),
(213, 87, 'Nagarjuna Agro Chemicals Pvt. Ltd. Wardha', 'Mrudaparikshak Soil Testing Meter', 'R&D Engineer', '["[Embedded C]","[NA]"]', '["Mridaparikshak can determine soil health. These projects are under the Natural Resource Management (NRM) Division of Indian Council of Agricultural Research (ICAR). Mridaparikshak is a digital mobile quantitative minilab and soil test kit to provide soil testing service at farmer\'s doorsteps. Mridaparikshak determines all the important soil parameters i.e. soil pH, EC, Organic Carbon, available Nitrogen, Phosphorus, Potassium, Sulphur and micronutrients like Zinc, Boron and Iron. It also provides crop and soil specific fertilizer recommendations directly to farmer\'s mobile through SMS. It is highly compatible with soil health card."]', '1542605040', NULL, NULL),
(214, 87, 'Nagarjuna Agro Chemicals Pvt. Ltd. Wardha', 'Soil Test and Fertilizer Recommendation (STFR Meter)', 'R&D Engineer', '["[Embedded C]","[NA]"]', '["Soil testing kit helps the farmers in testing 12 parameters of their soil and recommends fertilizer dose for 100 crops within a short time and at a centre nearby, and thus helps them to achieve higher yields, increase their income and keeps soil fertile. It also prints soil health card and can send soil test report to farmer on SMS."]', '1542605040', NULL, NULL),
(215, 87, 'Nagarjuna Agro Chemicals Pvt. Ltd. Wardha', 'Vehicle tracker system using GPS and GSM', 'R&D Engineer', '["[Embedded C]","[NA]"]', '["In this project, we are going to build an Arduino based vehicle tracking system using GPS and GSM. Tracking of vehicle is a process in which we track the vehicle location in form of latitude and longitude through SMS."]', '1542605040', NULL, NULL),
(216, 87, 'Nagarjuna Agro Chemicals Pvt. Ltd. Wardha', 'GSM based Motor Pump Control', 'R&D Engineer', '["[Embedded C]","[NA]"]', '["In GSM based, the GSM pump controllers (mobile pump starter) are specifically design to operate remote located submersible pumps and motors for benefit of farmers, agriculture people and industries where wireless pump and motor control required"]', '1542605040', NULL, NULL),
(217, 87, 'Phi Audiocom Systems Pvt. Ltd. Pune', 'Microcontroller based cable harness tester', 'Testing and Project Engineer', '["[Embedded C]","[NA]"]', '["It is a test jig unit designed to test various types of harnesses/cables used in connection in communication system. It checks for one to one connections in harness/cable and show alert result if any fault in harness."]', '1542605040', NULL, NULL),
(218, 88, 'KPIT Technologies Pvt Ltd.', 'AUTOSAR R4.2.1 and R4.2.2 BSW Product Development', 'Module Owner (CanSM)', '["[Not Mentioned]","[NA]"]', '["Development and implementation of embedded code and dynamic code (Configuration Specific) for CanSM module. Testing of both the modules with the Functional testing and Unit testing."]', '1542618810', NULL, NULL),
(219, 88, 'KPIT Technologies Pvt Ltd.', 'AUTOSAR R 4.3.1 BSW Product Development', 'Module Owner (CanSM)', '["[Not Mentioned]","[NA]"]', '["Development and implementation of embedded code and dynamic code (Configuration Specific) for CanSM module. Testing of same module with the Functional testing and Unit testing."]', '1542618810', NULL, NULL),
(221, 93, 'Xrevol Technologies (P) Ltd', 'RT1.2, access control system', 'Embedded Software Developer', '["[Tools - Embedded C(Free RTOS)]","[NA]"]', '["RT1.2 is a smart phone and Biometric based access control system targeting offices and schools, for door access and attendance management."]', '1542807370', NULL, NULL),
(222, 93, 'Xrevol Technologies (P) Ltd', 'APSO aXs, access control system', 'Embedded Software Developer', '["[Tools - Embedded C(Free RTOS)]","[NA]"]', '["Apso aXs is a smart phone based access control system targeting offices and schools, for door access and attendance management."]', '1542807370', NULL, NULL),
(223, 93, 'Xrevol Technologies (P) Ltd', 'APSO Smart lock', 'Embedded Software Develope', '["[Tool -  BG Script.]","[NA]"]', '["APSO is a smart lock which can be operated through smart phones. APSO uses Bluetooth Low Energy (Bluetooth 4.0) Version for communication."]', '1542807370', NULL, NULL),
(224, 93, 'Xrevol Technologies (P) Ltd', 'Wifi Bridge for APSO Smart Lock', 'Embedded Software Developer', '["[NA]","[Embedded C (Free RTOS)]"]', '["Wifi Bridge use to unlock APSO Smart Lock remotely or using Biometrics, and to send logs of APSO Smart Lock to web."]', '1542807370', NULL, NULL),
(225, 94, 'SYSLOGYX', 'Project 1', 'Lead', '["[ Languages: C, C++.,OS/Tools : QNX, JIRA, VISUAL STUDIO, DOORS]","[NA]"]', '["Good"]', '1542808937', NULL, NULL),
(228, 99, 'test', 'test', 'test', '["[IDEs: Eclipse, Notepad++ and sublime.,Frameworks: PHP LARAVEL and Express node  ( MVC pattern),Web Services (API): HTTP, RESTful etc.]","[NA]"]', '["IDEs: Eclipse, Notepad++ and sublime.","Frameworks: PHP LARAVEL and Express node  ( MVC pattern)","Web Services (API): HTTP, RESTful etc.","Version control:  Tortoise SVN, Tortoise Git.","Bug Tracking Tool: JIRA and Mantis.","Operation platforms: Windows XP/Vista/7/8.","Others:  Manual testing & debugging."]', '1542814531', NULL, NULL),
(229, 100, 'test', 'test', 'test', '["[IDEs: Eclipse, Notepad++ and sublime.,Frameworks: PHP LARAVEL and Express node  ( MVC pattern),Web Services (API): HTTP, RESTful etc.]","[NA]"]', '["IDEs: Eclipse, Notepad++ and sublime.","Frameworks: PHP LARAVEL and Express node  ( MVC pattern)","Web Services (API): HTTP, RESTful etc.","Version control:  Tortoise SVN, Tortoise Git.","Bug Tracking Tool: JIRA and Mantis.","Operation platforms: Windows XP/Vista/7/8.","Others:  Manual testing & debugging."]', '1542815010', NULL, NULL),
(230, 101, 'Inteamo innovations&Software Pvt. Ltd.', 'Smart Farm', 'Developer', '["[Arduino programming.]","[NA]"]', '["Design a custom board of Atmega2560 Micro-controller with RTC, RF, SD card, SIM module and security chip.","Connect the device to an open source cloud to monitor the device through MQTT protocol.","Create and execute the test cases for each chip.","Provides on board crypto-authentication using ATECC508a for AWS IOT.","Configure XBEE series2 module using XCTU tool.","Connect the sensors to micro-controller using UART, one-wire and I2C protocols.","Reading data from sensors like SHT10, Current, Rain, PIR, temperature (DALLAS, DHT11, DHT22), PH etc.","Configure RTC device DS1370+.","Design and maintain solar power circuit using LT3652 MPPT technique for charging battery.","Component selection for data logger."]', '1542868864', NULL, NULL),
(231, 101, 'Inteamo innovations&Software Pvt. Ltd.', 'Smart Egg Incubator', 'Developer', '["[Arduino programming, Embedded C.]","[NA]"]', '["Development of smart incubator, where controlling, monitoring of all devices and parameters can be done from web or mobile. An open source cloud (CAYENNE) is used to monitor these parameters through MQTT protocol. Build the custom design using ARM Cortex M0 based STM32F103C8T6 Microcontroller Board and Kiel IDE. This Device is connected to ESP8266 Wi-Fi module or GSM (SIM900A) module through UART protocol. So, user can switch Wi-Fi or GSM networks based on their requirements."]', '1542868864', NULL, NULL),
(232, 101, 'Inteamo innovations&Software Pvt. Ltd.', 'Wireless Monitoring in Local Network', 'Developer', '["[Linux and Sybase.]","[NA]"]', '["Designed a wireless Monitoring network, Configured SNMP Agent in ESP8266 using Micro python. Monitoring can be done in local Area Network. MIB’S were taken from the SNMP Manager. Monitoring devices were UPS and PDU. The parameters were Voltage, Current, Frequency. Each parameter is assigned to a GPIO pins an Indication led’s and buzzer gives the status of the devices."]', '1542868864', NULL, NULL),
(233, 102, 'Wipro Ltd, Pune', '1. RDG SIMBA (Credit Suisse : Financial and Banking Solution)', 'Developer', '["[Linux and Sybase.]","[NA]"]', '["Worked in Global Team providing Production, Application support for several Application including Trading application, Corporate Actions and Various Gateway applications. Support include troubleshooting performance problems, file system usages on Linux and Sybase.","Involved in analysis, design and development as well as production support of various software products, specializing in Reference Data Group","Creation of Excel reports for the clients using Perl Modules","Provide on-call support for critical issues","Performed troubleshooting and implemented solution for Control-M jobs."]', '1542873158', NULL, NULL),
(234, 102, 'Wipro Ltd, Pune', '2. ESAB GATEWAY for Welding Machine', 'Developer', '["[Python, Shell Scripting]","[NA]"]', '["ESAB is an IOT based project for monitoring and data acquisition of Welding Machines and passing this data to WeldCloud (an online management system using MQTT protocol). This project involves the development of SBC Gateway software application which provides interfacing of welding machine with remote WeldCloud through Wi-Fi, Wired LAN, or 3G. WeldCloud is an online management system that connects welding power supplies to a software platform that manages data to be analyzed for maximum productivity."]', '1542873158', NULL, NULL),
(235, 102, 'Wipro Ltd, Pune', '3. HMI Development on QNX', 'Developer', '["[C++, QML]","[NA]"]', '["DENSO has developed HMI solutions with Qt framework for automotive system using Qt Quick and Qt-specific declarative language, QML. Denso also has developed modern, intuitive and customized graphics controls for various Infotainment systems."]', '1542873158', NULL, NULL),
(236, 102, 'Amdocs, Pune', '4. AMDOCS DEVELOPMENT CENTER INDIA', 'Developer', '["[C, SQL, Shell, COBOL]","[NA]"]', '["Subject Matter Expert: Worked on Amdocs product Ensemble (Telecom customer care and Billing Solution) Ensemble is product which is BSS (Business Support Solution) for Telecom Clients of Amdocs Ensemble is complete solution for customer management and revenue management which mainly focuses on billing, charging and managing customer accounts."]', '1542873158', NULL, NULL),
(237, 102, 'E-Infochips Ltd. Pune', '5. WirelessHART Gateway System for HART-IP Protocol', 'Developer', '["[Linux]","[NA]"]', '["Gateway that tunnels HART-IP Data in Wireless HART Data and Wireless HART Data to HART-IP Data Also, convert to MODBUS protocol and vice versa. This Project involved following components: - HART Foundation compliance Gateway can connect to multiple HART motes in a mesh network (IEEE 802.15.4) using HART protocol connectivity options include Wired Ethernet, WLAN, Serial, 4-20mA bus HART Modem"]', '1542873158', NULL, NULL),
(238, 102, 'E-Infochips Ltd. Pune', 'WirelessHART Gateway System for MODBUS Protocol', 'Developer', '["[Linux]","[NA]"]', '["Gateway that tunnels Modbus Data in Wireless HART Data and Wireless HART Data to Modbus Data This Project involved following components: - HART Foundation compliance Gateway can connect to multiple HART motes in a mesh network (IEEE 802.15.4) using HART protocol Other connectivity options include Wired Ethernet, WLAN, Serial, 4-20mA bus HART Modem"]', '1542873158', NULL, NULL),
(239, 103, 'Pantech Solutions Pvt Ltd', 'Biometric Time Attendance Machine', 'Software Developer', '["[Software:Arduino IDE .Hardware: ATMEGA 328P, Finger Print Sensor Module .Embedded C.]","[NA]"]', '["Biometric Time Attendance Machine (BTAM) is specifically built to mark the attendance of staffs at hospital and college on the daily basis."]', '1542891075', NULL, NULL),
(240, 103, 'Pantech Solutions Pvt Ltd', 'Smart Green House', 'Software Developer', '["[Software: Raspbian Jesse. Hardware: Raspberry Pi.Python.]","[NA]"]', '["Smart Green House is specifically built to equip agriculture farmers and workers with an infrastructure to monitor, manage and control the agriculture field and greenhouse environment. "]', '1542891075', NULL, NULL),
(241, 103, 'Pantech Solutions Pvt Ltd', 'IOT Based Smart Waste Bins', 'Software Developer', '["[Software: Keil µVision. Hardware:LPC2148(ARM7),Ultrasonic Sensor,ESP8266.Embedded C.]","[NA]"]', '["The scope of this project is to measure the waste level and send to waste collectors and users on the preferred streets."]', '1542891075', NULL, NULL),
(242, 106, 'Robert Bosch Engineering and Business Solutions Pvt Ltd', 'Two Wheeler Engine Management System for BS6', 'Developer', '["[Programming: C and Operating System Concepts, Embedded C, ETAS ASCET, and Assembly Language AUTOSAR tools: BCT Software Management tool: Request One, SDOM Testing: ETAS LabCar, ETAS INCA, On-Vehicle testing, Vector CANalyzer, Busmaster, Madoki, CanDiag and UDE]","[NA]"] ', '["Delivery of Bosch two-wheeler platform software stand (PVER) for various customers"]', '1542953199', NULL, NULL),
(243, 107, 'Klug Avalon', 'Safe Load Indicator System', 'Developer', '["[CAN, 8bit PIC 18F25k80, Embedded C.]","[NA]"]', '["This is a safety system for crane, which used to protect crane by over loading & used sensors like Load pin, WRS & wind speed. It had 2 type of indication visual on LCD & Audible on buzzer."]', '1542956010', NULL, NULL),
(244, 107, 'Klug Avalon', 'SPI Flash Based Display Unit', 'Developer', '["[SST25VF016B Flash, PIC18F6723]","[NA]"]', '["Common display unit for SLI system, where multiple crane data save in single display unit. Make generic display unit for all types of crane."]', '1542956010', NULL, NULL),
(245, 107, 'Klug Avalon', 'WRS (Winch Rotating Sensor)', 'Developer', '["[CAN, 8bit PIC 18F25k80, AS5040 Magnetic Encoder, SPI]","[NA]"]', '["This sensor use for measuring crane trolley length by calculating number of winch rotation in forward or reverse direction."]', '1542956010', NULL, NULL),
(246, 107, 'Ken IT', 'Bird Grading System', 'Developer', '["[Renu HMI, RS485, SiLabs C8051F350, Load cell, MODBUS]","[NA]"]', '["This is a conveyor belt type machine, used for measuring dead chicken weight & divide as per weight grading set by user. Also display weight & number of bird count on HMI unit."]', '1542956010', NULL, NULL),
(247, 107, 'Ken IT', 'Tilt Sensor', 'Developer', '["[PIC 16F1783, LIS3DH, MPLAB, ORCAD]","[NA]"]', '["This sensor used for tilt detection of anti-tank mine. Sensor triggered mine at 25 degree tilt with particular tilt rate. It is very low power device."]', '1542956010', NULL, NULL),
(248, 108, 'EPSON', 'Thailand - DOLT', 'Developer', '["[Eclipse Serial & USB analyzer (Line EYE) ARM & C33 compiler]","[NA]"]', '["Customer requires printing Thai in customized font in passbook printers. Edit Thai font using internal tool Font Runner and design new font/character as per customer expectation.  Implementation for including edited font in firmware. Close interaction with pre sales & post sales team for supporting further tenure."]', '1542967663', NULL, NULL),
(249, 108, 'EPSON', 'PLQ printer’s firmware customization for Malaysia', 'Developer', '["[Eclipse Serial & USB analyzer (Line EYE) ARM & C33 compiler]","[NA]"]', '["This project involves the implement the IBMFP with data printing and interface issue. This includes the design and development and testing the Printers functionality like printing commands, modes (Olivetti, EPSON, and IBM4722) with USB & serial, ARM9 processor."]', '1542967663', NULL, NULL),
(250, 109, 'Tiny Controls Pvt Ltd', 'Hot Foil Stamping Machine Controller.', 'Developer', '["[Keil MDK-ARM v5, Cadsoft Eagle v6.2.0, Embedded C.emWin GUI Builder v5.26..]","[NA]"]', '["Hot foil stamper is a programmable controller intended to control the functions of hot foil stamping machine. It can control four stepper motor and PID temperature controls maximum with their independent parameter settings. Parameters such as motor speed, acceleration, steps per mm are independently configuration for motor."]', '1542970940', NULL, NULL),
(251, 109, 'Tiny Controls Pvt Ltd', 'Single axis step pulse generator.', 'Developer', '["[Renesas HEW v4.09, Cadsoft Eagle v6.2.0, Embedded C.]","[NA]"]', '["The single axis step pulse generator is a powerful and versatile step pulse generator capable of generating step pulse and direction signal output for stepper motor driver. It is a standalone as well as PC controlled linear ramping pulse generator to be used with stepper motor dirver."]', '1542970940', NULL, NULL),
(252, 109, 'Tiny Controls Pvt Ltd', 'Jaquard weaving machine controller.', 'Developer', '["[Cadsoft Eagle v6.2.0]","[NA]"]', '["Jacquard weaving is a device fitted to a power loom that simplifies the process of manufacturing textiles with such complex patterns brocade,damask. brocade, damask."]', '1542970940', NULL, NULL),
(253, 110, 'SCVENS Technology, Nasik.', 'Fuel Level Indication.', 'Software Developer', '["[Embedded C & Kiel v4.]","[NA]"]', '["In this project we measured volume of different fuels using \'Sonarwaves\' [Ultrasonic Sensor]. Accuracy was 100ml."]', '1542973504', NULL, NULL),
(254, 110, 'SCVENS Technology, Nasik.', 'Gas Leakage Detection System.', 'Software Developer', '["[Embedded C &Atmel Studio 6.0. +]","[NA]"]', '["Gas leakage detection system can be easily integrated into a unit that can give a visual suggestion of gas concentration"]', '1542973504', NULL, NULL),
(255, 110, 'iCerebro Technology Pvt.Ltd.', 'Portable Tracking Device.', 'Software Developer', '["[Embedded C &Atmel Studio 7.0. +]","[NA]"]', '["It is a GPS based battery operated tracking system can using for varies purposes. Project is to sending the exact location, speed, and Elevation data to server by GSM device. Device is handy to use & work in online & storing geofencing Co-ordinates for offline (specific designed area) mode. "]', '1542973504', NULL, NULL),
(256, 111, 'Sopra Steria, India', 'Mitro, SDSI.', 'Software Developer', '["[Java]","[NA]"]', '["Mitro (Maintenance management tool) is acronym of Maintenance Repository which involves Prior information sharing to the customer about planned maintenance and outage in the  network. Maintenance outage communication is cascaded to CSMs and Customer on weekly basis. Mitro works for two type of users: CSM : CSM are the Customer Service Manager who can see all the types maintenance on dashboard. Customer : These are the end users who can see the maintenance which is  either validated by CSM or direct impacted events. "]', '1543211398', NULL, NULL),
(257, 111, 'Cognizant Technology Solutions', 'AVMSelect Platform.', 'Software Developer', '["[Windows XP, Eclipse]","[NA]"]', '["Project involves constant innovation in the form of adding new reports, AVMs and new functionality as required by the customer. It also involves daily monitoring of logs. Role and Responsibilities 1) Requirement Analysis. 2) Coding. 3) Unit Testing"]', '1543211398', NULL, NULL),
(258, 111, 'Cognizant Technology Solutions', 'Vector', 'Software Developer', '["[Windows XP, Eclipse]","[NA]"]', '[" Project involves constant innovation in the form of adding new reports, AVMs and new functionality as required by the customer. Role and Responsibilities. 1) Requirement Analysis 2) Coding 3)Unit Testing "]', '1543211398', NULL, NULL),
(259, 111, 'Cognizant Technology Solutions', 'AppraiserSuite', 'Software Developer', '["[Windows XP, Eclipse]","[NA]"]', '["Project involves innovation in the form of appraising properties using public record data, MLS data, Maps, Comparables and transaction history. Role and Responsibilities 1) Requirement Analysis 2) Coding. 3)Unit Testing."]', '1543211398', NULL, NULL),
(260, 111, 'workXmate Technology Pvt. Ltd', 'ERP Product workXmate', 'Software Developer', '["[JEE with JBoss Server, Oracle 11g Database.]","[NA]"]', '["workXmate simplifies the complexities of Business systems so that you can focus on your core business while ensuring that you are following the best practices of the industry leaders. We at workXmate believe that customers\' success is our success. workXmate aims to become a trusted partner contributing to its customers\' success. This is a great responsibility, and one that inspires a whole new sense of energy and urgency in the pursuit of our mission. "]', '1543211398', NULL, NULL),
(261, 112, 'IBM India (Pvt) Ltd', 'Global Integrated Order Management System', 'Software Developer', '["[Tools & Technologies: Java, Hibernate, Jsp, Eclipse. Database: Oracle Operating System: windows NT]","[NA]"]', '["AT&T is the largest provider of local and large distance telephone services in the United States and also sales digital subscriber line internet. It supports the broadband functionalities like ordering, billing and servicing. It is a requirement for GIOM to be migration to the existing system, with a different framework design.Integrated Order Management System (GIOM) provide to process different orders coming from different external systems."]', '1543212592', NULL, NULL),
(262, 112, 'IBM India (Pvt) Ltd', 'TCOE', 'Software Developer', '["[java, Jsp, Servlets, Hibernate, Webservices, Weblogic server, Windows.Database: Oracle, Operating System: windows NT]","[NA]"]', '["Take Charge of Education is Target visa card application. COE application used to enroll the school information to the visa card users and allow searching the school information and designating school to the target visa card. COE is used to update and view the school information and allow Target visa card user to deactivate school with the appropriate description."]', '1543212592', NULL, NULL),
(263, 112, 'Invenger Technologies', 'Enterprise Reservations Rich Internet Application', 'Software Developer', '["[Java, Servlets, JSP, HTML, Java Script, Hibernate, web services ,Spring , Weblogic Server, Oracle Server, Ant.]","[NA]"]', '["The Customer interacts with the RIA reservations system through one of several input forms, or entry points into the reservations system. Our existing business process limits the Customers ability to make changes to their criteria on-the-fly, filter results, and receive a more comprehensive result set. Regardless of feature limitations, a fixed set of input criteria is required at any particular entry point. The mandatory parameters, and their criteria, required performing a single instance of an Agent Gateway request, and the desired expanded multi-request model parameter functionality An Agent Gateway request is expressed using XML."]', '1543212592', NULL, NULL),
(264, 113, 'ST Microelectronics', 'Bluetooth Mesh Network', 'Software Developer', '["[Bluetooth Low Power Energy]","[NA]"]', '["Bluetooth Mesh Network , Many Bluetooth node will be connected to each other which will route the message to the targeted node received from the mobile."]', '1543490794', NULL, NULL),
(265, 113, 'Nippon Audiotronix Pvt Ltd', 'Reverse Parking Assist System', 'Software Developer', '["[Ultra Sonic Sensor Based]","[NA]"]', '["RPAS System works on the Ultra sonic sensor which transmit and receives signal and detects the obstacle behind the vehicle and calculates the distance of obstacle from the vehicle."]', '1543490794', NULL, NULL),
(266, 113, 'Ambience Monitoring India.', 'Pollution Monitoring System', 'Software Developer', '["[Pollution Monitoring Sensors detection Pollutants.]","[NA]"]', '["Device was hand held with a LCD Screen which shows the Pollution data like CO2, PM10 , PM2.5 detected by Sensor."]', '1543490794', NULL, NULL),
(267, 113, 'Smooth Power System', 'Home Automation System', 'Software Developer', '["[Bluetooth and RF Technology]","[NA]"]', '["Data send by Mobile Android App to the Bluetooth connected with controller and send data with RF to another node to control the lighting of home."]', '1543490794', NULL, NULL),
(268, 113, 'Smooth Power System', 'Colour changing and dimming of light', 'Software Developer', '["[Bluetooth technology and power electronics]","[NA]"]', '["Change the colour of light with mobile app and control the light brightness with manual Power switch Press in number of counts."]', '1543490794', NULL, NULL),
(269, 114, 'Allmact Management Pvt. Ltd.', 'Sahajayoga Center Finder (Android App)', 'Developer', '["[JAVA]","[NA]"]', '["This is an android application for Sahajayoga comprising of more than 10000+ centers across India which gives self-realization and teaches ancient meditation technique in scientific way. This application provides the details about nearest Sahajayoga meditation center near to your location."]', '1543492769', NULL, NULL),
(270, 114, 'Allmact Management Pvt. Ltd.', 'Java application deployment on AWS cloud', 'Developer', '["[JAVA]","[NA]"]', '["In this project one of college developed Java Application for registration for various competitions and voting across students. But this application lags when there is huge load comes on this application due to server capacity. So we deploy that project on AWS cloud using AWS Elastic BeanStalk. So I have experience of deployment activity of Java application on AWS cloud."]', '1543492769', NULL, NULL),
(271, 114, 'Allmact Management Pvt. Ltd.', 'Payment Arrangement Grid', 'Developer', '["[JAVA]","[NA]"]', '["Payment Grid is banking domain project for T-Mobile US and used for setting arrangements of payment taken from Debtor by Executive. Depending upon the condition or the availability of funds with debtor, executive sets payment arrangement weekly, bi-weekly, quarterly also takes digital cheques, CW payments, Card payments along with card details or account and routing number. This grid provides facilities to executive for setting up of a payment arrangements using parameters frequency or offering settlement of the complete debt and taking immediate payment as well as post dated payments."]', '1543492769', NULL, NULL),
(272, 114, 'Allmact Management Pvt. Ltd.', 'CARMA (Compliance and Risk Management Auditor)', 'Developer', '["[JAVA]","[NA]"]', '["The Compliance and Risk Management Auditor is Telecom Data Aggregation project for AT&T US it  creates the first system executively build for the Account Receivables (ARM) industry to deliver the value of the BYOBI (Being Your Own Business Intelligence) model for the data aggregation, administration and automation. CARMA is to improve liquidity and compliance for collections and credit industries."]', '1543492769', NULL, NULL),
(273, 114, 'Allmact Management Pvt. Ltd.', 'Set-up a Compliant Archive & Hosting static Web site', 'Developer', '["[JAVA]","[NA]"]', '["From here I start my AWS career. In this project we are ask to host one static website on cloud in multiple availability zones to reach that website from all over the world as much fast it can. So we use Cloudfront as a service of a AWS to host a static website."]', '1543492769', NULL, NULL),
(274, 114, 'Allmact Management Pvt. Ltd.', 'Dairy Management', 'Developer', '["[JAVA]","[NA]"]', '["Theme:- It includes data from remote machine as a fat contained and calculate rate of milk with respect to fat percentage. And also generate report and store to database. Currently this application providing service at Jain Dairy Bhandara (MS)."]', '1543492769', NULL, NULL),
(275, 115, 'Infosys Ltd.', 'B2B Resilience', 'Developer', '["[Java, Spring Boot, Node.js, Swagger, AWS, Docker, Terraform, ELK, New Relic, Nginx, Consul, Redis]","[NA]"]', '["Telstra is Australia\'s leading telecommunications and media company which   builds and operates telecommunications networks and markets voice, mobile, internet access, pay television and other entertainment products and services Part of a development team for creating 6 micro-services (Gateway services) for Telstra applications like ISL-FUL,  OM-FUL to communicate with NBN Co.(Provides infrastructure or broadband network within Australia). Developed Java microservices using Spring Boot, JAX-B, Eclipse Link (Moxy), Active MQ, EMS-BB and Apache Camel Worked as a DevOps team which included hands-on AWS services like CodeCommit , CI/CD,CloudFormation,ECS,S3,ELB,AutoScaling,Route53 and Docker for Containarisation, etc. Developed Terraform scripts to automate the provisioning of complete Infrastructure HandsOn in tools like ELK(Elasticsearch Logstash kibana) and Splunk Did small enhancements in Ansible scripts, ran bamboo build and deploy plans Got onsite opportunity (Australia) for Short term – 3 months Development Methodology : Agile "]', '1543496133', NULL, NULL),
(276, 115, 'Infosys SEZ', 'B2B Support', 'Developer', '["[Java ,Node.js, Swagger, AWS, Docker, ELK, Consul, Redis  Ansible, Bamboo]","[NA]"]', '["Production support for B2B gateway"]', '1543496133', NULL, NULL),
(277, 115, 'Infosys SEZ', 'Exelon', 'Developer', '["[Java, Spring MVC, Hibernate, REST Webservices, Oracle DB]","[NA]"]', '["Exelon is the leading U.S. competitive energy provider, with one of the cleanest and lowest-cost power generation fleets and largest retail customer bases in the country. Provide Application Support to Java related applications in Non-Customer Tower. Work on Java enhancement tickets  Provide L2/L3 support for all applications Appreciated by Client Sole handedly supporting Power Plant Application and other java related interfaces "]', '1543496133', NULL, NULL);
INSERT INTO `industrial_experience` (`id`, `candidate_id`, `company_name`, `project_name`, `role_in_project`, `language_or_tools`, `project_description`, `timestamp`, `created_at`, `updated_at`) VALUES
(278, 116, 'Intellect Design Arena Ltd', 'CorporateCIF', 'Developer', '["[Core Java, Jsp, Spring, Hibernate, JBoss, Oracle, Jquery]","[NA]"]', '["Corporate CIF application migrated project with existing functionality with new  futures for firm registration. The aim of this project to create CIF new customer.This application have 6 module like business information address info stock portrate info and authorization"]', '1543572513', NULL, NULL),
(279, 116, 'Intellect Design Arena Ltd', 'Interface Tool', 'Developer', '["[Core Java, Jsp, Html, JavaScript, Tomcat, Jquery, Ajax]","[NA]"]', '["Interface Tool aim  to eliminate manual testing of Application Interfaces (API) connected to FCRR/FCRCBS and test them by automatically creating test cases, test data and generate difference of the report based on API responsethis application contains five module like fullrun,testdata generator,xml generation,interface simulation and diff report."]', '1543572513', NULL, NULL),
(280, 116, 'Intellect Design Arena Ltd', 'CIB(Corporate Internet Banking)', 'Developer', '["[CIB(Corporate Internet Banking)]","[NA]"]', '["CIB is used to provide services to corporate users and The main objective of CIB is to do Fund Transfers.There are 3 types of Fund Transfers.Main thing is three different type fund transfers 1) Same CIF (Transfer Funds to same corporate within Shinsei Bank) 2) Diff CIF (Transfer Funds to another corporate within Shinsei Bank) 3) Zengin (Third Party Fund Transfer) CIB  contains mainly 2 core modules.1)Back Office,2)Front Office "]', '1543572513', NULL, NULL),
(281, 116, 'iMal  Product', 'Path Solutions', 'Developer', '["[Core Java, Jsp, Spring, Mybates, Struts, Html, JavaScript, Jquery, Ajax, Tomcat and  Oracle.]","[NA]"]', '["iMal is new generation of comprehensive product of Islamic bank application. This product provides full support to various function within the organization like Corporate &Retails banking, Investment banking, financing, treasury & brokerage, settlement, funds and portfolios, trade finance, facility management ,cif, profit calculation, personal banking."]', '1543572513', NULL, NULL),
(282, 117, 'In-solutions Global Ltd.', 'UPI (NPCI [Syndicate Client]', 'Developer', '["[Java 1.8,J2ee,Oracle ,Web Services, Restful, WSDL,Eclipse]","[NA]"]', '["UPI is android based application interaction with server side web services build using JAX-RS and also use SOAP services for third party company NPCI. We are used NPCI common lib for register device and others API call for send money and request money [Issuer Bank and Acquire Bank]."]', '1543582176', NULL, NULL),
(283, 117, 'In-solutions Global Ltd', 'SMS PAY (HDFC client)', 'Developer', '["[Java 1.8 ,J2ee,Jquery,Oracle,Json,Spring,Eclipse]","[NA]"]', '["SMS Pay application consists of three module like SMS PAY PORTAL , DIGI POS,SMS transaction process and also use third party FSS for transaction flow for authentication and authorization with Merchant and customer information for Payment."]', '1543582176', NULL, NULL),
(284, 117, 'In-solutions Global Ltd', 'GLC (GOVERNMENT LAW COLLEGE)', 'Developer', '["[Java 1.8 ,J2ee,Jquery,Oracle,Json,Spring,Eclipse]","[NA]"]', '["GLC is Government Law College , Mumbai with including Admission Process,  Attendance Process, Examination Process, KT process, Download I-card with details."]', '1543582176', NULL, NULL),
(285, 117, 'Klouddata Labs Pvt. Ltd', 'Dealer In Box ( 4G Jio Project )', 'Developer', '["[Java 1.6,J2ee,Jquery,Mysql,Spring, Hibernate , Eclipse,Linux]","[NA]"]', '["DIB (Dealer In Box) is basically a Android App which will be used by all store  located geographically  in India . using this app dealer or agent can place new order for “Reliance JIO” 4G sim or MI-FI or Etc As any new order come through this app. Android app sends a request to MAPP server that is using java as a programming language.After Mapp middle ware server gets the request we send request to SECO (Conversion Layer)  which is used to convert any request and response to desired format for next system. From SECO it goes to TIBCO , its an Web Service layer which used to give web-service that Map server consume and use to get required details from down stream systems Then It goes to CRM or ERP depends on data provided"]', '1543582176', NULL, NULL),
(286, 117, 'Propectech [Vista Software]', 'OCWNGP  [Client : OCWNGP]', 'Developer', '["[Java 1.7 , Jquery ,Eclipse-RCP, Ibatis, Postgresql , Maven, Spring MVC 3.0,Ubuntu ,Eclipse]","[NA]"]', '["It is an water billing unit automation software. It is used to take water meter reading and capture meter photo from any android mobile and send the meter photo along with the reading to the server on server side java code is used for receiving data and storing it. Further this reading   and meter images are used to generate bills."]', '1543582176', NULL, NULL),
(287, 121, 'ATOS Syntel', 'SPOT Recognition', 'Software Developer', '["[NET, MS SQL]","[NA]"]', '["The application was developed in order to appreciate the employees who have helped or provided their inputs for the betterment of software developed.Technologies used : .Net and MSSQL."]', '1543841145', NULL, NULL),
(288, 121, 'ATOS Syntel', 'Idea Junction', 'Software Developer', '["[NET, MS SQL]","[NA]"]', '["The application was developed in order to provide new and innovative ideas for the benefits of company in terms of software automation,or for cutting down workforce etc."]', '1543841145', NULL, NULL),
(289, 121, 'ATOS Syntel', 'Clearence', 'Software Developer', '["[JAVA,MS SQL,Angular 4.]","[NA]"]', '["This application was developed for transferring Syntel employees from one location to other."]', '1543841145', NULL, NULL),
(290, 121, 'ATOS Syntel', 'Transit House Portal', 'Software Developer', '["[Java Spring Boot,Maven,Spring MVC,Restful services,Angular Js,MSSQL,MySQL.]","[NA]"]', '["This application is basically a kind of hotel booking application.Transferred employees or guests who need company\'s guesthouse. Functionalities like room booking, checkin ,checkout etc is taken care through this application."]', '1543841145', NULL, NULL),
(291, 121, 'ATOS Syntel', 'Seat Utilization', 'Software Developer', '["[Java Spring Boot,Maven,Spring MVC,Restful services,Angular Js,MSSQL,MySQL.]","[NA]"]', '["This application was developed for allocating seats to the transferred employees or the new joinees.Basically the application keeps records of current location of all the employees of comapny."]', '1543841145', NULL, NULL),
(296, 123, 'Aadyah Aerospace Private Limited', 'Rustom 2 Linear Actuator', 'Design Engineer – Hardware and Software', '["[Orcad, CCS, LABView for GUI Development for Testing,TMS320F28335 DSP]","[NA]"]', '["The primary function of the R2LA is to give the required angular movement for the flaps of the UAV based on the command and the feedback from the LVDT."]', '1543908257', NULL, NULL),
(297, 123, 'Aadyah Aerospace Private Limited', '2-Axes UV Light Positioning System', 'Design Engineer – Hardware and Software', '["[Altium, CCS, LABView for GUI Development for Testing,TMS320F28335 DSP]","[NA]"]', '["The angular movement of the UV-Light is to be controlled based on the profile – Manual and Automatic Mode to disinfect the passenger seats of AIRBUS. The potentiometer is used to provide the feedback of the angular movement."]', '1543908257', NULL, NULL),
(298, 123, 'Aadyah Aerospace Private Limited', 'AGRICULTURE PAYLOAD BOARD', 'Design Engineer – Hardware and Software', '["[Altium, CCS, TMS320F28335 DSP]","[NA]"]', '["The Payload Board was responsible for supplying power for the motor and atomisers used for spraying pesticides in agricultural field through drone. The device is under testing owned by M/S General Aeronautics."]', '1543908257', NULL, NULL),
(299, 123, 'IBM India Pvt. Limited', 'Navistar International Trucks and Cars', 'Developer', '["[SQL]","[NA]"]', '["The Client had many servers hosted on SQL. As a Database Administrator, I was responsible for the performance, integrity and security of a database. I was also involved in the planning and development of the database, as well as troubleshooting any issues on behalf of the users."]', '1543908257', NULL, NULL),
(314, 124, 'Secure meter Ltd.', 'Digital Panel Meter', 'Embedded Firmware Engineer', '["[IAR]","[NA]"]', '["MSP430 and NXP microcontroller based Digital Panel meter to measure voltage, current, Power, PF, Frequency, and display parameters on Multiplexed Seven Segment Display and send it to remote system over Rs485 using Modbus protocol. User interface having capacitive touch pad to configure parameters using Menu system."]', '1544001970', NULL, NULL),
(315, 124, 'Teksun Microsys pvt Ltd', 'Smart Socket', 'Hardware developer', '["[orcad, proteus]","[NA]"]', '["Designed fire alarm detection circuitry.MSP430G2553 controller use for sound recognition and AC power consumption circuit. Role in project-Designed fire alarm detection circuitry. MSP430G2553 controller use for sound recognition and AC power consumption circuit."]', '1544001970', NULL, NULL),
(316, 124, 'Teksun microsys pvt ltd', 'Smart Farm', 'Developer', '["[orcad,keil]","[NA]"]', '["Solar operated IoT based Agriculture related project.capture data from soil and atmosphere and transmit on cloud server using wifi,GSM,satellite communication."]', '1544001970', NULL, NULL),
(317, 124, 'LB electro product', 'A uto power mode in 4P machine which is use diamond Industries', 'Developer', '["[MIcro pic, MPLAB]","[NA]"]', '["P IC16F877A controller and DAC7621 12 bit DAC ic it is control to laser diode power supply which is use diamond cutting machine"]', '1544001970', NULL, NULL),
(318, 124, 'LB electro Product', 'Warp-​​ Worf circuitry is use in textile industries', 'Software development', '["[MPLAB]","[NA]"]', '["When any thread got break in making clothes","Circuit detect that broken thread and stop the machine to improve quality of clothes."]', '1544001970', NULL, NULL),
(319, 124, 'LB electro Product', '​​ Stepper Motor control for Automation Incense sticks machine.', 'Software development', '["[MPLAB]","[NA]"]', '["In this project we have used bidirectional stepper motor with encoder to controls robotic activity."]', '1544001970', NULL, NULL),
(320, 124, 'LB electro Product', 'Home Automation.', 'Software development', '["[8051]","[NA]"]', '["fan and AC plug control using IR remote."]', '1544001970', NULL, NULL),
(321, 122, 'Ascent Business Solution', 'E-Lala', 'Developer', '["[Google GCM, CCAvenue, Cart Mangement, Liquid Coupons, google map]","[NA]"]', '["E-Lala online shopping mobile app, you can now shop anywhere and everywhere in India. Select your city and local retailer and start exploring the latest products for electronics, fashion, grocery and many more."]', '1543902664', NULL, NULL),
(322, 122, 'Ascent Business Solution', 'DRN (Deals Right Now)', 'Developer', '["[Google GCM, CCAvenue, Cart Mangement,Glide Lib etc.]","[NA]"]', '["Deals Right Now is an innovative solution which allows you to get the best value for your monies by providing you highly localized & targeted offers, discounts & deals. With easy redemption options for coupons generated and payment through online payment gateway (CCAvenue)."]', '1543902664', NULL, NULL),
(323, 122, 'Ascent Business Solution', 'FFD (Freedom From Diabetes)', 'Developer', '["[Openfire server, Firebase, FCM, MySQL, XMPP, Firebase, Openfire Server (Smack 4.0), Volley,Picasso Lib.]","[NA]"]', '["Freedom from diabetes is diabetic patient app in which patients can put their vitals and can communicate with doctors, patient and mentors with the same as chatting application using XMPP and Openfire Server. In this the recipe tab is there from which patient can view the diabetic food details. In this in doctor login, doctor can prescribe medicine and insulin from the app. And can view Rx and vitals from the app."]', '1543902664', NULL, NULL),
(324, 122, 'Ascent Business Solution', 'RCM Analytics', 'Developer', '["[Android MP Chart etc.]","[NA]"]', '["RCM Analytics app is design to represent data graphically to the user. Data can retrieve from server API and display Bar, Pie, Line-chart and its comparison on user mobile. So user can easily compare previous data on its mobile. We used MPAndroidChart library to represent and display graphs."]', '1543902664', NULL, NULL),
(325, 125, 'Safe Micro Systems', 'VIOX (Vital EtherCAT I/O) for Railways', 'Embedded Software Developer', '["[Embedded C]","[Code composer studio 8.0.0,Halcogen,Slave Stack Code tool,TwinCAT 3]"]', '["This project consists of Central controller and Remote IO Unit. It is a unique system platform usable for safety-critical train applications like train control, automatic train protection (ATP) and automatic train operation (ATO). The Central Controller can be placed inside the Station master room, or relay room. This Remote IO Unit can be placed at least 3 m off the track inside the field location outdoor box. Using a relay as interface medium, this can be control the Field elements like Signal Lamp, Point Module. The communication interface between Central Controller and Remote IO Unit can be Fiber Optic Module or Ethernet connection in a distributed interface. \\nWe have developed software packages for Ethercat slave for RM42L432 via SPI with LAN9252.","It consists of different types of modules,\\na) Vital Input module\\nb) Vital Output module\\nc) Communication Module\\nd) Power Supply Module\\ne) CPU Module"]', '1544192984', NULL, NULL),
(326, 125, 'Safe Micro Systems', 'Quicknod  (Nodularity Predictor)', 'Embedded Software Developer', '["[Embedded C]","[MikroC for Arm,Or-cad Cadence for  PCB Schematics Design,Visual TFT]"]', '["Description:\\nThis project developed for  measurement of nodularity of alloys, which is used for many applications such as aircraft wings manufacturing, automobiles, wind turbine blades and industrial instruments. Quicknod is made for testing  various grades of ductile cast iron with short time of period. Nodularity measured by ultrasonic velocity. \\nIt has internal data storage of up to 1000 entries with record number, date, time, melt/sample ID, grade and nodularity value, and up to 5 grade settings."]', '1544192984', NULL, NULL),
(327, 125, 'Safe Micro Systems', 'Smart Light Monitoring System', 'Embedded Software Developer', '["[Embedded C]","[MikroC for Arm]"]', '["Smart Light Monitoring System basically used to save electricity. Here we are using PIR motion sensor. If any motion by human body is detected by PIR we will be controlling brightness of its corresponding two lights. Data will be  send and received through Zigbee module as wireless communication .There are one coordinator and four router module used.Each router will send the status of self light ,temperature and humidity  to coordinator periodically."]', '1544192984', NULL, NULL),
(328, 126, 'Capgemini India pvt. Ltd', 'PASA AHU', 'Software Developer', '["[QNX Momentics,NEO VI engine, Jazz,code collaborator, Diagnostic Engineering Tool,Miscosoft visio.]","[QNX Momentics,NEO VI engine, Jazz,code collaborator, Diagnostic Engineering Tool,Miscosoft visio.]"]', '["PASA FORD Audio Head Unit is an In vehicle infotainment system. Inside vehicle there is a Radio, SYNC hardware, Power AMP, touch screen and a faceplate, which is basically, used for multimedia feature.The components that are in scope of this project are Audio Manager, CAN application Layer,System Services development and related Bug-Fixing."]', '1544445430', NULL, NULL),
(329, 126, 'Capgemini India pvt. Ltd', 'PASA CCR', 'Software Developer', '["[QNX Momentics,csaint,saint bus engine, tortoise SVN, beyond compare,code collaborator]","[QNX Momentics,csaint,saint bus engine, tortoise SVN, beyond compare,code collaborator]"]', '["PASA Connected Color Radio is an In vehicle infotainment system. Inside vehicle there is a Radio, touch screen and a faceplate, which is basically, used for multimedia and navigation features. The components that are in scope of this project are HMI Application Layer, Navigation, Multimedia and Networking features development, System Services development and related Bug-Fixing."]', '1544445430', NULL, NULL),
(330, 126, 'Capgemini India pvt. Ltd', 'Android POC', 'Software Developer', '["[Android studio,Linux shell scripting,android SDK]","[Android studio,Linux shell scripting,android SDK]"]', '["Porting AOSP on RPI3 board, Automotive specific applications Development"]', '1544445430', NULL, NULL),
(331, 127, 'Lateral emSoft Pvt. Ltd', 'Acceleration & Deceleration sense (Qatar Client)', 'Software Developer', '["[Eclipse, Beyond Studio]","[Eclipse, Beyond Studio]"]', '["Write code for PIC16f1705 as well as M66 Module in Embedded C language. In which I2C as well UART protocol is used. Client wants to understand behaviour of his/her vehicle.  So we come out with this device which gives you vehicle behaviour. So if client’s driver is driving harshly with accelerate and decelerate so client will understand."]', '1544504173', NULL, NULL),
(332, 127, 'Lateral emSoft Pvt. Ltd', 'Wireless Temperature & Humidity sense', 'Software Developer', '["[Wireless temperature and Humidity Communication with JN5168]","[Wireless temperature and Humidity Communication with JN5168]"]', '["I was responsible to write code for wireless device using I2C as well as UART.  Implement as per client requirement for short distance as well as long distance. Long distance can achieve by router, which plays main role for long distance communication.\\nConcept is Sleeping end device (SED) will transfer data/protocol as particular time interval to Co-ordinator.\\nIn-between if user wants to increase distance so user can put router.\\nI have interface\\t Temperature and Humidity sensor with Wireless NXP Device."]', '1544504173', NULL, NULL),
(333, 127, 'Xenium Digital Pvt. Ltd.', 'Cycle Simulator', 'Software Developer', '["[Digital Advertising]","[Digital Advertising]"]', '["Client needs to do product advertising like digital advertising. So cycle simulator plays best role in this project.\\nIts simulation between virtual cycle with physical cycle.  As per physical cycle rotates and move its paddle and handle respectively same way virtual cycle will do same."]', '1544504173', NULL, NULL),
(334, 127, 'Xenium Digital Pvt. Ltd.', 'ROTOSCOPE', 'Software Developer', '["[Digital Advertising]","[Digital Advertising]"]', '["ROTOSCOPE is like it will move 4\'20 inch of big screen from left to write play video for digital advertising. \\nThe screen will looks like scanning actual background image.\\nProject is for Car digital advertising. On backside of screen poster of that car is paste in black & white and whenever screen rotates that particular part will see on screen in color and video will play of interior of car.\\nMy responsibility is like write code for Encoder and Bluetooth communication in embedded c."]', '1544504173', NULL, NULL),
(335, 127, 'Yolo Health', 'Health ATM', 'Software Developer', '["[Linux OS]","[Linux OS]"]', '["Health ATM (kiosk) gives your entire body checkup. Health ATM can measure your height, temperature, weight, pulse as well as blood pressure and etc. \\nAlso user cans video conference with doctor for prescription.  At last user will get hardcopy of prescription and his body checkup as well as softcopy."]', '1544504173', NULL, NULL),
(336, 128, 'Spectross Digital Systems (P) Ltd.', 'Multi-Port Interface Module', 'Software Developer', '["[C, Linux Shell Scripting]","[AM335x, Non-OS]"]', '["Objective of this project is to provide secure communication over Ethernet, USB & Serial (RS232) interface."]', '1544506396', NULL, NULL),
(337, 128, 'DRMZ System Innovations Pvt. Ltd.', 'RTC & sensor based Appliance controlling', 'Software Developer', '["[C, Linux Shell Scripting]","[I2C, Atmega8l, DS3231]"]', '["Objective of this project is to provide timing & sensor based controlling for electrical appliance (water pump)"]', '1544506396', NULL, NULL),
(338, 128, 'DRMZ System Innovations Pvt. Ltd.', 'Smart Automation', 'Software Developer', '["[C, Linux Shell Scripting]","[Atmega8l, PIR Motion HC-SR501 Sensor, MQ-6 sensor, LM35 sensor]"]', '["For Smart Office, Parts Used: AVR (Atmega8l mcu), Sensors: Motion Sensor (Turn off lights if there is no motion for long time), lpg/cng Sensor (To generate alarm for leakage, sms alert), Fire sensor (To generate alarm, sms alert), Sim300 GSM module (for sms alert), RF modules (PC based wireless switching of appliances)"]', '1544506396', NULL, NULL),
(339, 128, 'DRMZ System Innovations Pvt. Ltd.', 'Different Modules & Sensors/Motors', 'Software Developer', '["[C, Linux Shell Scripting]","[Modules: GSM, GPS, Bluetooth Module (HC-05), Wi-Fi Module ESP8266 (IOT), XBEE, Fingerprint sensor, OLED, Ultrasonic Sensor etc.]"]', '["Implement several modules & sensors using AVR microcontroller"]', '1544506396', NULL, NULL),
(344, 129, 'IDEMIA', 'SC15', 'Developer and Testing', '["[C, Embedded C , Python]","[GCC, ride7]"]', '["Understanding of Data sheet and its feature.\\nSetup Environment and Continuous integration configuration.\\nTesting for power consumption, I/O and basic HAL functionality"]', '1544791574', NULL, NULL),
(345, 129, 'IDEMIA', 'Solvo30', 'Developer', '["[XML, Python , BATCH and SHELL]","[XML, Python , BATCH and SHELL]"]', '["Set up the Continuous Integration on Jenkins\\nSet up the qualification environment to perform qualification on VISA and \\t   MCHIP\\nDevelopment of new python test scripts for additional test coverage\\nPerform qualification with the help of External Test Suite from ICC, Collis \\t   & Integri for VISA & MCHIP4 resp.\\nPerform Tearing testing, class B, C testing and Protocol testing with \\tTermsim\\nPerformance Testing, Bug Analysis & Reporting"]', '1544791574', NULL, NULL),
(346, 129, 'Vedys', 'HVAC Controller', 'Developer', '["[C, Embedded C , Python]","[AVR, visual stdio, Atmel Studio, Arduino]"]', '["Developed HVAC controller and its remote based on Modbus and Zigbee. Ported same firmware to STM8 also."]', '1544791574', NULL, NULL),
(347, 129, 'Vedys', 'AIR Monitoring System', 'Developer', '["[C, Embedded C , Python]","[AVR, visual stdio, Atmel Studio, Arduino]"]', '["Based on Cozir CO2 sensor and analog CO sensor, developed air ventilation system for Parking."]', '1544791574', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_description`
--

CREATE TABLE `job_description` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `no_of_requiremet` int(11) DEFAULT NULL,
  `experience` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills_required` longtext COLLATE utf8mb4_unicode_ci,
  `additional_skills` longtext COLLATE utf8mb4_unicode_ci,
  `roles_and_responsibility` longtext COLLATE utf8mb4_unicode_ci,
  `job_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ctc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice_period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_description`
--

INSERT INTO `job_description` (`id`, `title`, `sub_title`, `description`, `no_of_requiremet`, `experience`, `skills_required`, `additional_skills`, `roles_and_responsibility`, `job_location`, `job_type`, `ctc`, `notice_period`, `job_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Java', 'Senior Java Developer', 'Syslogyx Technologies is a technology company in Nagpur, India. We deliver outsourced product design, R&D services and solutions to defense R&D labs, mining sector and production industries in India. We provide solutions through our core practices of IoT, IIoT, product design services, design & engineering and software development services.\r\nThe company has a multi-skilled team of engineers & designers. They innovate using their wide range of experience in Industrial Automation, System Integration, IoT, Embedded Systems and software programming. We are located at Nagpur, Maharashtra.', 40, '3 to 8 years', 'Proficient in Java, Spring Framework, Hibernate, JSP, Servlets, JDBC, Junit Testing.\r\nExposure with Front end technologies Javascript, JSP, AngularJs/React, JQuery, HTML / CSS, Bootstrap.\r\nSolid understanding of object-oriented programming.\r\nWorking experience in Development of REST API.\r\nFamiliar with various design and architectural patterns.\r\nFamiliarity with concepts of MVC, JDBC, and RESTful.\r\nKnack for writing clean, readable Java code.\r\nFamiliarity with Relational Databases, SQL and ORM technologies (JPA2, Hibernate).\r\nCreating database schemas that represent and support business processes.\r\nImplementing automated testing platforms and unit tests.\r\nProficient understanding of code versioning tools, such as Git, SVN.\r\nExcellent Communication and interpersonal skills.', 'Familiarity with build tools such as Ant, Maven and Gradle.\r\nFamiliarity with continuous integration.\r\nExperience with third-party libraries and APIs.\r\nUnderstanding fundamental design principles behind a scalable application.\r\nExperience of Participating in walkthroughs of testing procedures related to infotainment system.\r\nPositive attitude towards accomplishing assigned work with value-addition.\r\nFocused and analytical problem solving approach.', 'Proven ability to design, optimize and integrate business processes.\r\nPreparing technical solution and architecture documents, artifacts, work products and presentations for the customer.\r\nEnforce sound development practices and ensure the delivery quality.\r\nTranslate designs and wireframes into high quality code.\r\nDesign, build and maintain high performance, reusable and reliable Java code.\r\nEnsure the best possible performance, quality and responsiveness of the application.\r\nIdentify and correct bottlenecks and fix bugs.\r\nHelp maintain code quality, organization and automation.', 'Nagpur', 'Permanent-full time', 'Last drawn (Negotiable)', 'One month or less.', 'SYS1', 1, NULL, '2018-12-10 06:53:35'),
(2, 'Android', 'Senior Android Developer', 'Syslogyx Technologies is a technology company in Nagpur, India. We deliver outsourced product design, R&D services and solutions to defense R&D labs, mining sector and production industries in India. We provide solutions through our core practices of IoT, IIoT, product design services, design & engineering and software development services.\r\nThe company has a multi-skilled team of engineers & designers. They innovate using their wide range of experience in Industrial Automation, System Integration, IoT, Embedded Systems and software programming. We are located at Nagpur, Maharashtra. \r\n', 40, '3 to 8 years', 'Extensive knowledge and deep understanding of JAVA, android studio and android SDK.\r\nExperience of Software development on Linux platform.\r\nPractical knowledge of android application, architecture (such as MVC, MVVM, MVP).\r\nExperience in android development tool chain (debugger, emulators, compilers etc).\r\nStrong knowledge of Android UI design principles, patterns, and best practices.\r\nStrong understanding of REST/ SOAP API’s. \r\nProficient knowledge in Offline data storage (Ex: SQLite, Internal, External), Threading. \r\n', 'Good Knowledge of HTML5, jQuery, Angular JS.\r\nExperience of Participating in walkthroughs of testing procedures related to infotainment system.\r\nDevelopment of reusable automated test scripts.\r\nPositive attitude towards accomplishing assigned work with value-addition.\r\nFocused and analytical problem solving approach.\r\nProficient understanding of code versioning tools, such as Git, SVN.\r\nWorking knowledge of the general mobile landscape, architectures, trends, and emerging technologies.\r\nExperience with third-party libraries and APIs.\r\nSolid understanding of the full mobile development life cycle.\r\n', 'Proven ability to design, optimize and integrate business processes.\r\nPreparing technical solution and architecture documents, artifacts, work products and presentations for the customer.\r\nEnforce sound development practices and ensure the delivery quality.\r\nTranslate designs and wireframes into high quality code.\r\nDesign, build, and maintain high performance, reusable, and reliable Java code.\r\nEnsure the best possible performance, quality, and responsiveness of the application.\r\nIdentify and correct bottlenecks and fix bugs.\r\nHelp maintain code quality, organization, and automation.\r\n\r\n', 'Nagpur', 'Permanent – Full time', 'Last drawn (Negotiable)', 'One month or less.', 'SYS2', 1, NULL, NULL),
(3, 'Embedded', 'Senior Embedded Developer', 'Syslogyx Technologies is a technology company in Nagpur, India. We deliver outsourced product design, R&D services and solutions to defense R&D labs, mining sector and production industries in India. We provide solutions through our core practices of IoT, IIoT, product design services, design & engineering and software development services.\r\n', 40, '2 to 8 years', 'Experience in either of these domains/ sector: Manufacturing, IoT, Automotive, Military.', 'Familiarity with tools such as Python, Atmel Studio, CSS\r\nFamiliar with Cloud API communication\r\nPositive attitude towards accomplishing assigned work with value-addition.\r\nFocused and analytical problem solving approach.\r\nOS concept like scheduling, multitasking, memory management\r\nDemonstrable skills in developing testable code, test fixtures, and supporting a test-driven architecture', 'Proven ability to design, optimize and integrate embedded system.\r\nPreparing technical solution and architecture documents,  and presentations for the customer.\r\nEnforce sound development practices and ensure the delivery quality.\r\nIdentify and correct bottlenecks and fix bugs.\r\nHelp maintain code quality, organization and automation.\r\nMust be comfortable working with existing code, finding issues and making surgical fixes\r\nProficient oral and written communications skills and collaborates well in a team environment', 'Nagpur', 'Permanent – Full time', 'Last drawn (Negotiable)', 'One month or less.', 'SYS3', 1, NULL, '2018-11-19 08:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_10_26_092546_create_role', 1),
(2, '2018_10_26_092632_create_permission', 1),
(3, '2018_10_26_092658_create_users', 1),
(4, '2018_10_26_092659_create_job_description', 1),
(5, '2018_10_27_092659_create_qualification', 1),
(6, '2018_10_27_092661_create_candidate', 1),
(7, '2018_10_27_092662_create_candidate_qualifications', 1),
(8, '2018_10_27_092663_create_candidate_achivements', 1),
(9, '2018_10_27_092664_create_candidate_technical_skills', 1),
(10, '2018_10_27_092665_create_candidate_industrial_experience', 1),
(11, '2018_10_27_092666_create_candidate_hobbies', 1),
(12, '2018_10_27_092667_CreateDocumentTab', 1),
(13, '2018_11_05_123504_CreateBasicQuestions', 2),
(14, '2018_11_05_163013_CreateStreams', 3),
(15, '2018_11_05_123507_CreateBasicQuestions', 4),
(16, '2018_11_13_174606_CreateScreeningResult', 5),
(17, '2018_11_15_165706_Create_candidate_user_assocs', 6),
(18, '2018_11_15_165709_Create_candidate_user_assocs', 7),
(19, '2018_11_20_155745_Create_technical_interview_result', 8),
(20, '2018_11_20_155746_Create_technical_interview_result', 9),
(21, '2018_12_10_120510_CreateCandidateJdAssoc', 10),
(22, '2018_12_10_183631_CreatePdfSetting', 11),
(23, '2018_12_10_183639_CreatePdfSetting', 12),
(24, '2018_12_10_183640_CreatePdfSetting', 13);

-- --------------------------------------------------------

--
-- Table structure for table `other_achievements`
--

CREATE TABLE `other_achievements` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `achievement_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achivement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `other_achievements`
--

INSERT INTO `other_achievements` (`id`, `candidate_id`, `achievement_type`, `achivement`, `timestamp`, `created_at`, `updated_at`) VALUES
(14, 48, 'Others', 'NA', '1540998321', NULL, NULL),
(15, 49, 'Others', 'NA', '1540998541', NULL, NULL),
(16, 50, 'Others', 'NA', '1540999256', NULL, NULL),
(18, 52, 'Others', 'NA', '1541001978', NULL, NULL),
(19, 53, 'Others', 'Not Mentioned', '1541072620', NULL, NULL),
(44, 66, 'Others', 'School Topper  in class 12th', '1541415751', NULL, NULL),
(45, 66, 'Others', 'School Topper in class  5th', '1541415751', NULL, NULL),
(46, 66, 'Others', 'Participated in TEDx “ Unleashing The Power of Entrepreneurship” at IES, IPS Academy Indore.', '1541415751', NULL, NULL),
(47, 66, 'Others', 'Volunteer in National Conference on Emerging Trends in Information Technology, conducted  at IES, IPS Academy Indore on 7th may 2011.', '1541415751', NULL, NULL),
(48, 66, 'Others', 'Participate in VASE IT Cup Nagpur awarded for  “Man of the match”  Kratin software solution Nagpur .', '1541415751', NULL, NULL),
(49, 67, 'Others', 'Won the title of “Star Performer” for contribution in critical modules and handling parallel releases', '1541417535', NULL, NULL),
(50, 67, 'Others', 'Felicitated SPOT R & R at GlobalLogic (thrice) for Aug\'14, Mar\'17 and May’18', '1541417535', NULL, NULL),
(51, 67, 'Others', 'Felicitated Engineering Excellence for Quarter 1 (Apr-May-Jun) – 2015-2016 at GlobalLogic', '1541417535', NULL, NULL),
(52, 67, 'Others', 'Won Integrated Team Award (twice) for Quarter 3 FY\'17 and Quarter 2 FY’18 at GlobalLogic', '1541417535', NULL, NULL),
(53, 67, 'Others', 'Participated in 30 Hacks at GlobalLogic, Hyderabad (in coordination with Google in Jan\'17) and at GlobalLogic, Nagpur in Oct’17', '1541417535', NULL, NULL),
(54, 67, 'Others', 'Got client appreciation mail for individually handling critical module', '1541417535', NULL, NULL),
(55, 67, 'Others', 'Got Certified as a good communicator during internal communication sessions organized at GlobalLogic', '1541417535', NULL, NULL),
(56, 67, 'Others', 'Felicitated Individual Excellence for Quarter 2 (Jul-Aug-Sep) – 2017-2018 at GlobalLogic', '1541417535', NULL, NULL),
(57, 67, 'Others', 'Felicitated Stalwarts Award at GlobalLogic in May’18', '1541417535', NULL, NULL),
(60, 70, 'Others', 'Not Mentioned', '1541420831', NULL, NULL),
(62, 72, 'Others', 'One of the Judiciary member of CII Event for evaluation of the participants projects.', '1541522419', NULL, NULL),
(63, 72, 'Others', 'Runner up champion in University Cricket tournament.', '1541522419', NULL, NULL),
(64, 73, 'Others', 'NA', '1541530288', NULL, NULL),
(65, 74, 'Others', 'Paper presented :-“ Modeling and analysis of  RF MEMS Cantilever Switch in Spice,” in the, International Conference organized by Amrutvahini college of engineering, Sangamner (2009)', '1541581052', NULL, NULL),
(66, 74, 'Others', 'Participated in INUP Workshop on Nanofabrication Technologies, IITB, Mumbai (2009)', '1541581052', NULL, NULL),
(67, 74, 'Others', 'Participated in Seminar on RF Integrated Circuits Design and Testing, VNIT, Nagpur (2008)', '1541581052', NULL, NULL),
(68, 74, 'Others', 'One Week Short Term Training Program on "ADVANCED EMBEDDED SYSTEM” organized by SRKNEC (2008)', '1541581052', NULL, NULL),
(69, 74, 'Others', 'RHCE, Course offered by Tan Alltech Solutions (RedHat Training Partner), Nagpur (2006)', '1541581052', NULL, NULL),
(70, 74, 'Others', 'CCNA, Course offered by Government polytechnic, Nagpur (2005).', '1541581052', NULL, NULL),
(71, 74, 'Others', '“Medical Instrument Repairing & Maintenance” , training offered by MCED, Nagpur (2003)', '1541581052', NULL, NULL),
(74, 76, 'Others', 'Not Mentioned', '1542190386', NULL, NULL),
(75, 77, 'Others', 'Not Mentioned', '1542284515', NULL, NULL),
(76, 78, 'Others', 'Won 1st prize in “Technical Quiz Competition” in Datta Meghe Polytechnic, Nagpur.', '1542435243', NULL, NULL),
(77, 78, 'Others', 'Represent venue committee member of “Zenith – Personality Development” program in RCOEM, Nagpur.', '1542435243', NULL, NULL),
(78, 78, 'Others', 'Participated in “International Project Competition” in L&T Powai, Mumbai.', '1542435243', NULL, NULL),
(79, 78, 'Others', 'Completed 15 days’ workshop on “Microcontroller based Project Development” in SDMP, Nagpur', '1542435243', NULL, NULL),
(80, 78, 'Others', 'Participated in “RoboPravesh” workshop conducted by I-LABS held at YCCE, Nagpur.', '1542435243', NULL, NULL),
(81, 79, 'Others', '1st prize in the machine learning Hackathon 2017 at GlobalLogic, the same team was further selected for NASSCOM Hackathon 2017', '1542437180', NULL, NULL),
(82, 79, 'Others', 'Engineering Excellence Award for Quarter 4 (Jan-Feb- Mar) – 2015-2016.', '1542437180', NULL, NULL),
(83, 79, 'Others', '1st prize among all centres of GlobalLogic in the technical event “Global POC 2016”.', '1542437180', NULL, NULL),
(84, 79, 'Others', 'SPOT Reward and Recognize awards Four times at GlobalLogic.', '1542437180', NULL, NULL),
(85, 79, 'Others', 'Consoling prize in the technical event “30 Hacks 2016” at GlobalLogic.', '1542437180', NULL, NULL),
(86, 79, 'Others', 'Member of one of the top 5 teams selected for Hackathon 2017 organized by Google.', '1542437180', NULL, NULL),
(87, 80, 'Others', 'Not Mentioned', '1542461202', NULL, NULL),
(88, 81, 'Others', 'Not Mentioned', '1542462052', NULL, NULL),
(91, 84, 'Others', 'Won 1st place in India vs Sri-Lanka Youth Power-lifting Championship 2013.', '1542464366', NULL, NULL),
(92, 84, 'Others', 'Won 1st place in India vs Sri-Lanka Athletics meet(shotput throw) held at Mysore 2014.', '1542464366', NULL, NULL),
(93, 85, 'Others', 'Presented a seminar on Lie detector in graduation.', '1542465573', NULL, NULL),
(94, 85, 'Others', 'Presented a seminar on communication.', '1542465573', NULL, NULL),
(95, 86, 'Others', 'Not Mentioned', '1542604994', NULL, NULL),
(96, 87, 'Others', 'Not Mentioned', '1542605040', NULL, NULL),
(97, 88, 'Others', 'Won Star of the Month (KROWN) Award for complete ownership of module development of CanSM. The tasks were handled completely by me since I joined the project and awarded for the same.', '1542618810', NULL, NULL),
(106, 93, 'Others', 'NA', '1542807370', NULL, NULL),
(107, 94, 'Others', 'Many', '1542808937', NULL, NULL),
(112, 99, 'Others', 'dfafa', '1542814531', NULL, NULL),
(113, 100, 'Others', 'test', '1542815010', NULL, NULL),
(114, 101, 'Others', 'NA', '1542868864', NULL, NULL),
(115, 102, 'Others', 'Active member of a team “Wireless HART Gateway System” which is awarded by internationally acclaimed “Control System Engineering Magazine”', '1542873158', NULL, NULL),
(116, 103, 'Others', 'NA', '1542891075', NULL, NULL),
(119, 106, 'Others', 'NA', '1542953199', NULL, NULL),
(120, 107, 'Others', 'NA', '1542956010', NULL, NULL),
(121, 108, 'Others', 'NA', '1542967663', NULL, NULL),
(122, 109, 'Others', 'NA', '1542970940', NULL, NULL),
(123, 110, 'Others', 'NA', '1542973504', NULL, NULL),
(124, 111, 'Others', 'Awarded "Star Performer" award in 1st year of Cognizant. Got best award “Applause” in continuous twice half yearly review. Multiple Spot award at different life span of project.', '1543211398', NULL, NULL),
(125, 112, 'Others', 'NA', '1543212592', NULL, NULL),
(126, 113, 'Others', 'NA', '1543490794', NULL, NULL),
(127, 114, 'Others', 'NA', '1543492769', NULL, NULL),
(128, 115, 'Others', 'NA', '1543496133', NULL, NULL),
(129, 116, 'Others', 'NA', '1543572513', NULL, NULL),
(130, 117, 'Others', 'NA', '1543582176', NULL, NULL),
(131, 121, 'Others', 'NA', '1543841145', NULL, NULL),
(133, 123, 'Others', 'NA', '1543908257', NULL, NULL),
(136, 124, 'Others', 'NA', '1544001970', NULL, NULL),
(137, 122, 'Others', 'NA', '1543902664', NULL, NULL),
(138, 125, 'Professional Training', 'Diploma Certification in Embedded Systems from Scientech Technologies Pvt.  Ltd. Indore (m.p.).', '1544192984', NULL, NULL),
(139, 125, 'Professional Training', 'Attended  Training  in Embedded Systems with Embedded linux from Dallas Technologies  Pvt. Ltd. Bangalore(K.A.)', '1544192984', NULL, NULL),
(140, 126, 'Others', 'NA', '1544445430', NULL, NULL),
(141, 127, 'Others', 'NA', '1544504173', NULL, NULL),
(142, 128, 'Others', 'NA', '1544506396', NULL, NULL),
(144, 129, 'Others', 'NA', '1544791574', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pdf_setting`
--

CREATE TABLE `pdf_setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pdf_setting`
--

INSERT INTO `pdf_setting` (`id`, `section_name`, `created_at`, `updated_at`) VALUES
(1, 'Name', NULL, NULL),
(2, 'Email', NULL, NULL),
(3, 'Phone', NULL, NULL),
(4, 'Address', NULL, NULL),
(5, 'Summary', NULL, NULL),
(6, 'Date Of Birth', NULL, NULL),
(7, 'Passport No.', NULL, NULL),
(8, 'Total Experience', NULL, NULL),
(9, 'Educational Details', NULL, NULL),
(10, 'Other Achievements', NULL, NULL),
(11, 'Technical Skill', NULL, NULL),
(12, 'Industrial Experience', NULL, NULL),
(13, 'Hobbies', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualification_details`
--

CREATE TABLE `qualification_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qualification_details`
--

INSERT INTO `qualification_details` (`id`, `name`, `alias`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SSC - 10th', 'ssc_-_10th', 0, NULL, NULL),
(2, 'HSC - 12th', 'hsc_-_12th', 0, NULL, NULL),
(3, 'Diploma', 'diploma', 0, NULL, NULL),
(4, 'Graduate', 'graduate', 0, NULL, NULL),
(5, 'Post Graduate', 'pg', 0, NULL, NULL),
(6, 'PHD', 'phd', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'HR', NULL, NULL),
(3, 'Collegue', NULL, NULL),
(4, 'Interviewer', NULL, NULL),
(5, 'Candidate', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE `streams` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `streams`
--

INSERT INTO `streams` (`id`, `name`, `alias`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Android', 'android', 0, NULL, NULL),
(2, 'Java', 'java', 0, NULL, NULL),
(3, 'Common', 'common', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `technical_interview_result`
--

CREATE TABLE `technical_interview_result` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `technical_round` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_of_interview` double(8,2) DEFAULT NULL,
  `observation` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `technical_skills`
--

CREATE TABLE `technical_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED DEFAULT NULL,
  `technology_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technology_experience` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `technical_skills`
--

INSERT INTO `technical_skills` (`id`, `candidate_id`, `technology_name`, `technology_experience`, `timestamp`, `created_at`, `updated_at`) VALUES
(16, 48, 'Java', '0.0', '1540998321', NULL, NULL),
(17, 48, 'c/c++', '0.0', '1540998321', NULL, NULL),
(18, 48, 'Objective C', '0.0', '1540998321', NULL, NULL),
(19, 48, 'android', '0.0', '1540998321', NULL, NULL),
(20, 48, 'angular', '0.0', '1540998321', NULL, NULL),
(21, 48, 'html', '0.0', '1540998321', NULL, NULL),
(22, 48, 'css', '0.0', '1540998321', NULL, NULL),
(23, 48, 'SQLite', '0.0', '1540998321', NULL, NULL),
(24, 48, 'Android Studio', '0.0', '1540998321', NULL, NULL),
(25, 48, 'Eclipse', '0.0', '1540998321', NULL, NULL),
(26, 48, 'Groovy', '0.0', '1540998321', NULL, NULL),
(27, 48, 'Gherkin', '0.0', '1540998321', NULL, NULL),
(28, 48, 'Appium', '0.0', '1540998321', NULL, NULL),
(29, 48, 'GitHub', '0.0', '1540998321', NULL, NULL),
(30, 48, 'SVN', '0.0', '1540998321', NULL, NULL),
(31, 49, 'Android, java, SQL, Android SDK,  Android frameworks', '9.2', '1540998541', NULL, NULL),
(32, 50, 'Programming Languages:- Java, Kotlin, RxAndroid, Xamarin Android, C#, Spring, AngularJS', '0.0', '1540999256', NULL, NULL),
(33, 50, 'Database:- MySQL, SQLite', '0.0', '1540999256', NULL, NULL),
(34, 50, 'IDE :- Android Studio, Eclipse, IntelliJ IDE, VS2015, Xamarin Studio', '0.0', '1540999256', NULL, NULL),
(35, 50, 'Version Control:- SVN, GIT, Bit Bucket, SourceTree.', '0.0', '1540999256', NULL, NULL),
(36, 50, 'Testing:- Junit, Mockito, PowerMockito.', '0.0', '1540999256', NULL, NULL),
(37, 50, 'Embedded Tool:-  Beagle Board, BLE Beacons', '0.0', '1540999256', NULL, NULL),
(38, 50, 'Development Methodology:-  Agile methodology, Waterfall model', '0.0', '1540999256', NULL, NULL),
(39, 50, 'Dev – Ops tools:-  Jenkins, JIRA, VERSION ONE', '0.0', '1540999256', NULL, NULL),
(40, 50, 'External Libraries:- Retrofit, Dagger 2, Volley, Universal Image Loader.', '0.0', '1540999256', NULL, NULL),
(41, 50, 'Design Patterns:- Singleton, MVP, MVC, MVVM, Factory, Observable.', '0.0', '1540999256', NULL, NULL),
(48, 52, 'Android Framwork', '2.6', '1541001978', NULL, NULL),
(49, 52, 'Core Java', '2.6', '1541001978', NULL, NULL),
(50, 52, 'Basics of Kotlin and AWS (Amezon Web Services)', '2.6', '1541001978', NULL, NULL),
(51, 52, 'Agile Expertise', '2.6', '1541001978', NULL, NULL),
(52, 52, 'Good Understanding of CICD Pipeline,	JIRA,	Sonarqube, SDLC', '2.6', '1541001978', NULL, NULL),
(53, 52, 'Good hands-on on Version Controling tool like: Github, SVN, Source Tree, Bit-Bucket', '2.6', '1541001978', NULL, NULL),
(54, 53, 'Core Java', '0.7', '1541072620', NULL, NULL),
(55, 53, 'J2EE (Servlets and JSP)', '4.7', '1541072620', NULL, NULL),
(56, 53, 'GWT,GXT', '7.5', '1541072620', NULL, NULL),
(57, 53, 'MySql', '4.3', '1541072620', NULL, NULL),
(58, 53, 'Oracle', '3.3', '1541072620', NULL, NULL),
(59, 53, 'Html', '4.4', '1541072620', NULL, NULL),
(60, 53, 'Css', '3.4', '1541072620', NULL, NULL),
(61, 53, 'JQuery', '4.6', '1541072620', NULL, NULL),
(62, 53, 'JavaScript', '4.6', '1541072620', NULL, NULL),
(63, 53, 'Ajax', '4.5', '1541072620', NULL, NULL),
(64, 53, 'Struts 2.0', '5.5', '1541072620', NULL, NULL),
(65, 53, 'Spring MVC', '11.3', '1541072620', NULL, NULL),
(66, 53, 'Spring core', '5.6', '1541072620', NULL, NULL),
(67, 53, 'Apache Tomcat 7.0', '5.6', '1541072620', NULL, NULL),
(68, 53, 'Weblogic and Websphere', '4.5', '1541072620', NULL, NULL),
(69, 53, 'Eclipse Neon', '4.5', '1541072620', NULL, NULL),
(70, 53, 'Windows and Linux', '4.5', '1541072620', NULL, NULL),
(71, 53, 'Knowledge of Push technologies (XMPP)', '4.6', '1541072620', NULL, NULL),
(114, 66, 'Windows', '0.0', '1541415751', NULL, NULL),
(115, 66, 'Linux', '0.0', '1541415751', NULL, NULL),
(116, 66, 'Android SDK', '0.0', '1541415751', NULL, NULL),
(117, 66, 'Core Java', '0.0', '1541415751', NULL, NULL),
(118, 66, 'C', '0.0', '1541415751', NULL, NULL),
(119, 66, 'C++', '0.0', '1541415751', NULL, NULL),
(120, 66, 'Sqlite(Android)', '0.0', '1541415751', NULL, NULL),
(121, 66, 'MySQL', '0.0', '1541415751', NULL, NULL),
(122, 66, 'Android Studio , Eclipse IDE, Net Beans', '0.0', '1541415751', NULL, NULL),
(123, 66, 'SVN, Bitbucket, Git', '0.0', '1541415751', NULL, NULL),
(124, 67, 'Android', '0.0', '1541417535', NULL, NULL),
(125, 67, 'Java', '0.0', '1541417535', NULL, NULL),
(126, 70, 'Development Tool- Eclipse', '0.0', '1541420831', NULL, NULL),
(127, 70, 'Java', '0.0', '1541420831', NULL, NULL),
(128, 70, 'JSP, Servlet, HTML, Restful', '0.0', '1541420831', NULL, NULL),
(129, 70, 'Hibernate', '0.0', '1541420831', NULL, NULL),
(130, 70, 'MySQL', '0.0', '1541420831', NULL, NULL),
(131, 70, 'Spring', '0.0', '1541420831', NULL, NULL),
(132, 70, 'OS-Windows', '0.0', '1541420831', NULL, NULL),
(134, 72, 'Programming Languages: Embedded C, C- Language, Python', '0.0', '1541522419', NULL, NULL),
(135, 72, 'Embedded Platforms: 8051, AVR, ARM', '0.0', '1541522419', NULL, NULL),
(136, 72, 'Communication Buses: Ethernet, SPI, I2C, RS232, USB, CAN, UART, Wi-Fi, Bluetooth, Modbus, Profibus, Self Programming Bootloader', '0.0', '1541522419', NULL, NULL),
(137, 72, 'EDA Tools:  Xilinx ISE,  proteus, AVR studio, Keil, Eclipse, Code Block, Code Composer Studio, Proteus, Tera Term, XCTU, MODSCAN32, Smart Draw', '0.0', '1541522419', NULL, NULL),
(138, 73, 'Programming Languages: Embedded C, C+, Python, VHDL', '0.0', '1541530288', NULL, NULL),
(139, 73, 'Embedded Platforms: 8051, AVR, ARM, Cortex M3, Ardino', '0.0', '1541530288', NULL, NULL),
(140, 73, 'Communication Buses: Ethernet, Modbus/TCP, SPI, I2C, RS232, USB, CAN', '0.0', '1541530288', NULL, NULL),
(141, 73, 'EDA Tools:  Xilinx ISE, ModelSim ,Pspice, proteus, AVR studio, Orcad, Keil', '0.0', '1541530288', NULL, NULL),
(142, 74, 'Programming Languages: Embedded C, C- Language, Python, VHDL', '0.0', '1541581052', NULL, NULL),
(143, 74, 'Embedded Platforms: 8051, AVR, ARM, Cortex M3, Raspberry PI', '0.0', '1541581052', NULL, NULL),
(144, 74, 'Communication Buses: Ethernet, Modbus/TCP, SPI, I2C, RS232, USB, CAN', '0.0', '1541581052', NULL, NULL),
(145, 74, 'EDA Tools:  Xilinx ISE, ModelSim ,Pspice, proteus, AVR studio, Orcad, Keil', '0.0', '1541581052', NULL, NULL),
(147, 76, 'Android', '0.0', '1542190386', NULL, NULL),
(148, 76, 'Core Java', '0.0', '1542190386', NULL, NULL),
(149, 77, 'C', '0.0', '1542284515', NULL, NULL),
(150, 77, 'C++', '0.0', '1542284515', NULL, NULL),
(151, 77, 'Tools: Visual studio, GDB, VIM, Klocwork and Jira.', '0.0', '1542284515', NULL, NULL),
(152, 77, 'Version Control: SVN', '0.0', '1542284515', NULL, NULL),
(153, 77, 'Editors: Visual studio, VI (Linux).', '0.0', '1542284515', NULL, NULL),
(154, 77, 'Operating Systems: Linux, Windows and RTOS.', '0.0', '1542284515', NULL, NULL),
(155, 78, 'Technologies – Android, Core Java, HTML, Java Script', '0.0', '1542435243', NULL, NULL),
(156, 78, 'Databases –SQLite/SQL', '0.0', '1542435243', NULL, NULL),
(157, 78, 'Tools– Eclipse IDE, Android Studio, Net Beans IDE.', '0.0', '1542435243', NULL, NULL),
(158, 78, 'Office Packages – Office (Word, Excel, Power Point).', '0.0', '1542435243', NULL, NULL),
(159, 78, 'Operating Systems – Windows.', '0.0', '1542435243', NULL, NULL),
(160, 78, 'Certificate course in “JAVA”.', '0.0', '1542435243', NULL, NULL),
(161, 78, 'Certificate course in “Android”.', '0.0', '1542435243', NULL, NULL),
(162, 79, 'Knowledge of Software Development Life Cycle (SDLC) and Software Testing Life Cycle (STLC).', '0.0', '1542437180', NULL, NULL),
(163, 79, 'Excellent working knowledge on Android SDK, UI Development, XML Parsing, JSON Parsing, Sqlite Database.', '0.0', '1542437180', NULL, NULL),
(164, 79, 'Strong programming knowledge in Core Java.', '0.0', '1542437180', NULL, NULL),
(165, 79, 'Good knowledge of OOPs concepts, Exception Handling and Threads, Collections, Design Patterns and Design Principles.', '0.0', '1542437180', NULL, NULL),
(166, 79, 'Proficient in translate manual test case into Automation test scripts', '0.0', '1542437180', NULL, NULL),
(167, 79, 'Conceptual knowledge of Agile Development methodology.', '0.0', '1542437180', NULL, NULL),
(168, 79, 'Good experience in writing Junit test cases.', '0.0', '1542437180', NULL, NULL),
(169, 80, 'C-language', '0.0', '1542461202', NULL, NULL),
(170, 80, 'Embedded-C', '0.0', '1542461202', NULL, NULL),
(171, 80, 'Communication protocol like I2C, UART, SPI, TCP-IP', '0.0', '1542461202', NULL, NULL),
(172, 80, 'Tools like Kiel µVision IDE, AVR Studio 7.0, MPLAB-IDE, Proteus', '0.0', '1542461202', NULL, NULL),
(173, 80, 'Developing  microcontroller like ARM, MICROCHIP, ATMEL, 8051', '0.0', '1542461202', NULL, NULL),
(174, 81, 'Languages- C, Shell Scripting and Embedded C', '0.0', '1542462052', NULL, NULL),
(175, 81, 'Operating Systems- Windows (9X,XP,7),LINUX', '0.0', '1542462052', NULL, NULL),
(176, 81, 'Other Tool/IDE- Source Insight, SVN, WinSCP, Putty, JIRA, Test Builder', '0.0', '1542462052', NULL, NULL),
(188, 84, 'Languages- C Programming', '0.0', '1542464366', NULL, NULL),
(189, 84, 'IDE- Arduino IDE, Atmel studio', '0.0', '1542464366', NULL, NULL),
(190, 84, 'Microprocessors- Microcontrollers from Atmel.', '0.0', '1542464366', NULL, NULL),
(191, 84, 'Simulators- Proteus, multisim', '0.0', '1542464366', NULL, NULL),
(192, 84, 'Protocols- I2C, SPI, UART, CAN.', '0.0', '1542464366', NULL, NULL),
(193, 84, 'Design tools- Design Spark, Eagle CAD', '0.0', '1542464366', NULL, NULL),
(194, 85, 'C, Embedded Linux, RTOS, Linux Operating System, Microcontroller (AVR,ARM), MATLAB, Basic Python, Networking, Assembly language', '0.0', '1542465573', NULL, NULL),
(195, 85, 'Embedded system (ATMEGA 128), CAN', '0.0', '1542465573', NULL, NULL),
(196, 85, 'CANoe, NI TestStand, Scripting, RTC, Eclipse, Vector Cast, NI Vision, Eclipse', '0.0', '1542465573', NULL, NULL),
(197, 86, 'Embedded C', '0.0', '1542604994', NULL, NULL),
(198, 86, 'Python', '0.0', '1542604994', NULL, NULL),
(199, 86, 'Linux Scripting', '0.0', '1542604994', NULL, NULL),
(200, 86, 'CVAVR (CodeVissionAVR)', '0.0', '1542604994', NULL, NULL),
(201, 86, 'AVR Studio', '0.0', '1542604994', NULL, NULL),
(202, 86, 'Arduino', '0.0', '1542604994', NULL, NULL),
(203, 86, 'Eclipse', '0.0', '1542604994', NULL, NULL),
(204, 86, 'Proteus', '0.0', '1542604994', NULL, NULL),
(205, 86, 'ESPlorer', '0.0', '1542604994', NULL, NULL),
(206, 86, 'IAR', '0.0', '1542604994', NULL, NULL),
(207, 86, 'Diptrace', '0.0', '1542604994', NULL, NULL),
(208, 86, 'Linux & Windows Operating System', '0.0', '1542604994', NULL, NULL),
(209, 86, 'Microcontroller(AVR,8051,STM8,STM32) firmware Development.', '0.0', '1542604994', NULL, NULL),
(210, 86, 'UART, TIMER, INTERRUPT, GPIOS, SPI, I2C, ADC, EEPROM', '0.0', '1542604994', NULL, NULL),
(211, 86, 'Arduino, ATmega8, ATmega328', '0.0', '1542604994', NULL, NULL),
(212, 86, 'ESP8266 Internet Of Things(IOT)', '0.0', '1542604994', NULL, NULL),
(213, 86, 'PCB layout design', '0.0', '1542604994', NULL, NULL),
(214, 86, 'Circuit Simulation with Electronic Design Automation', '0.0', '1542604994', NULL, NULL),
(215, 87, 'Microcontrollers: LPC2138, LPC2148, LPC2129, Atmega32, Atmega2560, 8051 family AT89Cxx, PIC16F877, PIC4550, PIC4620, PIC18F72, Arduino and Raspberry Pi3 model B (learner).', '0.0', '1542605040', NULL, NULL),
(216, 87, 'Communication protocols: UART, I2C, SPI and CAN (learner)', '0.0', '1542605040', NULL, NULL),
(217, 87, 'Hardware implementation: GPIO, ADC, DAC, PWM and LCD.', '0.0', '1542605040', NULL, NULL),
(218, 87, 'Programming languages: C and Embedded C.', '0.0', '1542605040', NULL, NULL),
(219, 87, 'IDEs: MPLAB, CCS C, Mikro C, Atmega Studio 4, Keil and Arduino.', '0.0', '1542605040', NULL, NULL),
(220, 87, 'Tools: PICKIT 2, AVR dude and Flash magic.', '0.0', '1542605040', NULL, NULL),
(221, 88, 'Debuggers: GDB Debugger (Software Debugging)', '0.0', '1542618810', NULL, NULL),
(222, 88, 'Microcontrollers: MPC5748G', '0.0', '1542618810', NULL, NULL),
(223, 88, 'Languages: C, Embedded C, Xtend Programming Language.', '0.0', '1542618810', NULL, NULL),
(224, 88, 'Configuration Tools: Compose4KSAR.', '0.0', '1542618810', NULL, NULL),
(225, 88, 'Configuration Management Tools: Tortoise SVN, IBM RTC', '0.0', '1542618810', NULL, NULL),
(232, 93, 'Operating Systems - Ubuntu and Windows.', '0.0', '1542807370', NULL, NULL),
(233, 93, 'RTOS -  Free RTOS.', '0.0', '1542807370', NULL, NULL),
(234, 93, 'Programming Languages - C, Embedded C', '0.0', '1542807370', NULL, NULL),
(235, 93, 'Processor and Microcontrollers	- Tensilica Xtensa LX6, ARM Cortex M4, Cortex M0+, PIC', '0.0', '1542807370', NULL, NULL),
(236, 93, 'Development Tools - MPLAB, Keil UVision, LPC Xpresso,Eclipse', '0.0', '1542807370', NULL, NULL),
(237, 93, 'Development Tools - MPLAB, Keil UVision, LPC Xpresso,Eclipse', '0.0', '1542807370', NULL, NULL),
(238, 94, 'Embedded', '10.0', '1542808937', NULL, NULL),
(241, 99, 'fdaaddfd', '0.0', '1542814531', NULL, NULL),
(242, 100, 'test', '10.8', '1542815010', NULL, NULL),
(243, 101, 'C programming, Embedded C, Micro python', '0.0', '1542868864', NULL, NULL),
(244, 101, 'Hardware Designer,worked on Different sensor\'s and Applications', '0.0', '1542868864', NULL, NULL),
(245, 101, 'worked on protocols I2c,SPI,UART,USB,MQTT,one-wire,RS232.', '0.0', '1542868864', NULL, NULL),
(246, 101, 'Worked on solar power applications', '0.0', '1542868864', NULL, NULL),
(247, 101, 'knowledge on PCB designing', '0.0', '1542868864', NULL, NULL),
(248, 101, 'woked with RF modules', '0.0', '1542868864', NULL, NULL),
(249, 101, 'programmed boards using Integrated  Development Environment like Keil,Arduino,XBee.', '0.0', '1542868864', NULL, NULL),
(250, 102, 'Operating System - Linux, Windows, Yocto Linux', '0.0', '1542873158', NULL, NULL),
(251, 102, 'Software Languages - Embedded C, C++, HTML, XML, Linux Shell script, Python', '0.0', '1542873158', NULL, NULL),
(252, 102, 'Hardware Platforms - x86, ARM, PXA270, LPC2148, Raspberry Pi', '0.0', '1542873158', NULL, NULL),
(253, 102, 'Development Tools - GNU Make, ARM Linux GCC Toolchain, Eclipse', '0.0', '1542873158', NULL, NULL),
(254, 102, 'Protocol Standards - CAN, HART, Wireless HART, TCP/IP, UDP', '0.0', '1542873158', NULL, NULL),
(255, 102, 'Compilers - Linux GNU, ARM GNU', '0.0', '1542873158', NULL, NULL),
(256, 103, 'Programming Language : C, Embedded C, Python', '0.0', '1542891075', NULL, NULL),
(257, 103, 'Protocols: UART, SPI, I2C', '0.0', '1542891075', NULL, NULL),
(258, 103, 'Development tools: MPLAB, MikroC PRO for PIC, ISIS Proteus 6 Professional, Keil µVision, Arduino IDE.', '0.0', '1542891075', NULL, NULL),
(259, 103, 'Expertise : 8051, PIC, ARM7, ATMEGA328P, Raspberry Pi', '0.0', '1542891075', NULL, NULL),
(260, 106, 'Programming - C and Operating System Concepts, Embedded C, ETAS ASCET, and Assembly Language', '0.0', '1542953199', NULL, NULL),
(261, 106, 'AUTOSAR tools - BCT', '0.0', '1542953199', NULL, NULL),
(262, 106, 'Software Management tool - Request One, SDOM', '0.0', '1542953199', NULL, NULL),
(263, 106, 'Testing - ETAS LabCar, ETAS INCA, On-Vehicle testing, Vector CANalyzer, Busmaster, Madoki, CanDiag and UDE', '0.0', '1542953199', NULL, NULL),
(264, 107, 'Operating system - Windows', '0.0', '1542956010', NULL, NULL),
(265, 107, 'Software languages - Embedded C', '0.0', '1542956010', NULL, NULL),
(266, 107, 'Hardware platform - Pic, 8051 (8bit).', '0.0', '1542956010', NULL, NULL),
(267, 107, 'Development Tools - MPLAB 8.X, keil uvision 4', '0.0', '1542956010', NULL, NULL),
(268, 107, 'Protocol Standard - I2C, SPI, CAN, RS 485 MODBUS', '0.0', '1542956010', NULL, NULL),
(269, 107, 'Compilers - Hi-Tech Compiler, mcc18, C51 C Compiler.', '0.0', '1542956010', NULL, NULL),
(270, 108, 'Embedded C, CORE JAVA, Selenium, Webdriver, TestScripts', '0.0', '1542967663', NULL, NULL),
(271, 108, 'Eclipse, Serial & USB analyzer (Line EYE), ARM & C33 compiler', '0.0', '1542967663', NULL, NULL),
(272, 109, 'Operating system - Windows-7,8 , Ubuntu V18.04.', '0.0', '1542970940', NULL, NULL),
(273, 109, 'Software languages - C,Embedded C, Familiar with C++.', '0.0', '1542970940', NULL, NULL),
(274, 109, 'Development Tools - Keil MDK-ARM v5, Renesas HEW4.0,CadShoft Eagle v6.2.0,emWin GUI Builder v5.26,STM32 Cube,SpcStudio.', '0.0', '1542970940', NULL, NULL),
(275, 109, 'Protocol Standard - SPI,I2C,UART.', '0.0', '1542970940', NULL, NULL),
(276, 109, 'Compilers - RX,R8c,MDK-ARM.', '0.0', '1542970940', NULL, NULL),
(277, 110, 'Programming Languages - Embedded C', '0.0', '1542973504', NULL, NULL),
(278, 110, 'Microcontrollers - AT89C52 Atmega8', '0.0', '1542973504', NULL, NULL),
(279, 110, 'Integrated Development Environments (IDE) - KEIL v4 AVR Studio 6.0 Autodesk _Eagle 8.5+', '0.0', '1542973504', NULL, NULL),
(280, 110, 'Hardware Systems - PC assembling, installation and components checking.', '0.0', '1542973504', NULL, NULL),
(281, 110, 'Device Drivers - Character, Block, USB Device Driver in Linux.', '0.0', '1542973504', NULL, NULL),
(282, 111, 'Technologies - Core java, J2EE, Spring, Servlets, JSP,XML, JDBC, Soap, Restful, Angular4', '0.0', '1543211398', NULL, NULL),
(283, 111, 'Databases - Oracle 11g, SQL, MySQL 5.1', '0.0', '1543211398', NULL, NULL),
(284, 111, 'Development Tools - Eclipse IDE, Netbeans, Jboss, Apache Tomcat, Spring Tool Suit, Maven, Jenkins, TortoiseSVN, SSH(Putty), Winscp, JDeveloper11g , SQL Developer, Toad', '0.0', '1543211398', NULL, NULL),
(285, 112, 'Operating Systems - Windows and UNIX', '0.0', '1543212592', NULL, NULL),
(286, 112, 'J2EE Technologies - Core java, Servlets, JSP, JDBC', '0.0', '1543212592', NULL, NULL),
(287, 112, 'Web Technologies - HTML, JavaScript', '0.0', '1543212592', NULL, NULL),
(288, 112, 'Frameworks /Methodologies - Spring, Hibernate', '0.0', '1543212592', NULL, NULL),
(289, 112, 'Database - Oracle, My Sql', '0.0', '1543212592', NULL, NULL),
(290, 112, 'Servers - Apache Tomcat, Websphere', '0.0', '1543212592', NULL, NULL),
(291, 112, 'IDE Tools - Eclipse, RSA, MyEclipse', '0.0', '1543212592', NULL, NULL),
(292, 113, 'Operating system : window , Linux', '0.0', '1543490794', NULL, NULL),
(293, 113, 'Software languages : C language , Basic C++ .', '0.0', '1543490794', NULL, NULL),
(294, 113, 'Hardware platform : Microcontrollers: ATMega Series, STM8S Series, STM32 ,TI  .', '0.0', '1543490794', NULL, NULL),
(295, 113, 'Development Tools : IAR,GCC,KEIL(MDK-ARM),TI, STVD', '0.0', '1543490794', NULL, NULL),
(296, 113, 'Protocol Standard : I2C, UART, SPI , MBUS , RS232 , LIN.', '0.0', '1543490794', NULL, NULL),
(297, 113, 'Compilers : IAR,GCC,KEIL(MDK-ARM),TI, STVD', '0.0', '1543490794', NULL, NULL),
(298, 114, 'Operating system : Windows and Linux', '0.0', '1543492769', NULL, NULL),
(299, 114, 'Software languages : C, C++, Java', '0.0', '1543492769', NULL, NULL),
(300, 114, 'Development Tools : My-eclipse, Eclipse', '0.0', '1543492769', NULL, NULL),
(301, 115, 'Operating system : Windows , Linux', '0.0', '1543496133', NULL, NULL),
(302, 115, 'Software languages : C,Java,Node.js,HTML,Javascript', '0.0', '1543496133', NULL, NULL),
(303, 115, 'Hardware platform : Intel 64-bit', '0.0', '1543496133', NULL, NULL),
(304, 115, 'Development Tools : Docker,STS,Eclipse,VisualSC,IntelliJ Idea,JIRA', '0.0', '1543496133', NULL, NULL),
(305, 115, 'Protocol Standard : HTTPS , HTTP, SSL ,TCP', '0.0', '1543496133', NULL, NULL),
(306, 115, 'Compilers : javac', '0.0', '1543496133', NULL, NULL),
(307, 116, 'Operating system : Windows,Linux', '0.0', '1543572513', NULL, NULL),
(308, 116, 'Software languages : Core Java,Spring,Hibernate,Struts,Mybatis,Servelets,Jsp', '0.0', '1543572513', NULL, NULL),
(309, 116, 'Hardware platform : Windows-7', '0.0', '1543572513', NULL, NULL),
(310, 116, 'Development Tools : Eclipse,MyEclipse', '0.0', '1543572513', NULL, NULL),
(311, 116, 'Compilers : Java', '0.0', '1543572513', NULL, NULL),
(312, 117, 'Operating system : Windows, Ubuntu, Cent OS.', '0.0', '1543582176', NULL, NULL),
(313, 117, 'Software languages : JAVA, J2EE , JDBC, Servlet, JSP, Hibernate, Spring mvc, Maven, Ajax, Json , REST WS ,JAX-WS,Spring boot basic.', '0.0', '1543582176', NULL, NULL),
(314, 117, 'Hardware platform : Tomcat , Jboss', '0.0', '1543582176', NULL, NULL),
(315, 117, 'Development Tools : Eclipse, NetBeans 6.8, STS', '0.0', '1543582176', NULL, NULL),
(316, 117, 'Protocol Standard : HTTP , SFTP', '0.0', '1543582176', NULL, NULL),
(317, 121, 'Operating system :Windows 10', '0.0', '1543841145', NULL, NULL),
(318, 121, 'Software languages : JAVA ,MS SQL,MY SQL, Angular JS, .Net ,Python,Machine Learning.', '0.0', '1543841145', NULL, NULL),
(319, 121, 'Development Tools : Spring tool studio', '0.0', '1543841145', NULL, NULL),
(324, 123, 'Having good knowledge in Digital Electronics & Design', '0.0', '1543908257', NULL, NULL),
(325, 123, 'DSP – TMS320F28335.', '0.0', '1543908257', NULL, NULL),
(326, 123, 'Programming Language – C, C++, Linux System Programming. Compilation (GPOS and RTOS), Microcontroller – 8051, ARM7 (LPC2148) and TCP/IP Socket programming.', '0.0', '1543908257', NULL, NULL),
(327, 123, 'Protocols –UART, SPI, I2C, CAN, RS485, RS232.', '0.0', '1543908257', NULL, NULL),
(328, 123, 'IDE – Keil, CCS.', '0.0', '1543908257', NULL, NULL),
(329, 123, 'Microcontroller – 8051, ARM7(LPC2148)', '0.0', '1543908257', NULL, NULL),
(340, 124, 'Operating system :Window,Linux', '0.0', '1544001970', NULL, NULL),
(341, 124, 'Software languages :C, Embedded C.', '0.0', '1544001970', NULL, NULL),
(342, 124, 'Hardware platform :PIC,MSP430,AVR 8bit MCU Atmega(8/2560).', '0.0', '1544001970', NULL, NULL),
(343, 124, 'Development Tools :Keil, IAR, Avr studio, Arduino,Orcad, Proteus,Protel Arduino,Orcad,Proteus,Protel Protocol Standard :UART, SPI, I2C, Modbus RTU', '0.0', '1544001970', NULL, NULL),
(344, 124, 'Compilers : c compiler', '0.0', '1544001970', NULL, NULL),
(345, 122, 'Operating system  : Windows/Linux', '0.0', '1543902664', NULL, NULL),
(346, 122, 'Software languages  : Java/Android/AWS Lambda', '0.0', '1543902664', NULL, NULL),
(347, 122, 'Hardware platform : Andoid/IoT/Arduino/Raspberry pie/AWS Echo show etc.', '0.0', '1543902664', NULL, NULL),
(348, 122, 'Development Tools  : Android Studio,Eclips', '0.0', '1543902664', NULL, NULL),
(349, 125, 'Communication protocol: UART,I2C,SPI and CAN Protocal', '0.0', '1544192984', NULL, NULL),
(350, 125, 'Wireless communication: GSM,GPS and Xbee interface with MCU', '0.0', '1544192984', NULL, NULL),
(351, 125, 'Operating Systems: Windows XP/ 7/8/8.1/10, Ubuntu18.04', '0.0', '1544192984', NULL, NULL),
(352, 126, 'Operating system : QNX operating system,Android N, Windows', '0.0', '1544445430', NULL, NULL),
(353, 126, 'Software languages : embedded c,c, Linux', '0.0', '1544445430', NULL, NULL),
(354, 126, 'Hardware platform :  Automotive cluster, Infotainment head unit.', '0.0', '1544445430', NULL, NULL),
(355, 126, 'Development Tools : QNX momentics, eclipse Kepler', '0.0', '1544445430', NULL, NULL),
(356, 126, 'Protocol Standard : CAN', '0.0', '1544445430', NULL, NULL),
(357, 126, 'Compilers : QNX inbuilt compiler', '0.0', '1544445430', NULL, NULL),
(358, 127, 'Operating system : Windows, Linux', '0.0', '1544504173', NULL, NULL),
(359, 127, 'Software languages : Embedded c, C, Basic of C++.', '0.0', '1544504173', NULL, NULL),
(360, 127, 'Development Tools : Eclipse(kepler), Beyond Studio, MPLAB', '0.0', '1544504173', NULL, NULL),
(361, 127, 'Protocol Standard : I2C, UART,TTL, RS485.', '0.0', '1544504173', NULL, NULL),
(362, 127, 'Compilers : C Compiler, XC8 Compiler', '0.0', '1544504173', NULL, NULL),
(363, 128, 'Operating system : Linux-Ubuntu, Windows', '0.0', '1544506396', NULL, NULL),
(364, 128, 'Software languages : C, Linux Shell Scripting', '0.0', '1544506396', NULL, NULL),
(365, 128, 'Hardware platform : ARM Cortex A8, AVR etc.', '0.0', '1544506396', NULL, NULL),
(366, 128, 'Development Tools : AVR Toolchain, CVAVR, CCS (for ARM), GDB, JTAG', '0.0', '1544506396', NULL, NULL),
(367, 128, 'Protocol Standard :  Serial Interfaces: UART, I2C , SPI ADC, Timers, RTC, Socket Programming Linux Kernel Internals', '0.0', '1544506396', NULL, NULL),
(368, 128, 'Compilers : GCC (AVR GCC, ARM GCC)', '0.0', '1544506396', NULL, NULL),
(375, 129, 'Operating system : Winodws, Linux', '4.0', '1544791574', NULL, NULL),
(376, 129, 'Software languages : C, Embedded C , Python', '4.0', '1544791574', NULL, NULL),
(377, 129, 'Hardware platform : AVR, 8051, ARM cortex m0, ARM SC000', '4.0', '1544791574', NULL, NULL),
(378, 129, 'Development Tools : KEIL, GCC, IAR', '4.0', '1544791574', NULL, NULL),
(379, 129, 'Protocol Standard : I2C, UART, SPI, MODBUS', '4.0', '1544791574', NULL, NULL),
(380, 129, 'Compilers : GCC, KEIL etc', '4.0', '1544791574', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `email`, `company_name`, `password`, `role_id`, `status`, `unique_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '9876543210', 'admin@syslogyx.com', 'Syslogyx Pvt Ltd.', '$2y$10$WeOltTOYuFdXuPnq.7XhnOK08arbMJtxJ4d5.yTirOqjwiglANbqW', 1, 'Active', 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', NULL, NULL, NULL),
(2, 'monica', '9876543234', 'monica@syslogyx.com', 'Syslogyx Pvt Ltd.', '$2y$10$WeOltTOYuFdXuPnq.7XhnOK08arbMJtxJ4d5.yTirOqjwiglANbqW', 2, 'Active', 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', NULL, '2018-10-29 13:10:50', '2018-12-10 05:57:30'),
(3, 'Bhushan Jain', '9923780240', 'bhushan@syslogyx.com', 'Syslogyx Pvt. Ltd.', '$2y$10$WeOltTOYuFdXuPnq.7XhnOK08arbMJtxJ4d5.yTirOqjwiglANbqW', 1, 'Active', 'YWRtaW5Ac3lzbG9neXguY29tOTg3NjU0MzIxMFN5c2xvZ3l4IFB2dCBMdGQu', NULL, '2018-10-31 04:58:14', '2018-10-31 04:58:14'),
(155, 'Mamta  Lawrence', '9922303640', 'mamtalawrence@gmail.com', 'Candidate', '$2y$10$e2cYFi4Ok1XYAq8V30I7BenaXtKvyUgHQjSGqqK7dLPhJ5BCWKiPC', 5, 'Active', NULL, NULL, '2018-12-18 07:25:58', '2018-12-18 07:25:58'),
(156, 'Palash   Kohli', '9765169473', 'palashkohli@hotmail.com', 'Candidate', '$2y$10$numK82g0O9sxhW7TORnT4eNOVuY5VtY2m6nqZnYjR30I2iSws3O8S', 5, 'Active', NULL, NULL, '2018-12-18 07:25:58', '2018-12-18 07:25:58'),
(157, 'Vaibhav  Yerawar', '9096820845', 'vaibhav.yerawar@yahoo.com', 'Candidate', '$2y$10$ktLneu/Jg5kztrkycQwNmO8QnztgyNdlOW7IIYI1IxSgrlErEpi9m', 5, 'Active', NULL, NULL, '2018-12-18 07:25:59', '2018-12-18 07:25:59'),
(158, 'Nilesh  Manker', '08698998731', 'nileshmanker1990@gmail.com', 'Candidate', '$2y$10$bhj.Pj1QpRUp4obI35K/lebqaCKA8Tw/blkJp4NJwAubQKYAQj6pq', 5, 'Active', NULL, NULL, '2018-12-18 07:25:59', '2018-12-18 07:25:59'),
(159, 'Harshal D Kamble', '09960507286', 'harshalkamble2002@gmail.com', 'Candidate', '$2y$10$tRaaEb501GVsXG8lr1WbdOHaEuKfuGEgG15NzIIjaek.47bcNf8Su', 5, 'Active', NULL, NULL, '2018-12-18 07:25:59', '2018-12-18 07:25:59'),
(160, 'VIJAY  PATLE', '9752023820', 'vpatle95@gmail.com', 'Candidate', '$2y$10$SDjK1flEhoqoo2BcNNbz3unPqCwCk5yUc59qsB9vIih7KUCq792SK', 5, 'Active', NULL, NULL, '2018-12-18 07:25:59', '2018-12-18 07:25:59'),
(161, 'Ajay  Harwani', '8956891810', 'a.harwani4289@gmail.com', 'Candidate', '$2y$10$TLwbrZImmmMhOD8dPRypDeT9XduxOomQ1M0PXTh.rgcnaWKdd3CHS', 5, 'Active', NULL, NULL, '2018-12-18 07:25:59', '2018-12-18 07:25:59'),
(162, 'Pavan  Gulhane', '9036453942', 'gulhane24pvn@gmail.com', 'Candidate', '$2y$10$B1tf6CP2urZ7f4NI8quUi.9X8Tg5O2ZdXaZK2drbLBxhqojeIz5Sa', 5, 'Active', NULL, NULL, '2018-12-18 07:25:59', '2018-12-18 07:25:59'),
(163, 'JIteshkumar  Patle', '9421805134', 'jpatle2308@gmail.com', 'Candidate', '$2y$10$WACAXYJDgqXhv9GXNDABbeArLO0ODHMc./P0LukAgZAg5VvLERC5G', 5, 'Active', NULL, NULL, '2018-12-18 07:25:59', '2018-12-18 07:25:59'),
(164, 'Umesh  Singh', '9970336697', 'umeshsngh182@gmail.com', 'Candidate', '$2y$10$8sN0Bej899YK7OOiN2sG3Own9BIZ/Afj5Z2AAHLr.E47khVWvZmkO', 5, 'Active', NULL, NULL, '2018-12-18 07:26:00', '2018-12-18 07:26:00'),
(165, 'Nikhil  Muley', '9021411447', 'nikhilmuley7@gmail.com', 'Candidate', '$2y$10$pbyKz7xoCJeyFtzWEXF/4./ZA.yXCRQ1/a5E7.OTg1BpBbexRBHfi', 5, 'Active', NULL, NULL, '2018-12-18 07:26:00', '2018-12-18 07:26:00'),
(166, 'Pravin  Kosurkar', '9049672390', 'pravinkosurkar@gmail.com', 'Candidate', '$2y$10$rXxces0RMeIORFUae1UequS5Po1IlBJ8iwe4Wjv60X7OwUD9sav0m', 5, 'Active', NULL, NULL, '2018-12-18 07:26:00', '2018-12-18 07:26:00'),
(167, 'NALLAKUKKALA  JAYACHANDRA', '9700103996', 'nallakukkalajayachandra@gmail.com', 'Candidate', '$2y$10$JmpA7AjKVj6USbvxVWfTYuZxk457cxq3i4F0RCxmW5gWB/urO3Z4C', 5, 'Active', NULL, NULL, '2018-12-18 07:26:00', '2018-12-18 07:26:00'),
(168, 'Harshal  Borikar', '9028426844', 'borikarharshal@gmail.com', 'Candidate', '$2y$10$WnmKgZjpY1EvalC/GB.6a.qKFOjS8VPcgm2/0nSzbSLkH6SQLCrum', 5, 'Active', NULL, NULL, '2018-12-18 07:26:00', '2018-12-18 07:26:00'),
(169, 'SMITESH  SHENDE', '7709627740', 'smitesh.shende@gmail.com', 'Candidate', '$2y$10$cVoyC/IH9P6lohushv53/.04QdaP4VGxZ6nYf6Isf5if7wYoAsSo.', 5, 'Active', NULL, NULL, '2018-12-18 07:26:00', '2018-12-18 07:26:00'),
(170, 'RAJAT  GUPTA', '9873479643', 'rajat201301@gmail.com', 'Candidate', '$2y$10$6DBjI2Hcy2uWNOvTBBerCuWoDACI9n/DUcwZhnsWR4/NPOuCHiCEW', 5, 'Active', NULL, NULL, '2018-12-18 07:26:00', '2018-12-18 07:26:00'),
(171, 'Shivani   Poddar', '9373009565', 'shivani.poddar.pune@gmail.com', 'Candidate', '$2y$10$JTtOnhlzpWSq22fW1Zvk.O1CB84dRrjUmC4p8UIWAwKrUJgpJ0jR2', 5, 'Active', NULL, NULL, '2018-12-18 07:26:00', '2018-12-18 07:26:00'),
(172, 'VAIBHAV  KUMAR ROY', '8660823175', 'vroy598@gmail.com', 'Candidate', '$2y$10$1ZgTs/BV28R3b6mlILNbEuK670G8Q7PZWQPpcCab7YswqcWYYPNju', 5, 'Active', NULL, NULL, '2018-12-18 07:26:01', '2018-12-18 07:26:01'),
(173, 'Ashish  Sharma', '7057626901', 'ashish.sharma.2992@gmail.com', 'Candidate', '$2y$10$0pJBC2pT8uucYsDoywlfcOQ.eVOlQFHeTUB.n33.0Y1RCYptNTdnK', 5, 'Active', NULL, NULL, '2018-12-18 07:26:01', '2018-12-18 07:26:01'),
(174, 'Vivek  Yadav', '916263282007', 'er.vkky@gmail.com', 'Candidate', '$2y$10$w.yZfbdtyfA10mhGhdBtVeOvD33uIs6soEAHFOn9GqhFMQ6NKgdl.', 5, 'Active', NULL, NULL, '2018-12-18 07:26:01', '2018-12-18 07:26:01'),
(175, 'Amar Hemraj Vaidya', '9766114611', 'amarvaidya86@gmail.com', 'Candidate', '$2y$10$VVdGtbE4cYvA3EtuGinIhO4PHxKxrpwrFGMYrFdXgplHkmoE0J7Em', 5, 'Active', NULL, NULL, '2018-12-18 07:26:01', '2018-12-18 07:26:01'),
(176, 'Dhiraj  Chimurkar', '9970807397', 'dhirajchimurkar@gmail.com', 'Candidate', '$2y$10$akCMpGx/My8JpofTJz3Q1.3iXPZYO8OObRQWSSMHYyxU8jZ5rXBTa', 5, 'Active', NULL, NULL, '2018-12-18 07:26:01', '2018-12-18 07:26:01'),
(177, 'Anoop P K  NA', '9961608834', 'anoopsreepuram@gmail.com', 'Candidate', '$2y$10$cgSQfgYsHhjShN.YsSiy.exhKWVzA1oIisd41owq1wUt37DMW5aba', 5, 'Active', NULL, NULL, '2018-12-18 07:26:01', '2018-12-18 07:26:01'),
(178, 'VAIBHAV  DESHPANDE', '8380097982', 'vaibhav@syslogyx.com', 'Candidate', '$2y$10$P0FBP9kbfMIy4pyE3M76w.brLCuGQJKVxQd07.BobQW7G6F0UZryy', 5, 'Active', NULL, NULL, '2018-12-18 07:26:01', '2018-12-18 07:26:01'),
(179, 'testing  NA', '9960407014', 'aniruddha@syslogyx.com', 'Candidate', '$2y$10$5ct12TlslyfvNm1NX5/19undkX1Ex6ywMsuIAj24LX1etT0jGzzF2', 5, 'Active', NULL, NULL, '2018-12-18 07:26:01', '2018-12-18 07:26:01'),
(180, 'testing  NA', '9021592175', 'nikhil@syslogyx.com', 'Candidate', '$2y$10$Y5GPrEc0uP.1cHEMZlMVUOXiUw/ILDUPhZkmrHCjt6iu59GGxebr6', 5, 'Active', NULL, NULL, '2018-12-18 07:26:02', '2018-12-18 07:26:02'),
(181, 'V Sai Teja  NA', '8885432184', 'vellankisaiteja114@gmail.com', 'Candidate', '$2y$10$IzO6Wyw3bi0hGnlUecAQd.5PEnqHjdy4mvzWYRqrwx53tAFMXBQt2', 5, 'Active', NULL, NULL, '2018-12-18 07:26:02', '2018-12-18 07:26:02'),
(182, 'Gaurav  Likhar', '7769034499', 'gaurav.likhar89@yahoo.com', 'Candidate', '$2y$10$p5nj6s6BoQ/T/gnkW.laCOffbqjNowWRxZzG7lR/VDsp6W6RtMSyK', 5, 'Active', NULL, NULL, '2018-12-18 07:26:02', '2018-12-18 07:26:02'),
(183, 'Cibin  Baby', '8593943980', 'cbcbaby20@gmail.com', 'Candidate', '$2y$10$Yb/9MJDzun4f7EXIwUXISeivcBz3IwFAakd/RZSuF7j0ahtjedrNm', 5, 'Active', NULL, NULL, '2018-12-18 07:26:02', '2018-12-18 07:26:02'),
(184, 'Mayank  Jena', '9916543842', 'mayankjena1995@gmail.com', 'Candidate', '$2y$10$jIe6w0GfuJsncjxf7KO7XunpK0pLQYLMiNpGpcRBO1vjfBRQafzJO', 5, 'Active', NULL, NULL, '2018-12-18 07:26:02', '2018-12-18 07:26:02'),
(185, 'Mayur Manohar Chaudhari', '9890680658', 'mayurch07@gmail.com', 'Candidate', '$2y$10$P3.hU49sVcGJIbWQLLzsf.P27bnKTx12kj3sEclY7fv/XofVi6CHK', 5, 'Active', NULL, NULL, '2018-12-18 07:26:03', '2018-12-18 07:26:03'),
(186, 'Aboli  Bajare', '9113977603', 'bajareaboli5@gmail.com', 'Candidate', '$2y$10$CNFHctVLlqhZsLJGKBkZFed0JsVZzj8oxfNE.tPMG2rLHHrxMskIi', 5, 'Active', NULL, NULL, '2018-12-18 07:26:03', '2018-12-18 07:26:03'),
(187, 'Vikas  Dhote', '9479777799', 'vikasdhote3@gmail.com', 'Candidate', '$2y$10$jzNuS3jYZLgaQsDct9jtKuB4dN305nNtZMMuzsCMdm8ehIvx0tiEq', 5, 'Active', NULL, NULL, '2018-12-18 07:26:03', '2018-12-18 07:26:03'),
(188, 'Mayur  Badnerkar', '9561309841', 'mayur.badnerkar07@gmail.com', 'Candidate', '$2y$10$/0zpdb.4idshpdUaumdeNOkRKJ4l7VLybpfsYttg4MM0amHlngDMW', 5, 'Active', NULL, NULL, '2018-12-18 07:26:03', '2018-12-18 07:26:03'),
(189, 'Sweta  Mishra', '9811902440', 'sweta3283@gmail.com', 'Candidate', '$2y$10$E4jx8N9RrRUXI24bmsN3TekFz3MWHMGpqDC6Tl2OBjIYa6vWTxuWy', 5, 'Active', NULL, NULL, '2018-12-18 07:26:03', '2018-12-18 07:26:03'),
(190, 'Vaibhav  Asole', '8861536490', 'vaibhav.asolejava@gmail.com', 'Candidate', '$2y$10$Yf62ld/HJIqiy3X7MYxUR.eMPphfubB9g5wZojcm2ADiAXyg0rDoa', 5, 'Active', NULL, NULL, '2018-12-18 07:26:04', '2018-12-18 07:26:04'),
(191, 'Vikas  Rastogi', '8010416264', 'rastogivikas08@gmail.com', 'Candidate', '$2y$10$EF2hzO/tl3tH1oeMUxKfPOUWU4z8tcbLg8olvi1xJiLChd2NCIF2m', 5, 'Active', NULL, NULL, '2018-12-18 07:26:04', '2018-12-18 07:26:04'),
(192, 'Ritesh Bhaurao Rewatkar', '7385904326', 'ritesh.allmact@gmail.com', 'Candidate', '$2y$10$0bJbvl2mKahhah7zJx8oHuGiikszl1HFTSwIG16K7O/jLcWzhci5K', 5, 'Active', NULL, NULL, '2018-12-18 07:26:04', '2018-12-18 07:26:04'),
(193, 'Nikhil  Choudhary', '9866320029', 'inikhil001@gmail.com', 'Candidate', '$2y$10$iohXAO96TmaNUDlisuKwZOW7iGzY6u4kpvmNkq3H3IEl8YrEWED06', 5, 'Active', NULL, NULL, '2018-12-18 07:26:04', '2018-12-18 07:26:04'),
(194, 'Sreenu  Ganta', '8056886064', 'sreenu5859@gmail.com', 'Candidate', '$2y$10$C9Lnlmnf33eJBvXV.3uOnOrnm2Thr7YULSC/Aice1XX92sBGbL/j.', 5, 'Active', NULL, NULL, '2018-12-18 07:26:05', '2018-12-18 07:26:05'),
(195, 'Roshan  Thakare', '9860887785', 'roshan.thakare8@gmail.com', 'Candidate', '$2y$10$Zz7NUbZ2SAWe6ScxxQKo8eb5vKd6rVsLfc7a7gfIJmfeg4aCsT4eS', 5, 'Active', NULL, NULL, '2018-12-18 07:26:05', '2018-12-18 07:26:05'),
(196, 'Sagar  Bawne', '8779394244', 'bawnesagar@gmail.com', 'Candidate', '$2y$10$thor0h76GenCkA6GyATDIuTwBPRs6w/0q7.M3mqovqEuyhbfN5PMO', 5, 'Active', NULL, NULL, '2018-12-18 07:26:05', '2018-12-18 07:26:05'),
(197, 'Nomesh Ashok Padole', '9096411278', 'nomeshpadole@yahoo.com', 'Candidate', '$2y$10$e.XBF6jgAELsHIgS9SmBHO8M3c6fccs/sAwPBfmhlApbppXeOzaMW', 5, 'Active', NULL, NULL, '2018-12-18 07:26:05', '2018-12-18 07:26:05'),
(198, 'Ankita  Prasad', '8521458318', 'ankitaprasad.prasad90@gmail.com', 'Candidate', '$2y$10$hYQJikPmvDw7qeK1v0V8UOn2ulg3Nux/mzpiFXpmxY6fwlVJXrUgC', 5, 'Active', NULL, NULL, '2018-12-18 07:26:05', '2018-12-18 07:26:05'),
(199, 'Hiren Rameshbhai Thumar', '9426570128', 'hiren.thumar2702@gmail.com', 'Candidate', '$2y$10$HSKiaoFT.hOLkCQo7ZggsOwKJVaqE0wPq6PbKHTG0/AdiD5MHtDYG', 5, 'Active', NULL, NULL, '2018-12-18 07:26:05', '2018-12-18 07:26:05'),
(200, 'Bhupendra Panchamlal Vishwakarma', '7829103028', 'bhupendra6130@gmail.com', 'Candidate', '$2y$10$aYwxGI4G5Vjwpm1vccdzSukxfRHhdc8NtjdnjeFgcNct0m/R0veZO', 5, 'Active', NULL, NULL, '2018-12-18 07:26:05', '2018-12-18 07:26:05'),
(201, 'Deepika Raju Shinde', '9960897914', 'deepika.shinde08@gmail.com', 'Candidate', '$2y$10$yg5AFSgf7qcUXGeMbVbmtOcwDZAg27KWw8b3ze0fYBcQ97LsSKJoO', 5, 'Active', NULL, NULL, '2018-12-18 07:26:05', '2018-12-18 07:26:05'),
(202, 'Dheeraj Arjun Sawant', '9819368634', 'dheerajsawant5@gmail.com', 'Candidate', '$2y$10$dI/QcyHZz0vmlDLTS2LWROHcZKZA/el0yB8r5HMq4Yoon4U01ivNC', 5, 'Active', NULL, NULL, '2018-12-18 07:26:06', '2018-12-18 07:26:06'),
(203, 'Gautam Kumar Koushal', '9039977134', 'gautamkoushal@gmail.com', 'Candidate', '$2y$10$2AcC1rXlK9yjjw0TtyBQaOddpP2itcHFWUUcKH/WSgoj//uNkukQK', 5, 'Active', NULL, NULL, '2018-12-18 07:26:06', '2018-12-18 07:26:06'),
(204, 'Yogesh R P Singh', '9555844391', 'yogeshsingh073@gmail.com', 'Candidate', '$2y$10$0lD.kryQ0Tar970vclUiwuwY/uVuaV/XB2NEEXw1Y9oLvzhQKPia.', 5, 'Active', NULL, NULL, '2018-12-18 07:26:06', '2018-12-18 07:26:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basic_screening_questions`
--
ALTER TABLE `basic_screening_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `basic_screening_questions_stream_id_foreign` (`stream_id`);

--
-- Indexes for table `basic_screening_result`
--
ALTER TABLE `basic_screening_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `basic_screening_result_candidate_id_foreign` (`candidate_id`),
  ADD KEY `basic_screening_result_question_id_foreign` (`question_id`);

--
-- Indexes for table `candidate_details`
--
ALTER TABLE `candidate_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_details_job_description_id_foreign` (`job_description_id`);

--
-- Indexes for table `candidate_document`
--
ALTER TABLE `candidate_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_document_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `candidate_jd_assoc`
--
ALTER TABLE `candidate_jd_assoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_jd_assoc_candidate_id_foreign` (`candidate_id`),
  ADD KEY `candidate_jd_assoc_job_description_id_foreign` (`job_description_id`);

--
-- Indexes for table `candidate_user_assoc`
--
ALTER TABLE `candidate_user_assoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_user_assoc_candidate_id_foreign` (`candidate_id`),
  ADD KEY `candidate_user_assoc_user_id_foreign` (`user_id`);

--
-- Indexes for table `educationl_details`
--
ALTER TABLE `educationl_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `educationl_details_qualification_id_foreign` (`qualification_id`),
  ADD KEY `educationl_details_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hobbies_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `industrial_experience`
--
ALTER TABLE `industrial_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `industrial_experience_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `job_description`
--
ALTER TABLE `job_description`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_achievements`
--
ALTER TABLE `other_achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `other_achievements_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `pdf_setting`
--
ALTER TABLE `pdf_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qualification_details`
--
ALTER TABLE `qualification_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technical_interview_result`
--
ALTER TABLE `technical_interview_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technical_interview_result_candidate_id_foreign` (`candidate_id`),
  ADD KEY `technical_interview_result_user_id_foreign` (`user_id`);

--
-- Indexes for table `technical_skills`
--
ALTER TABLE `technical_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technical_skills_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basic_screening_questions`
--
ALTER TABLE `basic_screening_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `basic_screening_result`
--
ALTER TABLE `basic_screening_result`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `candidate_details`
--
ALTER TABLE `candidate_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `candidate_document`
--
ALTER TABLE `candidate_document`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `candidate_jd_assoc`
--
ALTER TABLE `candidate_jd_assoc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `candidate_user_assoc`
--
ALTER TABLE `candidate_user_assoc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `educationl_details`
--
ALTER TABLE `educationl_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `industrial_experience`
--
ALTER TABLE `industrial_experience`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;
--
-- AUTO_INCREMENT for table `job_description`
--
ALTER TABLE `job_description`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `other_achievements`
--
ALTER TABLE `other_achievements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `pdf_setting`
--
ALTER TABLE `pdf_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qualification_details`
--
ALTER TABLE `qualification_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `technical_interview_result`
--
ALTER TABLE `technical_interview_result`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `technical_skills`
--
ALTER TABLE `technical_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `basic_screening_questions`
--
ALTER TABLE `basic_screening_questions`
  ADD CONSTRAINT `basic_screening_questions_stream_id_foreign` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`);

--
-- Constraints for table `basic_screening_result`
--
ALTER TABLE `basic_screening_result`
  ADD CONSTRAINT `basic_screening_result_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`),
  ADD CONSTRAINT `basic_screening_result_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `basic_screening_questions` (`id`);

--
-- Constraints for table `candidate_details`
--
ALTER TABLE `candidate_details`
  ADD CONSTRAINT `candidate_details_job_description_id_foreign` FOREIGN KEY (`job_description_id`) REFERENCES `job_description` (`id`);

--
-- Constraints for table `candidate_document`
--
ALTER TABLE `candidate_document`
  ADD CONSTRAINT `candidate_document_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`);

--
-- Constraints for table `candidate_jd_assoc`
--
ALTER TABLE `candidate_jd_assoc`
  ADD CONSTRAINT `candidate_jd_assoc_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`),
  ADD CONSTRAINT `candidate_jd_assoc_job_description_id_foreign` FOREIGN KEY (`job_description_id`) REFERENCES `job_description` (`id`);

--
-- Constraints for table `candidate_user_assoc`
--
ALTER TABLE `candidate_user_assoc`
  ADD CONSTRAINT `candidate_user_assoc_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`),
  ADD CONSTRAINT `candidate_user_assoc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `educationl_details`
--
ALTER TABLE `educationl_details`
  ADD CONSTRAINT `educationl_details_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`),
  ADD CONSTRAINT `educationl_details_qualification_id_foreign` FOREIGN KEY (`qualification_id`) REFERENCES `qualification_details` (`id`);

--
-- Constraints for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD CONSTRAINT `hobbies_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`);

--
-- Constraints for table `industrial_experience`
--
ALTER TABLE `industrial_experience`
  ADD CONSTRAINT `industrial_experience_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`);

--
-- Constraints for table `other_achievements`
--
ALTER TABLE `other_achievements`
  ADD CONSTRAINT `other_achievements_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`);

--
-- Constraints for table `technical_interview_result`
--
ALTER TABLE `technical_interview_result`
  ADD CONSTRAINT `technical_interview_result_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`),
  ADD CONSTRAINT `technical_interview_result_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `technical_skills`
--
ALTER TABLE `technical_skills`
  ADD CONSTRAINT `technical_skills_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
