#!/bin/bash
liquibase --show-banner=false --defaults-file=conf/h2.properties rollback V0
