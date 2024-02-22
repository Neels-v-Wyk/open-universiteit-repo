/* 
 * Insert-script voor Muziekdatabase
 * Firebird 2.5, versie 13-05-2016
 */

delete from Bezettingsregel;
delete from Instrument;
update Stuk set origineel = null;
delete from Stuk;
delete from Genre;
delete from Niveau;
delete from Componist;
delete from Muziekschool;

insert into Muziekschool values ('MA',  'Muziekschool Amsterdam',   'Amsterdam');
insert into Muziekschool values ('RM',  'Reijnders'' Muziekschool', 'Nijmegen');
insert into Muziekschool values ('HMP', 'Het Muziekpakhuis',        'Amsterdam');

insert into Componist values ( 1, 'Charlie Parker', '1904-12-12', null);
insert into Componist values ( 2, 'Thomas Guidi',   '1966-01-05', 'MA');
insert into Componist values ( 4, 'Rudolf Escher',  '1912-01-08', null);
insert into Componist values ( 5, 'Sofie Bergeijk', '1980-07-12', 'RM');
insert into Componist values ( 8, 'W.A. Mozart',    '1756-01-27', null);
insert into Componist values ( 9, 'Karl Schumann',  '1955-10-10', 'RM');
insert into Componist values (10, 'Jan van Maanen', '1985-09-08', 'MA');

insert into Genre values ('klassiek');
insert into Genre values ('jazz');
insert into Genre values ('pop');
insert into Genre values ('techno');

insert into Niveau values ('A', 'beginners');
insert into Niveau values ('B', 'gevorderden');
insert into Niveau values ('C', 'vergevorderden');

insert into Stuk values ( 1,  1, 'Blue bird',        null, 'jazz',     null, 4.5,  1954);
insert into Stuk values ( 2,  2, 'Blue bird',        1,    'jazz',     'B',  4,    1988);
insert into Stuk values ( 3,  4, 'Air pour charmer', null, 'klassiek', 'B',  4.5,  1953);
insert into Stuk values ( 5,  5, 'Lina',             null, 'klassiek', 'B',  5,    1979);
insert into Stuk values ( 8,  8, 'Berceuse',         null, 'klassiek', null, 4,    1786);
insert into Stuk values ( 9,  2, 'Cradle song',      8,    'klassiek', 'B',  3.5,  1990);
insert into Stuk values (10,  8, 'Non piu andrai',   null, 'klassiek', null, null, 1791);
insert into Stuk values (12,  9, 'I''ll never go',   10,   'pop',      'A',  6,    1996);
insert into Stuk values (13, 10, 'Swinging Lina',    5,    'jazz',     'B',  8,    1997);
insert into Stuk values (14,  5, 'Little Lina',      5,    'klassiek', 'A',  4.3,  1998);
insert into Stuk values (15, 10, 'Blue sky',         1,    'jazz',     'A',  4,    1998);

/* 
 * Opmerking:
 * Een enkel aanhalingsteken binnen een string (zoals in muziekschool 
 * Reijnders' Muziekschool en stuk 12) moet twee keer worden genoteerd; 
 * anders wordt het opgevat als einde-stringteken.
 */

insert into Instrument values ('piano',    ''       );
insert into Instrument values ('fluit',    ''       );
insert into Instrument values ('fluit',    'alt'    );
insert into Instrument values ('saxofoon', 'alt'    );
insert into Instrument values ('saxofoon', 'tenor'  );
insert into Instrument values ('saxofoon', 'sopraan');
insert into Instrument values ('gitaar',   ''       );
insert into Instrument values ('viool',    ''       );
insert into Instrument values ('viool',    'alt'    );
insert into Instrument values ('drums',    ''       );

insert into Bezettingsregel values ( 2, 'drums',    '',      1);
insert into Bezettingsregel values ( 2, 'saxofoon', 'alt',   2);
insert into Bezettingsregel values ( 2, 'saxofoon', 'tenor', 1);
insert into Bezettingsregel values ( 2, 'piano',    '',      1);
insert into Bezettingsregel values ( 3, 'fluit',    '',      1);
insert into Bezettingsregel values ( 5, 'fluit',    '',      3);
insert into Bezettingsregel values ( 9, 'fluit',    '',      1);
insert into Bezettingsregel values ( 9, 'fluit',    'alt',   1);
insert into Bezettingsregel values ( 9, 'piano',    '',      1);
insert into Bezettingsregel values (12, 'piano',    '',      1);
insert into Bezettingsregel values (12, 'fluit',    '',      2);
insert into Bezettingsregel values (13, 'drums',    '',      1);
insert into Bezettingsregel values (13, 'saxofoon', 'alt',   1);
insert into Bezettingsregel values (13, 'saxofoon', 'tenor', 1);
insert into Bezettingsregel values (13, 'fluit',    '',      2);
insert into Bezettingsregel values (14, 'piano',    '',      1);
insert into Bezettingsregel values (14, 'fluit',    '',      1);
insert into Bezettingsregel values (15, 'saxofoon', 'alt',   2);
insert into Bezettingsregel values (15, 'fluit',    'alt',   2);
insert into Bezettingsregel values (15, 'piano',    '',      1);

commit;
