/* 
 * Insert-script voor OpenSchool
 * Firebird 2.5, versie 15 juli 2016
 */

delete from Tentamen;
delete from Inschrijving;
delete from Begeleider;
delete from Voorkenniseis;
delete from Student;
delete from Student1;
delete from Cursus;
update Docent
set    vervanger = null;
delete from Docent;

insert into Docent values ('DAT', 'C.Date',    null);
insert into Docent values ('COD', 'E.Codd',    null);
insert into Docent values ('BAC', 'C.Bachman', null);
update Docent
set    vervanger = 'COD'
where  acr = 'DAT';
update Docent
set    vervanger = 'DAT'
where  acr = 'BAC';

insert into Cursus values ('II', 'Inleiding informatica',  80, 3, 'BAC');
insert into Cursus values ('DW', 'Discrete wiskunde',     120, 4, 'DAT');
insert into Cursus values ('DB', 'Databases',             120, 4, 'COD');
insert into Cursus values ('IM', 'Informatiemodelleren',  150, 5, 'DAT');
insert into Cursus values ('SW', 'Semantic web',          120, 4, null );

insert into Student values (1, 'Berk', 'DAT');
insert into Student values (2, 'Tack', 'DAT');
insert into Student values (3, 'Bos',  'COD');
insert into Student values (4, 'Eik',  null );

insert into Begeleider values ('DAT', 'DB');
insert into Begeleider values ('DAT', 'DW');
insert into Begeleider values ('DAT', 'IM');
insert into Begeleider values ('BAC', 'II');
insert into Begeleider values ('BAC', 'DB');

insert into Voorkenniseis values ('DB', 'II');
insert into Voorkenniseis values ('DB', 'DW');
insert into Voorkenniseis values ('IM', 'DB');
insert into Voorkenniseis values ('SW', 'DB');

insert into Inschrijving values (1, 'II', '2012-01-12', 7,    'N' );
insert into Inschrijving values (1, 'DW', '2012-01-19', 5,    'N' );
insert into Inschrijving values (1, 'DB', '2012-03-18', 8,    'N' );
insert into Inschrijving values (1, 'IM', '2012-06-20', null, 'N' );
insert into Inschrijving values (2, 'II', '2012-01-12', null, 'J' );
insert into Inschrijving values (2, 'DW', '2012-01-12', null, 'J' );
insert into Inschrijving values (2, 'IM', '2012-01-26', 5,    'N' );
insert into Inschrijving values (3, 'II', '2012-01-16', null, null);
insert into Inschrijving values (4, 'II', '2012-01-20', null, 'J' );
insert into Inschrijving values (4, 'DB', '2012-02-29', null, 'N' );

insert into Tentamen values (1, 'II', 1, '2012-04-17', 7   );
insert into Tentamen values (1, 'DW', 1, '2012-04-17', 5   );
insert into Tentamen values (1, 'DB', 1, '2012-04-19', 5   );
insert into Tentamen values (1, 'DB', 2, '2012-06-15', 8   );
insert into Tentamen values (2, 'IM', 1, '2012-04-06', 4   );
insert into Tentamen values (2, 'IM', 2, '2012-06-11', 5   );
insert into Tentamen values (4, 'DB', 1, '2012-06-26', null);

-- zie leereenheid 2, paragraaf 1.6
insert into Student1 values (1, 'Inge', null,  'Berk', 'DAT');
insert into Student1 values (2, 'Max',  null,  'Tack', 'DAT');
insert into Student1 values (3, 'Max',  null,  'Bos',  'BAC');
insert into Student1 values (4, 'Iris', 'van', 'Eik',  null );

commit;
