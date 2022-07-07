# liquibase-mongodbext-issue-rollback

This sample project demonstrate a smash-up between liquibase and the liquibase-mongodb extension.

Second case : createIndex auto-rollback failed.

## Versions

* liquibase-core 4.12.0
* liquibase-mongodb 4.12.0

## How to reproduce

* Use Liquibase CLI with no jar in "lib" folder
* Execute `./status.sh` (or `liquibase --defaults-file=conf/h2.properties status`) to create H2 DB
  * 8 change sets have not been applied to SA@jdbc:h2:file:./db/H2_DB
* Execute `./update.sh` (or `liquibase --defaults-file=conf/h2.properties update`) to update the H2 DB
  * Liquibase command 'update' was executed successfully.
* Execute `./status.sh` (or `liquibase --defaults-file=conf/h2.properties status`) to validate that the H2 DB is up to date
  * SA@jdbc:h2:file:./db/H2_DB is up to date
* Execute `./rollback.sh` (or `liquibase --defaults-file=conf/h2.properties rollback V0`) to rollback all the changesets
  * Liquibase command 'rollback' was executed successfully.
  * **...and then...**
* Add the file `liquibase-mongodb-4.12.0.jar` and its dépendencies to the `lib` folder (`bson-4.6.1.jar`, `jackson-*-2.11.3.jar`, `mongodb-driver-core-4.6.1.jar`, `mongodb-driver-sync-4.6.1.jar`)
* Remove the H2 Database `./cleandb.sh` (`rm -v -f db/*.db`)
* Execute `./update.sh` (or `liquibase --defaults-file=conf/h2.properties update`) to create & update the H2 DB
  * Liquibase command 'update' was executed successfully.
* Execute `./status.sh` (or `liquibase --defaults-file=conf/h2.properties status`) to validate that the H2 DB is up to date
  * SA@jdbc:h2:file:./db/H2_DB is up to date
* Execute `./rollback.sh` (or `liquibase --defaults-file=conf/h2.properties rollback V0`) to rollback all the changesets
  * [liquibase.integration] dropIndex is not supported on h2
