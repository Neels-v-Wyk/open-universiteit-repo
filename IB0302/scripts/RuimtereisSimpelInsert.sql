/* 
 * Insert-script voor RuimtereisSimpel
 * Firebird 2.5, versie 15 juli 2016
 */

delete from Bezoek;
update Hemelobject set moederobject = null;
delete from Hemelobject;
delete from Reis;

insert into Reis values (31, '2022-01-12',  2.50);
insert into Reis values (32, '2022-06-03', 17.50);
insert into Reis values (33, '2022-10-12',  2.65);
insert into Reis values (34, '2023-01-10', 75.00);
insert into Reis values (35, '2023-03-12', 16.50);
insert into Reis values (36, '2023-06-27',  null);
insert into Reis values (37, '2023-07-17', 60.00);

insert into Hemelobject values ('Zon',     null     );
insert into Hemelobject values ('Venus',   'Zon'    );
insert into Hemelobject values ('Aarde',   'Zon'    );
insert into Hemelobject values ('Maan',    'Aarde'  );
insert into Hemelobject values ('Mars',    'Zon'    );
insert into Hemelobject values ('Phobos',  'Mars'   );
insert into Hemelobject values ('Deimos',  'Mars'   );
insert into Hemelobject values ('Jupiter', 'Zon'    );
insert into Hemelobject values ('Io',      'Jupiter');

insert into Bezoek values (31, 1, 'Maan'   );
insert into Bezoek values (32, 1, 'Maan'   );
insert into Bezoek values (32, 2, 'Phobos' );
insert into Bezoek values (32, 3, 'Deimos' );
insert into Bezoek values (32, 4, 'Mars'   );
insert into Bezoek values (32, 5, 'Maan'   );
insert into Bezoek values (33, 1, 'Maan'   );
insert into Bezoek values (34, 1, 'Mars'   );
insert into Bezoek values (34, 2, 'Jupiter');
insert into Bezoek values (34, 3, 'Io'     );
insert into Bezoek values (35, 1, 'Maan'   );
insert into Bezoek values (35, 2, 'Mars'   );
insert into Bezoek values (35, 3, 'Maan'   );
insert into Bezoek values (36, 1, 'Mars'   );
insert into Bezoek values (36, 2, 'Jupiter');
insert into Bezoek values (36, 3, 'Io'     );
insert into Bezoek values (37, 1, 'Mars'   );

commit;
