#!/bin/sh -l

echo -e "${INPUT_KEY}" >__TEMP_INPUT_KEY_FILE

chmod 600 __TEMP_INPUT_KEY_FILE

scp -o StrictHostKeyChecking=no -v -i __TEMP_INPUT_KEY_FILE -P "${INPUT_PORT}" $INPUT_OPTIONS -r ${INPUT_SRC} "${INPUT_USER}"@"${INPUT_HOST}":"${INPUT_REMOTE}"
