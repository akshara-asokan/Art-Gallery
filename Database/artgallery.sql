# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     artgallery
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2022-04-19 12:20:30
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'artgallery'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "artgallery" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "artgallery";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(10) unsigned NOT NULL auto_increment,
  "admin_username" varchar(50) default NULL,
  "admin_password" varchar(50) default NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_username", "admin_password") VALUES
	('1','Admin','Admin123');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artist'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artist" (
  "artist_id" int(10) unsigned NOT NULL auto_increment,
  "artist_name" varchar(50) default NULL,
  "artist_contact" varchar(50) default NULL,
  "artist_email" varchar(50) default NULL,
  "artist_address" varchar(50) default NULL,
  "artist_gender" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "artwork_subtypeid" varchar(50) default NULL,
  "artist_exp" varchar(50) default NULL,
  "artist_photo" varchar(50) default NULL,
  "artist_proof" varchar(50) default NULL,
  "artist_password" varchar(50) default NULL,
  "artist_doj" varchar(50) default NULL,
  "artist_vstatus" int(10) default '0',
  PRIMARY KEY  ("artist_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_artist'
#

LOCK TABLES "tbl_artist" WRITE;
/*!40000 ALTER TABLE "tbl_artist" DISABLE KEYS;*/
REPLACE INTO "tbl_artist" ("artist_id", "artist_name", "artist_contact", "artist_email", "artist_address", "artist_gender", "place_id", "artwork_subtypeid", "artist_exp", "artist_photo", "artist_proof", "artist_password", "artist_doj", "artist_vstatus") VALUES
	('6','Raj ','9874563214','aksharaashokan5510@gmail.com','    Rajvilla                    
                ','Male','4','3','ik','Artist_1726.jpg','Artist_1032.png','12345678','2022-02-24',1);
REPLACE INTO "tbl_artist" ("artist_id", "artist_name", "artist_contact", "artist_email", "artist_address", "artist_gender", "place_id", "artwork_subtypeid", "artist_exp", "artist_photo", "artist_proof", "artist_password", "artist_doj", "artist_vstatus") VALUES
	('7','Nivedhya','9087679876','aksharaashokan602@gmail.com','             stonemountain           ','Female','2','5','5yr','Artist_1228.jpg','Artist_1502.jpg','12345678','2022-03-10',1);
/*!40000 ALTER TABLE "tbl_artist" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artistevent'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artistevent" (
  "artistevent_id" int(10) unsigned NOT NULL auto_increment,
  "artistevent_name" varchar(50) default NULL,
  "artistevent_address" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "artistevent_startingdate" varchar(50) default NULL,
  "artistevent_endingdate" varchar(50) default NULL,
  "artistevent_time" varchar(50) default NULL,
  "artistevent_poster" varchar(50) default NULL,
  "artist_id" int(10) unsigned default NULL,
  "artistevent_rate" int(10) unsigned default NULL,
  "fee_status" int(10) unsigned default '0',
  "artistevent_vstatus" int(10) unsigned default '0',
  PRIMARY KEY  ("artistevent_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_artistevent'
#

LOCK TABLES "tbl_artistevent" WRITE;
/*!40000 ALTER TABLE "tbl_artistevent" DISABLE KEYS;*/
REPLACE INTO "tbl_artistevent" ("artistevent_id", "artistevent_name", "artistevent_address", "place_id", "artistevent_startingdate", "artistevent_endingdate", "artistevent_time", "artistevent_poster", "artist_id", "artistevent_rate", "fee_status", "artistevent_vstatus") VALUES
	('1','xyz','   rd6                     ','3','2022-02-01','2022-02-06','10am-5pm','Artisteventposter_1155.jpg','1','50','0','0');
REPLACE INTO "tbl_artistevent" ("artistevent_id", "artistevent_name", "artistevent_address", "place_id", "artistevent_startingdate", "artistevent_endingdate", "artistevent_time", "artistevent_poster", "artist_id", "artistevent_rate", "fee_status", "artistevent_vstatus") VALUES
	('2','xyz','         8i89               ','3','2022-02-02','2022-02-04','10am-5pm','Artisteventposter_1624.jpg','1','50','0','0');
REPLACE INTO "tbl_artistevent" ("artistevent_id", "artistevent_name", "artistevent_address", "place_id", "artistevent_startingdate", "artistevent_endingdate", "artistevent_time", "artistevent_poster", "artist_id", "artistevent_rate", "fee_status", "artistevent_vstatus") VALUES
	('4','dhisha','      ghk                  ','4','2022-02-09','2022-02-13','10am-5pm','Artisteventposter_1354.png','2','20','0','0');
REPLACE INTO "tbl_artistevent" ("artistevent_id", "artistevent_name", "artistevent_address", "place_id", "artistevent_startingdate", "artistevent_endingdate", "artistevent_time", "artistevent_poster", "artist_id", "artistevent_rate", "fee_status", "artistevent_vstatus") VALUES
	('6','wwww','    fj                    ','5','2022-02-10','2022-02-18','10am-5pm','Artisteventposter_1663.png','2','50','0','0');
REPLACE INTO "tbl_artistevent" ("artistevent_id", "artistevent_name", "artistevent_address", "place_id", "artistevent_startingdate", "artistevent_endingdate", "artistevent_time", "artistevent_poster", "artist_id", "artistevent_rate", "fee_status", "artistevent_vstatus") VALUES
	('7','xyz','     ghgbj                   ','3','2022-02-26','2022-03-13','10am-5pm','Artisteventposter_1743.jpg','6','50','0','0');
REPLACE INTO "tbl_artistevent" ("artistevent_id", "artistevent_name", "artistevent_address", "place_id", "artistevent_startingdate", "artistevent_endingdate", "artistevent_time", "artistevent_poster", "artist_id", "artistevent_rate", "fee_status", "artistevent_vstatus") VALUES
	('8','wr','           wwds             ','2','2022-03-12','2022-03-31','10am-5pm','Artisteventposter_1140.png','6','20','0','0');
/*!40000 ALTER TABLE "tbl_artistevent" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artistrating'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artistrating" (
  "artistrating_id" int(10) unsigned NOT NULL auto_increment,
  "organization_id" int(10) unsigned default NULL,
  "customer_id" int(10) unsigned default NULL,
  "artistrating_value" varchar(50) default NULL,
  "artist_id" int(10) unsigned default NULL,
  "artistrating_feedback" varchar(50) default NULL,
  PRIMARY KEY  ("artistrating_id")
);



#
# Dumping data for table 'tbl_artistrating'
#

# No data found.



#
# Table structure for table 'tbl_artistticketbooking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artistticketbooking" (
  "artisteventticket_id" int(10) unsigned NOT NULL auto_increment,
  "artistevent_id" int(10) unsigned default NULL,
  "customer_id" int(10) unsigned default NULL,
  "booking_date" varchar(50) default NULL,
  "status" int(10) unsigned default '0',
  PRIMARY KEY  ("artisteventticket_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_artistticketbooking'
#

LOCK TABLES "tbl_artistticketbooking" WRITE;
/*!40000 ALTER TABLE "tbl_artistticketbooking" DISABLE KEYS;*/
REPLACE INTO "tbl_artistticketbooking" ("artisteventticket_id", "artistevent_id", "customer_id", "booking_date", "status") VALUES
	('1','1','4','2022-02-18','1');
REPLACE INTO "tbl_artistticketbooking" ("artisteventticket_id", "artistevent_id", "customer_id", "booking_date", "status") VALUES
	('2','7','5','2022-03-19','1');
REPLACE INTO "tbl_artistticketbooking" ("artisteventticket_id", "artistevent_id", "customer_id", "booking_date", "status") VALUES
	('3','7','5','2022-03-21','1');
REPLACE INTO "tbl_artistticketbooking" ("artisteventticket_id", "artistevent_id", "customer_id", "booking_date", "status") VALUES
	('4','7','5','2022-03-07','1');
/*!40000 ALTER TABLE "tbl_artistticketbooking" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artwork'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artwork" (
  "artwork_id" int(10) unsigned NOT NULL auto_increment,
  "artwork_name" varchar(50) default NULL,
  "artwork_size" varchar(50) default NULL,
  "artwork_subtypeid" int(10) unsigned default NULL,
  "artwork_biddate" varchar(50) default NULL,
  "artwork_bidtime" varchar(50) default NULL,
  "artwork_rate" int(10) unsigned default NULL,
  "artwork_photo" varchar(50) default NULL,
  "artwork_status" int(10) unsigned default '0',
  "artist_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("artwork_id")
) AUTO_INCREMENT=26;



#
# Dumping data for table 'tbl_artwork'
#

LOCK TABLES "tbl_artwork" WRITE;
/*!40000 ALTER TABLE "tbl_artwork" DISABLE KEYS;*/
REPLACE INTO "tbl_artwork" ("artwork_id", "artwork_name", "artwork_size", "artwork_subtypeid", "artwork_biddate", "artwork_bidtime", "artwork_rate", "artwork_photo", "artwork_status", "artist_id") VALUES
	('21','abc','3','4','2022-03-01','14:33','2500','Artwork_1675.jpg','0','6');
REPLACE INTO "tbl_artwork" ("artwork_id", "artwork_name", "artwork_size", "artwork_subtypeid", "artwork_biddate", "artwork_bidtime", "artwork_rate", "artwork_photo", "artwork_status", "artist_id") VALUES
	('22','abc','3','4','2022-03-01','14:33','250','Artwork_2109.jpg','0','6');
REPLACE INTO "tbl_artwork" ("artwork_id", "artwork_name", "artwork_size", "artwork_subtypeid", "artwork_biddate", "artwork_bidtime", "artwork_rate", "artwork_photo", "artwork_status", "artist_id") VALUES
	('23','rrtf','15*40cm','4','2022-03-15','10:00','7000','Artwork_1369.jpg','0','6');
REPLACE INTO "tbl_artwork" ("artwork_id", "artwork_name", "artwork_size", "artwork_subtypeid", "artwork_biddate", "artwork_bidtime", "artwork_rate", "artwork_photo", "artwork_status", "artist_id") VALUES
	('24','rrt','20*15cm','3','2022-03-12','10:00','8000','Artwork_1487.jpg','1','6');
REPLACE INTO "tbl_artwork" ("artwork_id", "artwork_name", "artwork_size", "artwork_subtypeid", "artwork_biddate", "artwork_bidtime", "artwork_rate", "artwork_photo", "artwork_status", "artist_id") VALUES
	('25','abcs','20*15cm','5','2022-03-14','10:00','8000','Artwork_1746.jpg','0','7');
/*!40000 ALTER TABLE "tbl_artwork" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artworkbooking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artworkbooking" (
  "artworkbooking_id" int(10) unsigned NOT NULL auto_increment,
  "bid_id" int(10) unsigned default NULL,
  "artworkbooking_date" varchar(50) default NULL,
  "payment_status" int(10) unsigned default '0',
  PRIMARY KEY  ("artworkbooking_id")
) AUTO_INCREMENT=25;



#
# Dumping data for table 'tbl_artworkbooking'
#

LOCK TABLES "tbl_artworkbooking" WRITE;
/*!40000 ALTER TABLE "tbl_artworkbooking" DISABLE KEYS;*/
REPLACE INTO "tbl_artworkbooking" ("artworkbooking_id", "bid_id", "artworkbooking_date", "payment_status") VALUES
	('8','5','2022-03-11','1');
REPLACE INTO "tbl_artworkbooking" ("artworkbooking_id", "bid_id", "artworkbooking_date", "payment_status") VALUES
	('17','5','2022-03-14','1');
REPLACE INTO "tbl_artworkbooking" ("artworkbooking_id", "bid_id", "artworkbooking_date", "payment_status") VALUES
	('18','5','2022-03-16','1');
REPLACE INTO "tbl_artworkbooking" ("artworkbooking_id", "bid_id", "artworkbooking_date", "payment_status") VALUES
	('19','5','2022-03-16','1');
REPLACE INTO "tbl_artworkbooking" ("artworkbooking_id", "bid_id", "artworkbooking_date", "payment_status") VALUES
	('20','5','2022-03-16','1');
REPLACE INTO "tbl_artworkbooking" ("artworkbooking_id", "bid_id", "artworkbooking_date", "payment_status") VALUES
	('21','5','2022-03-16','1');
REPLACE INTO "tbl_artworkbooking" ("artworkbooking_id", "bid_id", "artworkbooking_date", "payment_status") VALUES
	('22','5','2022-03-18','1');
REPLACE INTO "tbl_artworkbooking" ("artworkbooking_id", "bid_id", "artworkbooking_date", "payment_status") VALUES
	('23','5','2022-03-18','1');
REPLACE INTO "tbl_artworkbooking" ("artworkbooking_id", "bid_id", "artworkbooking_date", "payment_status") VALUES
	('24','5','2022-03-18','1');
/*!40000 ALTER TABLE "tbl_artworkbooking" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artworkgallery'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artworkgallery" (
  "artworkgallery_id" int(10) unsigned NOT NULL auto_increment,
  "artwork_id" int(10) unsigned default NULL,
  "gallery_caption" varchar(50) default NULL,
  "gallery_image" varchar(50) default NULL,
  PRIMARY KEY  ("artworkgallery_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_artworkgallery'
#

LOCK TABLES "tbl_artworkgallery" WRITE;
/*!40000 ALTER TABLE "tbl_artworkgallery" DISABLE KEYS;*/
REPLACE INTO "tbl_artworkgallery" ("artworkgallery_id", "artwork_id", "gallery_caption", "gallery_image") VALUES
	('1','1','dfd','Artgallery_1949.jpg');
REPLACE INTO "tbl_artworkgallery" ("artworkgallery_id", "artwork_id", "gallery_caption", "gallery_image") VALUES
	('2','3','aju','Artgallery_1230.jpg');
REPLACE INTO "tbl_artworkgallery" ("artworkgallery_id", "artwork_id", "gallery_caption", "gallery_image") VALUES
	('3','24','abc','Artgallery_1506.JPG');
REPLACE INTO "tbl_artworkgallery" ("artworkgallery_id", "artwork_id", "gallery_caption", "gallery_image") VALUES
	('6','24','rrt','Artgallery_1263.jpg');
/*!40000 ALTER TABLE "tbl_artworkgallery" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artworksubtype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artworksubtype" (
  "artwork_subtypeid" int(10) unsigned NOT NULL auto_increment,
  "artwork_subtypename" varchar(50) default NULL,
  "artwork_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("artwork_subtypeid")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_artworksubtype'
#

LOCK TABLES "tbl_artworksubtype" WRITE;
/*!40000 ALTER TABLE "tbl_artworksubtype" DISABLE KEYS;*/
REPLACE INTO "tbl_artworksubtype" ("artwork_subtypeid", "artwork_subtypename", "artwork_id") VALUES
	('3','portrait','1');
REPLACE INTO "tbl_artworksubtype" ("artwork_subtypeid", "artwork_subtypename", "artwork_id") VALUES
	('4','xyz','2');
REPLACE INTO "tbl_artworksubtype" ("artwork_subtypeid", "artwork_subtypename", "artwork_id") VALUES
	('5','oil paint','1');
/*!40000 ALTER TABLE "tbl_artworksubtype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artworktype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artworktype" (
  "artwork_id" int(10) unsigned NOT NULL auto_increment,
  "artwork_type" varchar(50) default NULL,
  PRIMARY KEY  ("artwork_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_artworktype'
#

LOCK TABLES "tbl_artworktype" WRITE;
/*!40000 ALTER TABLE "tbl_artworktype" DISABLE KEYS;*/
REPLACE INTO "tbl_artworktype" ("artwork_id", "artwork_type") VALUES
	('1','painting');
REPLACE INTO "tbl_artworktype" ("artwork_id", "artwork_type") VALUES
	('2','Sculpture');
/*!40000 ALTER TABLE "tbl_artworktype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_bid'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_bid" (
  "bid_id" int(10) unsigned NOT NULL auto_increment,
  "artwork_id" int(10) unsigned default NULL,
  "bid_time" varchar(50) default NULL,
  "customer_id" int(10) unsigned default NULL,
  "bid_rate" int(50) default NULL,
  "bid_date" varchar(50) default NULL,
  "bid_status" int(10) unsigned default '0',
  PRIMARY KEY  ("bid_id")
) AUTO_INCREMENT=19;



#
# Dumping data for table 'tbl_bid'
#

LOCK TABLES "tbl_bid" WRITE;
/*!40000 ALTER TABLE "tbl_bid" DISABLE KEYS;*/
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('1','21',NULL,NULL,2500,NULL,'0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('2','22',NULL,NULL,250,NULL,'0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('3','21','10:37:17','4',3000,'2022-02-26','2');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('4','21','12:42:42','4',4000,'2022-02-26','0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('5','21','22:30:57','5',5000,'2022-03-08','1');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('6','23',NULL,NULL,7000,NULL,'0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('7','24',NULL,NULL,8000,NULL,'0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('8','22','11:46:47','5',500,'2022-03-13','2');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('9','22','11:50:37','5',1000,'2022-03-13','0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('10','22','11:52:55','5',1000,'2022-03-13','0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('11','22','11:54:31','5',800,'2022-03-13','0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('12','23','12:03:27','5',9000,'2022-03-13','0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('13','25',NULL,NULL,8000,NULL,'0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('14','25','12:28:33','5',9000,'2022-03-13','2');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('15','25','16:01:23','5',10000,'2022-03-13','1');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('16','21','14:15:32','5',9000,'2022-03-14','0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('17','22','14:48:49','5',2000,'2022-03-14','0');
REPLACE INTO "tbl_bid" ("bid_id", "artwork_id", "bid_time", "customer_id", "bid_rate", "bid_date", "bid_status") VALUES
	('18','24','12:01:15','5',12000,'2022-03-18','1');
/*!40000 ALTER TABLE "tbl_bid" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(10) unsigned NOT NULL auto_increment,
  "customer_id" int(10) unsigned default NULL,
  "organization_id" int(10) unsigned default '0',
  "artist_id" int(10) unsigned default '0',
  "complaint_description" varchar(50) default NULL,
  "complaint_date" varchar(50) default NULL,
  "complaint_reply" varchar(50) default 'Not Yet Replied',
  "complaint_status" int(10) unsigned default '0',
  "artistevent_id" int(10) unsigned default '0',
  "orgevent_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "customer_id", "organization_id", "artist_id", "complaint_description", "complaint_date", "complaint_reply", "complaint_status", "artistevent_id", "orgevent_id") VALUES
	('1','5','0','6','lack of space','2022-04-09','abc','1','7',NULL);
REPLACE INTO "tbl_complaint" ("complaint_id", "customer_id", "organization_id", "artist_id", "complaint_description", "complaint_date", "complaint_reply", "complaint_status", "artistevent_id", "orgevent_id") VALUES
	('2','5','0','6','hgh','2022-04-09','Not Yet Replied','0','7',NULL);
REPLACE INTO "tbl_complaint" ("complaint_id", "customer_id", "organization_id", "artist_id", "complaint_description", "complaint_date", "complaint_reply", "complaint_status", "artistevent_id", "orgevent_id") VALUES
	('3','5','0','6','er','2022-04-09','Not Yet Replied','0','7',NULL);
REPLACE INTO "tbl_complaint" ("complaint_id", "customer_id", "organization_id", "artist_id", "complaint_description", "complaint_date", "complaint_reply", "complaint_status", "artistevent_id", "orgevent_id") VALUES
	('4','5','4','0','tfyu','2022-04-09','Not Yet Replied','0','0','2');
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complainttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complainttype" (
  "complainttype_id" int(10) unsigned NOT NULL auto_increment,
  "complainttype_name" varchar(50) default NULL,
  PRIMARY KEY  ("complainttype_id")
);



#
# Dumping data for table 'tbl_complainttype'
#

# No data found.



#
# Table structure for table 'tbl_customer'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_customer" (
  "customer_id" int(10) unsigned NOT NULL auto_increment,
  "customer_name" varchar(50) default NULL,
  "customer_contact" varchar(50) default NULL,
  "customer_email" varchar(50) default NULL,
  "customer_address" varchar(50) default NULL,
  "customer_gender" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "customer_photo" varchar(50) default NULL,
  "customer_dob" varchar(50) default NULL,
  "customer_doj" varchar(50) default NULL,
  "customer_password" varchar(50) default NULL,
  PRIMARY KEY  ("customer_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_customer'
#

LOCK TABLES "tbl_customer" WRITE;
/*!40000 ALTER TABLE "tbl_customer" DISABLE KEYS;*/
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "customer_gender", "place_id", "customer_photo", "customer_dob", "customer_doj", "customer_password") VALUES
	('1','aju','9855203147','aju@gmail.com',' gfyt ','Male','3','User_1893.jpg','1993-04-15',NULL,'123');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "customer_gender", "place_id", "customer_photo", "customer_dob", "customer_doj", "customer_password") VALUES
	('2','aj','9855203146','aj@gmail.com','          gfyt              ','Male','3','User_1682.jpg','1993-04-15',NULL,'1234');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "customer_gender", "place_id", "customer_photo", "customer_dob", "customer_doj", "customer_password") VALUES
	('3','aju','9855203147','aju@gmail.com','        fgdfg                ','Male','3','User_1092.jpg','2022-01-01','2022-01-27','abc');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "customer_gender", "place_id", "customer_photo", "customer_dob", "customer_doj", "customer_password") VALUES
	('4','Jacob k n','9874563214','jacob@gmail.com','uygu                        
                   ','Male','2','User_1754.png','2022-01-05','2022-01-28','12345678');
REPLACE INTO "tbl_customer" ("customer_id", "customer_name", "customer_contact", "customer_email", "customer_address", "customer_gender", "place_id", "customer_photo", "customer_dob", "customer_doj", "customer_password") VALUES
	('5','Akshara','9544792402','aksharaashokan06@gmail.com','          laavilla              
                ','Female','3','User_1103.jpg','1999-01-01','2022-03-08','12345678');
/*!40000 ALTER TABLE "tbl_customer" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('1','Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('3','Wayanad');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('4','Thiruvananthapuram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('5','Kozhikode');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_eventgallery'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventgallery" (
  "eventgalley_id" int(10) unsigned NOT NULL auto_increment,
  "artistevent_id" int(10) unsigned default '0',
  "orgevent_id" int(10) unsigned default '0',
  "event_caption" varchar(50) default NULL,
  "event_image" varchar(50) default NULL,
  PRIMARY KEY  ("eventgalley_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_eventgallery'
#

LOCK TABLES "tbl_eventgallery" WRITE;
/*!40000 ALTER TABLE "tbl_eventgallery" DISABLE KEYS;*/
REPLACE INTO "tbl_eventgallery" ("eventgalley_id", "artistevent_id", "orgevent_id", "event_caption", "event_image") VALUES
	('1','0','1','abc','Eventgallery_1121.jpg');
REPLACE INTO "tbl_eventgallery" ("eventgalley_id", "artistevent_id", "orgevent_id", "event_caption", "event_image") VALUES
	('2','6','0','yhgyh','Artisteventgallery_1353.jpg');
REPLACE INTO "tbl_eventgallery" ("eventgalley_id", "artistevent_id", "orgevent_id", "event_caption", "event_image") VALUES
	('3','6','0','yyyyyy','Artisteventgallery_1868.png');
REPLACE INTO "tbl_eventgallery" ("eventgalley_id", "artistevent_id", "orgevent_id", "event_caption", "event_image") VALUES
	('4','0','3','iooo','Eventgallery_1373.jpg');
REPLACE INTO "tbl_eventgallery" ("eventgalley_id", "artistevent_id", "orgevent_id", "event_caption", "event_image") VALUES
	('5','7','0','ff','Artisteventgallery_1150.JPG');
/*!40000 ALTER TABLE "tbl_eventgallery" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_eventrating'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventrating" (
  "rating_id" int(10) unsigned NOT NULL auto_increment,
  "artist_id" int(10) unsigned default NULL,
  "customer_id" int(10) unsigned default NULL,
  "organization_id" int(10) unsigned default NULL,
  "rating_value" varchar(50) default NULL,
  "rating_feedback" varchar(50) default NULL,
  "orgevent_id" int(10) unsigned default NULL,
  "rating_date" varchar(50) default NULL,
  "user_name" varchar(50) default NULL,
  "artistevent_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("rating_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_eventrating'
#

LOCK TABLES "tbl_eventrating" WRITE;
/*!40000 ALTER TABLE "tbl_eventrating" DISABLE KEYS;*/
REPLACE INTO "tbl_eventrating" ("rating_id", "artist_id", "customer_id", "organization_id", "rating_value", "rating_feedback", "orgevent_id", "rating_date", "user_name", "artistevent_id") VALUES
	('1','6','5',NULL,'4','good',NULL,'2022-04-09 11:36:17','Alanso','7');
REPLACE INTO "tbl_eventrating" ("rating_id", "artist_id", "customer_id", "organization_id", "rating_value", "rating_feedback", "orgevent_id", "rating_date", "user_name", "artistevent_id") VALUES
	('2',NULL,'5','4','4','Nice','2','2022-04-09 12:13:56','Akshara',NULL);
/*!40000 ALTER TABLE "tbl_eventrating" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_eventtype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventtype" (
  "eventtype_id" int(10) unsigned NOT NULL auto_increment,
  "eventtype_name" varchar(50) default NULL,
  PRIMARY KEY  ("eventtype_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_eventtype'
#

LOCK TABLES "tbl_eventtype" WRITE;
/*!40000 ALTER TABLE "tbl_eventtype" DISABLE KEYS;*/
REPLACE INTO "tbl_eventtype" ("eventtype_id", "eventtype_name") VALUES
	('2','Mega Event');
REPLACE INTO "tbl_eventtype" ("eventtype_id", "eventtype_name") VALUES
	('3','Binnale');
/*!40000 ALTER TABLE "tbl_eventtype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(10) unsigned NOT NULL auto_increment,
  "feedback_description" varchar(50) default NULL,
  "customer_id" int(10) unsigned default NULL,
  "artist_id" int(10) unsigned default NULL,
  "organization_id" int(10) unsigned default NULL,
  "feedback_date" varchar(50) default NULL,
  "artistevent_id" int(10) unsigned default NULL,
  "orgevent_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("feedback_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_feedback'
#

LOCK TABLES "tbl_feedback" WRITE;
/*!40000 ALTER TABLE "tbl_feedback" DISABLE KEYS;*/
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_description", "customer_id", "artist_id", "organization_id", "feedback_date", "artistevent_id", "orgevent_id") VALUES
	('1','null','5','6',NULL,'2022-04-09','7',NULL);
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_description", "customer_id", "artist_id", "organization_id", "feedback_date", "artistevent_id", "orgevent_id") VALUES
	('2','abc','5','4',NULL,'2022-04-09','2',NULL);
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_description", "customer_id", "artist_id", "organization_id", "feedback_date", "artistevent_id", "orgevent_id") VALUES
	('3','xyz','5','6',NULL,'2022-04-09','7',NULL);
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_description", "customer_id", "artist_id", "organization_id", "feedback_date", "artistevent_id", "orgevent_id") VALUES
	('4','qwe','5',NULL,'4','2022-04-09',NULL,'2');
/*!40000 ALTER TABLE "tbl_feedback" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_organization'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_organization" (
  "organization_id" int(10) unsigned NOT NULL auto_increment,
  "organization_name" varchar(50) default NULL,
  "organization_contact" varchar(50) default NULL,
  "organization_email" varchar(50) default NULL,
  "organization_address" varchar(50) default NULL,
  "organization_since" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "organization_password" varchar(50) default NULL,
  "organization_logo" varchar(50) default NULL,
  "organization_proof" varchar(50) default NULL,
  "organization_vstatus" int(10) unsigned default '0',
  "organization_doj" varchar(50) default NULL,
  PRIMARY KEY  ("organization_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_organization'
#

LOCK TABLES "tbl_organization" WRITE;
/*!40000 ALTER TABLE "tbl_organization" DISABLE KEYS;*/
REPLACE INTO "tbl_organization" ("organization_id", "organization_name", "organization_contact", "organization_email", "organization_address", "organization_since", "place_id", "organization_password", "organization_logo", "organization_proof", "organization_vstatus", "organization_doj") VALUES
	('4','xyz','9123547896','xyz@gmail.com','     tyfut                   ','2010-09-08','3','12345678','Org_1198.jpg','Org_1026.jpg','1','2022-01-28');
REPLACE INTO "tbl_organization" ("organization_id", "organization_name", "organization_contact", "organization_email", "organization_address", "organization_since", "place_id", "organization_password", "organization_logo", "organization_proof", "organization_vstatus", "organization_doj") VALUES
	('5','Skyline','9855203147','littysebastian20@gmail.com','       gfuy               
                   
 ','1988-01-06','3','12345678','Organization_1374.jpg','Org_1847.jpg','1','2022-01-28');
REPLACE INTO "tbl_organization" ("organization_id", "organization_name", "organization_contact", "organization_email", "organization_address", "organization_since", "place_id", "organization_password", "organization_logo", "organization_proof", "organization_vstatus", "organization_doj") VALUES
	('6','Budda','9087679876','aksharaashokan5510@gmail.com','               ddty         ','1999-12-31','5','12345678','Org_1874.jpg','Org_1017.jpg','1','2022-03-10');
/*!40000 ALTER TABLE "tbl_organization" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_organizationrating'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_organizationrating" (
  "orgrating_id" int(10) NOT NULL auto_increment,
  "customer_id" int(11) default NULL,
  "artist_id" int(10) unsigned default NULL,
  "orgratingvalue" varchar(50) default NULL,
  "organization_id" int(10) unsigned default NULL,
  "organization_feedback" varchar(50) default NULL,
  PRIMARY KEY  ("orgrating_id")
);



#
# Dumping data for table 'tbl_organizationrating'
#

# No data found.



#
# Table structure for table 'tbl_orgevent'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_orgevent" (
  "orgevent_id" int(10) unsigned NOT NULL auto_increment,
  "orgevent_name" varchar(50) default NULL,
  "place_id" varchar(50) default NULL,
  "orgevent_address" varchar(50) default NULL,
  "orgevent_startingdate" varchar(50) default NULL,
  "orgevent_endingdate" varchar(50) default NULL,
  "orgevent_time" varchar(50) default NULL,
  "orgevent_vstatus" int(10) unsigned default '0',
  "orgevent_poster" varchar(50) default NULL,
  "orgevent_artistallowed" int(10) unsigned default NULL,
  "organization_id" int(10) unsigned default NULL,
  "artistpayment_amount" int(10) unsigned default NULL,
  "eventpayment_amount" int(10) unsigned default NULL,
  PRIMARY KEY  ("orgevent_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_orgevent'
#

LOCK TABLES "tbl_orgevent" WRITE;
/*!40000 ALTER TABLE "tbl_orgevent" DISABLE KEYS;*/
REPLACE INTO "tbl_orgevent" ("orgevent_id", "orgevent_name", "place_id", "orgevent_address", "orgevent_startingdate", "orgevent_endingdate", "orgevent_time", "orgevent_vstatus", "orgevent_poster", "orgevent_artistallowed", "organization_id", "artistpayment_amount", "eventpayment_amount") VALUES
	('2','expo2k22','2','hgkhg                        ','2022-02-11','2022-02-19','10am-5pm','0','Orgeventposter_2080.jpg','30','4','50000','100');
REPLACE INTO "tbl_orgevent" ("orgevent_id", "orgevent_name", "place_id", "orgevent_address", "orgevent_startingdate", "orgevent_endingdate", "orgevent_time", "orgevent_vstatus", "orgevent_poster", "orgevent_artistallowed", "organization_id", "artistpayment_amount", "eventpayment_amount") VALUES
	('6','liis','3','         rtyf               ','2022-03-01','2022-03-13','10am-5pm','0','Orgeventposter_1677.jpg','30','5','50000','100');
/*!40000 ALTER TABLE "tbl_orgevent" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_orgeventreq'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_orgeventreq" (
  "orgeventreq_id" int(10) unsigned NOT NULL auto_increment,
  "orgevent_id" int(10) unsigned default NULL,
  "artwork_id" int(10) unsigned default NULL,
  "artist_id" int(10) unsigned default NULL,
  "eventreq_status" int(10) unsigned default '0',
  "payment_status" int(10) unsigned default '0',
  PRIMARY KEY  ("orgeventreq_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_orgeventreq'
#

LOCK TABLES "tbl_orgeventreq" WRITE;
/*!40000 ALTER TABLE "tbl_orgeventreq" DISABLE KEYS;*/
REPLACE INTO "tbl_orgeventreq" ("orgeventreq_id", "orgevent_id", "artwork_id", "artist_id", "eventreq_status", "payment_status") VALUES
	('1','2',NULL,'1','2','0');
REPLACE INTO "tbl_orgeventreq" ("orgeventreq_id", "orgevent_id", "artwork_id", "artist_id", "eventreq_status", "payment_status") VALUES
	('2','2',NULL,'1','2','0');
REPLACE INTO "tbl_orgeventreq" ("orgeventreq_id", "orgevent_id", "artwork_id", "artist_id", "eventreq_status", "payment_status") VALUES
	('3','1',NULL,'1','2','0');
REPLACE INTO "tbl_orgeventreq" ("orgeventreq_id", "orgevent_id", "artwork_id", "artist_id", "eventreq_status", "payment_status") VALUES
	('4','2',NULL,'6','2','0');
REPLACE INTO "tbl_orgeventreq" ("orgeventreq_id", "orgevent_id", "artwork_id", "artist_id", "eventreq_status", "payment_status") VALUES
	('5','2',NULL,'6','2','0');
REPLACE INTO "tbl_orgeventreq" ("orgeventreq_id", "orgevent_id", "artwork_id", "artist_id", "eventreq_status", "payment_status") VALUES
	('6','6',NULL,'7','2','1');
/*!40000 ALTER TABLE "tbl_orgeventreq" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_orgeventticket'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_orgeventticket" (
  "orgeventticket_id" int(10) unsigned NOT NULL auto_increment,
  "orgevent_id" int(10) unsigned default NULL,
  "customer_id" int(10) unsigned default NULL,
  "status" int(10) unsigned default '0',
  "booking_date" varchar(50) default NULL,
  PRIMARY KEY  ("orgeventticket_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_orgeventticket'
#

LOCK TABLES "tbl_orgeventticket" WRITE;
/*!40000 ALTER TABLE "tbl_orgeventticket" DISABLE KEYS;*/
REPLACE INTO "tbl_orgeventticket" ("orgeventticket_id", "orgevent_id", "customer_id", "status", "booking_date") VALUES
	('1','2','4','1','2022-02-18');
REPLACE INTO "tbl_orgeventticket" ("orgeventticket_id", "orgevent_id", "customer_id", "status", "booking_date") VALUES
	('2','2','5','1','2022-03-14');
REPLACE INTO "tbl_orgeventticket" ("orgeventticket_id", "orgevent_id", "customer_id", "status", "booking_date") VALUES
	('3','6','5','1','2022-03-13');
REPLACE INTO "tbl_orgeventticket" ("orgeventticket_id", "orgevent_id", "customer_id", "status", "booking_date") VALUES
	('4','6','5','1','2022-03-07');
/*!40000 ALTER TABLE "tbl_orgeventticket" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('2','Mananthavady','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('3','muvattupuzha','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('4','Neyyattinkara','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('5','Kalamasseri','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('6','Batheri','3');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_size'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_size" (
  "size_id" int(10) unsigned NOT NULL auto_increment,
  "size_name" varchar(50) default NULL,
  PRIMARY KEY  ("size_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_size'
#

LOCK TABLES "tbl_size" WRITE;
/*!40000 ALTER TABLE "tbl_size" DISABLE KEYS;*/
REPLACE INTO "tbl_size" ("size_id", "size_name") VALUES
	('2','20*10m');
REPLACE INTO "tbl_size" ("size_id", "size_name") VALUES
	('3','15*20cm');
/*!40000 ALTER TABLE "tbl_size" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
