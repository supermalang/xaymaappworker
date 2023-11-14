#!/bin/bash
supervisord -n && supervisorctl start messenger-consume:*