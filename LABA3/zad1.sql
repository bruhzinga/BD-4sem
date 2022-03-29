use master;
go;
create database ZDA_myBase on primary
(name ='ZDA_myBase_mdf',filename='E:\source\4 SEM\BD\LABA3\BD\ZDA_myBase_mdf.mdf',
   size = 10240Kb, maxsize=1gb, filegrowth=1024Kb),
   ( name = 'ZDA_myBase_ndf', filename = 'E:\source\4 SEM\BD\LABA3\BD\ZDA_myBase_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
   filegroup FG1
     ( name = 'ZDA_myBase_fg1_1', filename = 'E:\source\4 SEM\BD\LABA3\BD\ZDA_myBase_fg1-1.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
     ( name = 'ZDA_myBase_fg1_2', filename = 'E:\source\4 SEM\BD\LABA3\BD\ZDA_myBase_fg1-2.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%)
   log on
   (name ='ZDA_myBase_log',filename='E:\source\4 SEM\BD\LABA3\BD\ZDA_myBase_log.ldf',
      size=10240Kb,  maxsize=2048Gb, filegrowth=10%);






