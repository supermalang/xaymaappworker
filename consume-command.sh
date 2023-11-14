#!/bin/bash
supervisord && supervisorctl start messenger-consume:*