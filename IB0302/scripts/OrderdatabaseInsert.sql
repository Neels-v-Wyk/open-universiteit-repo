/* 
 * Insert-script voor Orderdatabase
 * (identiek aan OrderdatabaseCInsert.sql en OrderdatabaseDInsert.sql)
 * Firebird 2.5, versie 6 juni 2016
 */

delete from Klacht;
delete from Kortingsinterval;
delete from Orderregel;
delete from Artikel;
delete from Artikelgroep;
delete from Order_;

update Klant
set    aanbrenger = null;
delete from Klant;

insert into Klant values (1234, 'Cupido',   null);
insert into Klant values (1447, 'Roos',     1234);
insert into Klant values (1448, 'Voskuil',  null);
insert into Klant values (1449, 'Grunberg', null);
insert into Klant values (1450, 'Crosby',   null);
insert into Klant values (1451, 'Stills',   1450);
insert into Klant values (1452, 'Nash',     1450);
insert into Klant values (1453, 'Young',    1447);

insert into Order_ values (5773, 1234, '2012-10-20', null);
insert into Order_ values (5774, 1447, '2012-10-20', null);
insert into Order_ values (5793, 1453, '2012-10-22', null);
insert into Order_ values (5794, 1451, '2012-10-25', null);
insert into Order_ values (5795, 1448, '2012-11-12', null);
insert into Order_ values (5796, 1234, '2012-11-14', null);
insert into Order_ values (5797, 1447, '2012-11-20', null);
insert into Order_ values (5798, 1447, '2012-11-22', null);
insert into Order_ values (5799, 1451, '2012-12-16', null);
insert into Order_ values (5800, 1452, '2012-12-18', null);
insert into Order_ values (5801, 1447, '2012-12-19', null);
insert into Order_ values (5802, 1234, '2012-12-19', null);

insert into Artikelgroep values ('NM', 'niznomoeren');
insert into Artikelgroep values ('VR', 'voegringen');
insert into Artikelgroep values ('BV', 'bakvleugels');

insert into Artikel values (107, 'zwenkmoer',  'NM',  2.20,  1.40, 120);
insert into Artikel values (180, 'zwalik',     null, 26.00, 20.05, 360);
insert into Artikel values (351, 'slevel',     'NM', 15.80, 10.50,  50);
insert into Artikel values (238, 'gromwekker', null, 15.80, 10.50,   0);
insert into Artikel values (380, 'steekring',  'VR', 12.70,  8.35,  72);
insert into Artikel values (449, 'wigbek',     'BV', 13.50,  9.50,  76);
insert into Artikel values (450, 'stegger',    'BV', 13.50,  9.40, 950);
insert into Artikel values (451, 'poerring',   'VR',  6.00,  4.00,   0);
insert into Artikel values (452, 'kruppel',    'VR',  0.75,  0.15, 108);

insert into Kortingsinterval values (  0,     9,  0);
insert into Kortingsinterval values ( 10,    49,  5);
insert into Kortingsinterval values ( 50,   499, 10);
insert into Kortingsinterval values (500,  9999, 20);

insert into Orderregel values (5773, 1, 351,  2,  31.60);
insert into Orderregel values (5773, 2, 107, 10,  20.90);
insert into Orderregel values (5773, 3, 449,  3,  40.50);
insert into Orderregel values (5774, 1, 351,  2,  31.60);
insert into Orderregel values (5774, 2, 180,  1,  26.00);
insert into Orderregel values (5793, 1, 449,  1,  13.50);
insert into Orderregel values (5793, 2, 180,  2,  52.00);
insert into Orderregel values (5794, 1, 452,  2,   1.50);
insert into Orderregel values (5794, 2, 351, 10, 150.10);
insert into Orderregel values (5795, 1, 107, 13,  27.17);
insert into Orderregel values (5795, 2, 450,  8, 108.00);
insert into Orderregel values (5795, 3, 351,  1,  15.80);
insert into Orderregel values (5796, 1, 452, 11,   7.84);
insert into Orderregel values (5796, 2, 450,  2,  27.00);
insert into Orderregel values (5797, 1, 351,  2,  31.60);
insert into Orderregel values (5798, 1, 450, 10, 128.25);
insert into Orderregel values (5798, 2, 452,  3,   2.25);
insert into Orderregel values (5799, 1, 451,  8,  48.00);
insert into Orderregel values (5799, 2, 107, 11,  24.20);
insert into Orderregel values (5799, 3, 449,  1,  13.50);
insert into Orderregel values (5800, 1, 451, 18, 102.60);
insert into Orderregel values (5800, 2, 452,  2,   1.50);
insert into Orderregel values (5801, 1, 351, 10, 150.10);
insert into Orderregel values (5801, 2, 107,  3,   6.60);
insert into Orderregel values (5802, 1, 452,  5,   3.75);

insert into Klacht values (1, 5774, 1, 'N');
insert into Klacht values (2, 5799, 2, 'J');
insert into Klacht values (3, 5799, 3, 'N');
insert into Klacht values (4, 5801, 1, 'N');

commit;
