# Development environment for Ruby CoderSchool
## On multi Docker containers orchestrated with Docker-Compose

The developent environment use 

 - Docker image `ruby:2.2.0` - https://hub.docker.com/_/ruby/
 - `gem 'rails', '4.2.0'`
 - preconfigured with `gem 'bootstrap', '~> 4.0.0.alpha3'`

## Prerequests

 - [Install Docker Compose](https://docs.docker.com/compose/install/) - Compose is great for development, testing, and staging environments, as well as CI workflows. You can learn more about each case in [Common Use Cases](https://docs.docker.com/compose/overview/#common-use-cases).

## Clone, build, up

```bash
git clone https://github.com/olivernadj/Development-environment-for-Ruby-CoderSchool ./project
cd ./project
docker-compose build
docker-compose run web rails new . --force --database=postgresql --skip-bundle
sudo chown -R $USER:$USER . && \
    cp -f ./files/Gemfile ./railsapp/Gemfile && \
    cp -f ./files/Gemfile.lock ./railsapp/Gemfile.lock && \
    cp -f ./files/application.js ./railsapp/app/assets/javascripts/application.js && \
    cp -f ./files/application.scss ./railsapp/app/assets/stylesheets/application.scss && \
    rm ./railsapp/app/assets/stylesheets/application.css && \
    cp -f /files/database.yml ./railsapp/config/database.yml
docker-compose build
sudo chown -R $USER:$USER .
docker-compose up
```

## Useful commands

When containers aren't running:
```bash
docker-compose run web rake db:create
docker-compose run web rake db:migrate RAILS_ENV=development
sudo chown -R $USER:$USER .
```

When containers up, in other console:
```bash
#rake operations
docker exec -i -t web rake db:create 
docker exec -i -t web rake db:migrate RAILS_ENV=development
#interactive bash
docker exec -i -t project_web_1 bash
#list of running containers
watch "docker ps --format='table{{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"
```



## License

    Copyright 2016 Oliver Nadj

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.