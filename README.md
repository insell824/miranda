# microRNA Target Detection on Docker
## OVERVIEW
> **miRanda** is an algorithm for finding genomic targets for microRNAs. This algorithm has been written in C and is available as an open-source method under the GPL. MiRanda was developed at the Computational Biology Center of Memorial Sloan-Kettering Cancer Center. This software will be further developed under the open source model, coordinated by Anton Enright and Chris Sander.   
(https://cbio.mskcc.org/miRNA2003/miranda.html)

This Dockerfile forms a container image in Ubuntu 20.04 (Linux) to set up the miranda command for use on your computer easily.

Using the following program.
- MiRanda Algorithm Source Distribution (version 1.0b)

### What is Docker?
> Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production. (https://docs.docker.com/get-started/overview/)

Roughly writing, it looks like this...  
[ Your Computer(Windows, Mac or Linux) <=[=> Ubuntu Linux ( Virtual Environment ) ] ]

**miRanda** works on Linux by Docker absorbing dependencies such as gcc and differences depending on the PC environment.

### Steps Summary to use
1. Download `Docker Desktop`.  
  You need to be able to use Docker on your PC.  
  *Conversely, you can always use the miranda command if Docker works.
2. Build `Container Image`.   
  *It remains until you delete it.
3. Start `Service` using `Container Image`.   
  *It will stop when your computer restarts.
4. Use the miranda command on `Service`.
5. Terminate `Service`.  
  *If you use it again, stop it. If you no longer need it, delete it.
6. Delete `Container Image` if you no longer need the miranda command.

## PREPARATION
1. Download Docker Desktop from the below link.  
  https://hub.docker.com/search?type=edition&offering=community

2. Create a file with the following content in a directory you want to work. The file name is "docker-compose.yml". First of all, it's best to have no files other than docker-compose.yml in the directory.


Make file: `docker-compose.yml` ([Sample source](https://github.com/insell824/miranda/blob/main/docker-compose.yml))

```yml
version: '3.9'

services:
  miranda:
    image: insell824/miranda
    tty: true
    stdin_open: true
    container_name: miranda
    volumes:
      - ./:/temp
```


## SAMPLE USAGE
**miRanda** is installed in `/miranda/bin` and build files are in `/miranda/dist`.  
Exsample files (bantam_stRNA.fasta, hid_UTR.fasta) are in `/miranda/dist/examples`.

```bash
# Start the Termianl.
# *Widnows: [Windows Icon(Right click)] -> [Windows PowerShell].
# Change the directory to your working directory.
# You need docker-compose.yml in this directory.
$ cd /your/working/directory/

# Setup and Start!
$ docker-compose up -d
# Creating miranda ... done

# Attach to Ubuntu Linux.
$ docker exec -it miranda /bin/bash
# In virtual ubuntu
# At /temp
# Copy exsample files!
root@xxxxxxxxxxx:/temp$ cp /miranda/dist/examples/* ./
# Check your host PC's directory. (Explorer, Finder)
root@xxxxxxxxxxx:/temp$ miranda ./bantam_stRNA.fasta ./hid_UTR.fasta
# ...... OUTPUTED RESULT ......

# PRESS! [Ctrl] + [D]

# Terminate container
$ docker-compose down
```

## USAGE
```bash
# Setup and Start!
$ docker-compose up -d
# Creating miranda ... done

# Linux is running...
# Attach to Ubuntu Linux.
$ docker exec -it miranda /bin/bash
# You can use "miranda" command!
# Put fasta files on your host PC's directory. (Using Explorer, Finder...)
# ex)
root@xxxxxxxxxxx:/temp$ miranda ./file1.fasta ./file2.fasta
# ...... OUTPUTED RESULT ......
# You want to detach from this terminal then press [Ctrl] + [D].
```

Please check the usage of miranda command arguments.
https://cbio.mskcc.org/miRNA2003/src/miRanda-latest/man/miranda.html

## TERMINATE
```bash
# Stop container
$ docker-compose down


# If you no longer need it, delete it.
# Check container ID
$ docker images
# == Example printing ========================
# REPOSITORY          TAG       IMAGE ID
# insell824/miranda   latest    888ae48c1850
#                        Check! ^^^^^^^^^^^^
# ============================================

$ docker rmi 888ae48c1850
# The Docker image has been cleanly deleted from your computer.
```
