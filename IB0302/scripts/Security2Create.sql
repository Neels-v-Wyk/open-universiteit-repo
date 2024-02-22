/* Create-script voor Security2.
 * Identiek aan de Firebird security database, die niet rechtstreeks 
 * te benaderen is. Het script is alleen bedoeld als voorbeeld 
 * (zie leereenheid 13), niet om zelf uit te voeren.
 * Firebird 2.5, versie 8-jan-2011
 */

/*
 *  The contents of this file are subject to the Initial
 *  Developer's Public License Version 1.0 (the "License");
 *  you may not use this file except in compliance with the
 *  License. You may obtain a copy of the License at
 *  http://www.ibphoenix.com/main.nfs?a=ibphoenix&page=ibp_idpl.
 *
 *  Software distributed under the License is distributed AS IS,
 *  WITHOUT WARRANTY OF ANY KIND, either express or implied.
 *  See the License for the specific language governing rights
 *  and limitations under the License.
 *
 *  The Original Code was created by Alex Peshkov on 16-Nov-2004
 *  for the Firebird Open Source RDBMS project.
 *
 *  Copyright (c) 2004 Alex Peshkov
 *  and all contributors signed below.
 *
 *  All Rights Reserved.
 *  Contributor(s): ______________________________________.
 *
 */

-- 4. create new objects in database
CREATE DOMAIN RDB$COMMENT AS BLOB SUB_TYPE TEXT SEGMENT SIZE 80 CHARACTER SET UNICODE_FSS;
CREATE DOMAIN RDB$NAME_PART AS VARCHAR(32) CHARACTER SET UNICODE_FSS DEFAULT _UNICODE_FSS '';
CREATE DOMAIN RDB$GID AS INTEGER;
CREATE DOMAIN RDB$PASSWD AS VARCHAR(64) CHARACTER SET BINARY;
CREATE DOMAIN RDB$UID AS INTEGER;
CREATE DOMAIN RDB$USER_NAME AS VARCHAR(128) CHARACTER SET UNICODE_FSS;
CREATE DOMAIN RDB$USER_PRIVILEGE AS INTEGER;
COMMIT;


CREATE TABLE RDB$USERS (
    RDB$USER_NAME       RDB$USER_NAME NOT NULL PRIMARY KEY,
    /* local system user name for setuid for file permissions */
    RDB$SYS_USER_NAME   RDB$USER_NAME,
    RDB$GROUP_NAME      RDB$USER_NAME,
    RDB$UID             RDB$UID,
    RDB$GID             RDB$GID,
    RDB$PASSWD          RDB$PASSWD,

    /* Privilege level of user - mark a user as having DBA privilege */
    RDB$PRIVILEGE       RDB$USER_PRIVILEGE,

    RDB$COMMENT         RDB$COMMENT,
    RDB$FIRST_NAME      RDB$NAME_PART,
    RDB$MIDDLE_NAME     RDB$NAME_PART,
    RDB$LAST_NAME       RDB$NAME_PART);
COMMIT;

CREATE VIEW USERS (USER_NAME, SYS_USER_NAME, GROUP_NAME, UID, GID, PASSWD,
        PRIVILEGE, COMMENT, FIRST_NAME, MIDDLE_NAME, LAST_NAME, FULL_NAME) AS
    SELECT RDB$USER_NAME, RDB$SYS_USER_NAME, RDB$GROUP_NAME, RDB$UID, RDB$GID, RDB$PASSWD,
        RDB$PRIVILEGE, RDB$COMMENT, RDB$FIRST_NAME, RDB$MIDDLE_NAME, RDB$LAST_NAME,
		COALESCE (RDB$first_name || _UNICODE_FSS ' ', '') || 
		COALESCE (RDB$middle_name || _UNICODE_FSS ' ', '') || 
		COALESCE (RDB$last_name, '')
    FROM RDB$USERS
    WHERE CURRENT_USER = 'SYSDBA'
       OR CURRENT_USER = RDB$USERS.RDB$USER_NAME;
COMMIT;

GRANT ALL ON RDB$USERS to VIEW USERS;
GRANT SELECT ON USERS to PUBLIC;
GRANT UPDATE(PASSWD, GROUP_NAME, UID, GID, FIRST_NAME, MIDDLE_NAME, LAST_NAME)
	ON USERS TO PUBLIC;

COMMIT;