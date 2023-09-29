#!/bin/bash

# npm install -g @angular/cli

ng new static_web_page

cd static_web_page && npm install

# ng set apps.static_web_page.serve.options.allowedHosts=["localhost:4200"]

ng serve --host 0.0.0.0 --port 4200 --disable-host-check