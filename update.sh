#!/bin/bash
liquibase --show-banner=false --defaults-file=conf/h2.properties update
