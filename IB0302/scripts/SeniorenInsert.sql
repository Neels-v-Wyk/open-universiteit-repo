/* 
 * Open Universiteit
 * Cursus Relationele databases, IB0302
 *
 * Insert-script voor Seniorenvoorlichting-database
 * Firebird 2.5, versie voor practicum 2017
 */

delete from Onderwerp;
delete from Voorziening;
delete from Voorlichting;
delete from Instantie;
delete from Voorlichter;
delete from Persoon;

insert into Persoon values (1075, 'K Pas', '7301ZX', 312, '1949-01-01','m');
insert into Persoon values (2109, 'L Den', '7301ZX', 312, '1948-08-23','v');
insert into Persoon values (5498, 'A Wild','7301XX',  76, '1948-04-15','v');
insert into Persoon values (6655, 'G Kip', '7301XX',  80, '1949-11-13','v');
insert into Persoon values (7046, 'H Poot','7301UV',   2, '1951-03-17', 'm');   

insert into Voorlichter values ('HSL', 'H Slot', 'hslot@xyz.com');
insert into Voorlichter values ('ADR', 'A Droog','adroog@abc.nl');
insert into Voorlichter values ('GTA', 'G Taco', 'gtaco@mno.com');
insert into Voorlichter values ('HJP', 'H Poot', 'hpoot@xyz.com');

insert into Instantie values ( 'OA', 'ouderenadviseur');
insert into Instantie values ( 'MW', 'maatsch werk');
insert into Instantie values ( 'SR', 'sociaal raadsman');
insert into Instantie values ( 'GA', 'gemeente adm');
insert into Instantie values ( 'BD', 'belastingdienst');

insert into Voorlichting values (176, 1075, 'HSL', '2013-12-15');
insert into Voorlichting values (215, 5498, 'ADR', '2014-01-23');
insert into Voorlichting values (216, 6655, 'ADR', '2014-01-23');
insert into Voorlichting values (323, 7046, 'HJP', '2014-03-16');

insert into Voorziening values ('KK', 'kortingskaart', 'GA');
insert into Voorziening values ('BB', 'bijz bijstand', 'GA');
insert into Voorziening values ('HT', 'huurtoeslag', 'BD');
insert into Voorziening values ('ZT', 'zorgtoeslag', 'BD');
insert into Voorziening values ('RL', 'rollator', 'GA');
insert into Voorziening values ('SM', 'scootmobiel', 'GA');
insert into Voorziening values ('RB', 'rechtsbijstand', 'SR');

insert into Onderwerp values (176, 'RL', 'folder',    null);
insert into Onderwerp values (176, 'RB',  null,      'SR');
insert into Onderwerp values (215, 'SM',  null,       null);
insert into Onderwerp values (215, 'KK', 'formulier', null);
insert into Onderwerp values (215, 'RB',  null,      'SR');
insert into Onderwerp values (216, 'BB', 'formulier', null);
insert into Onderwerp values (216, 'HT', 'formulier', null);
insert into Onderwerp values (216, 'SM', 'folder',    null);
insert into Onderwerp values (216, 'RL',  null,       null);
insert into Onderwerp values (323, 'KK', 'folder',    null);

commit;