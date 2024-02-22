/* 
 * Open Universiteit
 * Cursus Relationele databases, IB0302
 *
 * Create-script voor Seniorenvoorlichting-database
 * Firebird 2.5, versie voor practicum 2017
 *
 */


create table Persoon
(nr            	numeric(6)      not null,
 naam          	varchar(18)     not null,
 postcode      	varchar(6)      not null,
 huisnr        	varchar(4)      not null,
 geboortedatum 	date            not null,
 geslacht      	varchar(1)      not null, 
 constraint pk_persoon 
    primary key (nr)
);

create table Voorlichter
(code 		char(3)         not null,
 naam           varchar(18)     not null,
 email          varchar(30)     not null,
 constraint pk_voorlichter 
    primary key (code)
);

create table Instantie
(code   	char(3)         not null,
 omschrijving   varchar(20)     not null,
 constraint pk_instantie 
    primary key (code),
 constraint un_instantie 
    unique (omschrijving)
);

create table Voorlichting
(id  	     	numeric(6)      not null,
 persoon       	numeric(6)      not null,
 voorlichter 	char(3)         not null,
 datum          date            not null,
 constraint pk_voorlichting 
    primary key (id),	
 constraint fk_voorlichting_aan_persoon 
    foreign key (persoon) references Persoon(nr),
 constraint fk_voorlichting_van_voorlichter
    foreign key (voorlichter) references Voorlichter(code)
);

create table Voorziening
(code 		char(3)         not null,
 omschrijving   varchar(15)     not null,
 instantie   	char(3)         not null,
 constraint pk_voorziening 
    primary key (code),
 constraint fk_voorziening_van_instantie
    foreign key (instantie) references Instantie(code)
);

create table Onderwerp
(voorlichting  	numeric(6)      not null,
 voorziening 	char(3)         not null,
 afgegeven      varchar(12),
 instantie      char(3),
 constraint pk_onderwerp 
    primary key (voorlichting,voorziening),
 constraint fk_onderwerp_van_voorlichting
    foreign key (voorlichting) references Voorlichting(id),
 constraint fk_onderwerp_van_voorziening
    foreign key (voorziening) references Voorziening(code),
 constraint fk_onderwerp_instantie 
    foreign key (instantie) references Instantie(code)
);
