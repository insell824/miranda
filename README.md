# microRNA Target Detection on Docker

**microRNA Target Detection**  
https://cbio.mskcc.org/miRNA2003/miranda.html

- MiRanda Algorithm Source Distribution (version 1.0b)

## OVERVIEW
This Dockerfile forms a container image in Ubuntu 20.04 (Linux) to set up the miranda command for use.

### What is Docker?
> Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production. (https://docs.docker.com/get-started/overview/)

### Steps
1. Build "Container Image".   
  *It remains until you delete it.
2. Start "Service" using "Container Image".   
  *It will stop when your computer restarts.
3. Use the miranda command on "Service".
4. Terminate "Service".  
  *If you use it again, stop it. If you no longer need it, delete it.
5. Delete "Container Image" if you no longer need the miranda command.

## PREPARATION

1. Setup Docker Desktop from the below link.  
  https://hub.docker.com/search?type=edition&offering=community

2. Execute the following script from a terminal such as a command prompt.

```bash
$ docker build . -t miranda
# `miranda` is your favorite container image name.



# Docker List ("-a" means including stopped service)
$ docker ps -a
# ex)
# CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS                       PORTS     NAMES
# a3ca39075126   miranda   "/bin/bash"   2 minutes ago   Exited (130) 2 minutes ago             miranda1

# if you want to delete image
$ docker rm a3ca39075126

$ docker images
```

## USAGE
```bash
$ docker run --name miranda1 -rm -v $PWD:/temp miranda
# `miranda1` is your favorite service name.


```
## TERMINATE

