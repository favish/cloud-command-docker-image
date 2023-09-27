# Cloud-Command Docker image

### Notes
These images are meant to be rather beefy images with tools an operator might use to analyze and debug issues with services.

You exec in to one of these to perform CLI based actions against the pod of the target type.

### Changelog
## [6.0.1] - 2023-09-27
- Update circleci docker orb in attempt to resolve bug with update description

## [6.0.0] - 2023-09-27
- Update to favish/php-fpm:3.0.4 which upgrades PHP to 8.1

## [5.2.0] - 2022-06-28
- Dockerfile pulls image from image-php-fpm repo
- PHP 7.4

### History
This repo was previously included in a [mono repo](https://github.com/favish/docker-images) and the last published
tag with that repo was `cloud-command_drupal_4.0.0`. The CircleCI build process continues to publish versions to the same image
on [Dockerhub](https://hub.docker.com/repository/docker/favish/cloud-command-drupal). The first tag published with this repo is `5.0.0`.