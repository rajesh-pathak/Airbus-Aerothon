
CREATE TABLE `aircrafts` (
  `acId` int(11) NOT NULL AUTO_INCREMENT,
  `acNumber` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `mfdon` datetime NOT NULL,
  PRIMARY KEY (`acId`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `airfare` (
  `afId` int(11) NOT NULL AUTO_INCREMENT,
  `route` int(11) NOT NULL,
  `fare` int(11) NOT NULL,
  `fsc` int(11) NOT NULL,
  PRIMARY KEY (`afId`),
  KEY `fk_route` (`route`),
  CONSTRAINT `fk_route` FOREIGN KEY (`route`) REFERENCES `route` (`rtid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 
CREATE TABLE `charges` (
  `chId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`chId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `contact_details` (
  `cnId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`cnId`),
  KEY `fk_state` (`state`),
  CONSTRAINT `fk_state` FOREIGN KEY (`state`) REFERENCES `state` (`stid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `discounts` (
  `dtId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`dtId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `employees` (
  `empId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `flightschedule` (
  `flId` int(11) NOT NULL AUTO_INCREMENT,
  `flightdate` date DEFAULT NULL,
  `departure` time DEFAULT NULL,
  `arrival` time DEFAULT NULL,
  `aircraft` int(11) NOT NULL,
  `netfare` int(11) NOT NULL,
  PRIMARY KEY (`flId`),
  KEY `fk_aircraft` (`aircraft`),
  KEY `fk_netfare` (`netfare`),
  CONSTRAINT `fk_aircraft` FOREIGN KEY (`aircraft`) REFERENCES `aircrafts` (`acid`),
  CONSTRAINT `fk_netfare` FOREIGN KEY (`netfare`) REFERENCES `airfare` (`afid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `passengers` (
  `psId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `contacts` int(11) DEFAULT NULL,
  PRIMARY KEY (`psId`),
  KEY `fk_contacts` (`contacts`),
  CONSTRAINT `fk_contacts` FOREIGN KEY (`contacts`) REFERENCES `contact_details` (`cnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `route` (
  `rtId` int(11) NOT NULL AUTO_INCREMENT,
  `airport` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `rtCode` varchar(255) NOT NULL,
  PRIMARY KEY (`rtId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `state` (
  `stId` int(11) NOT NULL AUTO_INCREMENT,
  `statename` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'India',
  PRIMARY KEY (`stId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `tickets` (
  `tktId` int(11) NOT NULL AUTO_INCREMENT,
  `booking_date` datetime NOT NULL,
  `departure_date` datetime NOT NULL,
  `passenger` int(11) NOT NULL,
  `flight` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `seats` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  `charges` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`tktId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `transactions` (
  `tsId` int(11) NOT NULL AUTO_INCREMENT,
  `tktId` int(11) NOT NULL,
  `booking_date` datetime NOT NULL,
  `departure_date` datetime NOT NULL,
  `passenger` int(11) NOT NULL,
  `flight` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `seats` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  `charges` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`tsId`),
  KEY `fk_employee` (`employee`),
  KEY `fk_charges` (`charges`),
  KEY `fk_discount` (`discount`),
  KEY `fk_flight` (`flight`),
  KEY `fk_passenger` (`passenger`),
  CONSTRAINT `fk_charges` FOREIGN KEY (`charges`) REFERENCES `charges` (`chid`),
  CONSTRAINT `fk_discount` FOREIGN KEY (`discount`) REFERENCES `discounts` (`dtid`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`empid`),
  CONSTRAINT `fk_flight` FOREIGN KEY (`flight`) REFERENCES `flightschedule` (`flid`),
  CONSTRAINT `fk_passenger` FOREIGN KEY (`passenger`) REFERENCES `passengers` (`psid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;