/* Insert-script voor Security2.
 * Identiek aan de Firebird security database, die niet rechtstreeks 
 * te benaderen is. Het script is alleen bedoeld als voorbeeld 
 * (zie leereenheid 13), niet om zelf uit te voeren.
 * Firebird 2.5, versie 8-jan-2012
 */

insert into rdb$users(rdb$user_name, rdb$uid, rdb$gid, rdb$passwd, rdb$first_name, rdb$last_name) values(
   'SYSDBA', null, null, 'NLtwcs9LrxLMOYhG0uGM9i6KS7mf3QAKvFVpmRg=', 'Sql', 'Server Administrator');

insert into rdb$users(rdb$user_name, rdb$uid, rdb$gid, rdb$passwd) values(
   'TOETJESBOEK', 0, 0, 'JobKgcr6vUBhm71uwZwSm9LbhQUrsKgUVQmM7SM=');
   
commit;