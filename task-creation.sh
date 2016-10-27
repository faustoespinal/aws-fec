#!/bin/bash

aws ecs register-task-definition --cli-input-json file://sample-task-definition.json
aws ecs list-task-definition-families
aws ecs list-task-definitions
aws ecs describe-task-definition --task-definition web:1
aws ecs deregister-task-definition --task-definition web:2
aws ecs register-task-definition --generate-cli-skeleton

