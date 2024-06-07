
-- drop database maladie2;

create database docteur;
\c docteur;

create table age(
    idAge serial primary key,
    age varchar(50),
    debut int,
    fin int
);

insert into age values (default,'Enfant',1,12);
insert into age values (default,'Jeune',12,30);
insert into age values (default,'Adulte',30,100);

create table maladie(
    idMaladie serial primary key,
    maladie varchar(50)
);

insert into maladie values (default,'Grippe');
insert into maladie values (default,'peste');
insert into maladie values (default,'paludisme');

create table parametre(
    idParametre serial primary key,
    parametre varchar(50)
);

insert into parametre values (default,'loha');
insert into parametre values (default,'koaka');
insert into parametre values (default,'lelo');
insert into parametre values (default,'mafana');
insert into parametre values (default,'oditra');
insert into parametre values (default,'mafana');

create table parametreMaladie(
    idParametreMaladie serial primary key,
    idMaladie int,
    idParametre int,
    foreign key (idMaladie) references maladie (idMaladie),
    foreign key (idParametre) references parametre (idParametre)   
);

insert into parametreMaladie values (default,1,1);
insert into parametreMaladie values (default,1,2);
insert into parametreMaladie values (default,1,3);
insert into parametreMaladie values (default,1,4);
insert into parametreMaladie values (default,2,1);
insert into parametreMaladie values (default,2,5);
insert into parametreMaladie values (default,3,1);
insert into parametreMaladie values (default,3,4);

create table intervalleAge(
    idIntervalleAge serial primary key,
    idParametreMaladie int,
    idAge int,
    debutInter int,
    finInter int,
    foreign key (idParametreMaladie) references parametreMaladie (idParametreMaladie),
    foreign key (idAge) references age (idAge)
);

insert into intervalleAge values (default,1,1,1,3);
insert into intervalleAge values (default,1,2,4,6);
insert into intervalleAge values (default,1,3,7,10);

insert into intervalleAge values (default,2,1,1,3);
insert into intervalleAge values (default,2,2,4,6);
insert into intervalleAge values (default,2,3,7,10);

insert into intervalleAge values (default,3,1,1,3);
insert into intervalleAge values (default,3,2,4,6);
insert into intervalleAge values (default,3,3,7,10);

create table patient(
    idPatient serial primary key,
    patient varchar(20),
    dateNaissance date
);

insert into patient values (default,'Rindra','2004-01-22');

create table patientParam(
    idPatientParam serial primary key,
    idPatient int,
    idParametre int,
    niveau int,
    foreign key (idPatient) references patient (idPatient),
    foreign key (idParametre) references parametre (idParametre)
);

insert into patientParam values (default,1,1,3);
insert into patientParam values (default,1,2,5);
insert into patientParam values (default,1,3,3);
insert into patientParam values (default,1,4,5);

create table fanafody(
    idFanafody serial primary key,
    nom varchar(50),
    prixUnitaire numeric
);

insert into fanafody values (default,'M1',1000);
insert into fanafody values (default,'M2',500);
insert into fanafody values (default,'M4',1000);
insert into fanafody values (default,'M5',50);
insert into fanafody values (default,'M6',800);
insert into fanafody values (default,'M7',1000);

create table fanafodyParametre(
    idFanafodyParametre serial primary key,
    idFanafody int,
    idParametre int,
    niveau numeric,
    foreign key (idFanafody) references fanafody (idFanafody),
    foreign key (idParametre) references parametre (idParametre)
);

insert into fanafodyParametre values (default,1,1,2.5);
insert into fanafodyParametre values (default,2,2,3);
insert into fanafodyParametre values (default,3,3,6);
insert into fanafodyParametre values (default,4,4,3);
insert into fanafodyParametre values (default,5,5,1);
insert into fanafodyParametre values (default,6,6,0.5);
insert into fanafodyParametre values (default,5,3,4);
insert into fanafodyParametre values (default,1,5,1.3);
insert into fanafodyParametre values (default,4,3,2);
insert into fanafodyParametre values (default,6,1,6);

create view v_ParametreMaladie as 
select parametreMaladie.idparametremaladie,maladie.idmaladie,intervalleAge.idage,maladie.maladie,parametre.idparametre,parametre.parametre,intervalleAge.debutinter,intervalleAge.fininter from parametreMaladie
join intervalleAge on parametreMaladie.idParametreMaladie = intervalleAge.idParametreMaladie
join maladie on parametreMaladie.idMaladie = maladie.idMaladie
join parametre on parametreMaladie.idparametre = parametre.idparametre;

create view v_fanafodyParametre as
select fanafodyParametre.idfanafodyparametre,fanafody.idfanafody,fanafodyParametre.idparametre,fanafodyParametre.niveau,fanafody.nom,fanafody.prixunitaire from fanafodyParametre
join fanafody on fanafodyParametre.idFanafody = fanafody.idFanafody;




