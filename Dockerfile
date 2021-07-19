FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y gcc make wget

WORKDIR /miranda
RUN wget https://cbio.mskcc.org/miRNA2003/src/miRanda-1.0b.tar.gz --header="Accept-Encoding:gzip,deflate" -O miRanda.tar.gz
RUN mkdir dist
RUN tar -xvzf miRanda.tar.gz -C dist --strip-components 1

WORKDIR /miranda/dist
RUN ./configure --prefix=/miranda
RUN make install

RUN mkdir /temp
WORKDIR /temp

ENV PATH $PATH:/miranda/bin

# Run example!
RUN miranda /miranda/dist/examples/bantam_stRNA.fasta /miranda/dist/examples/hid_UTR.fasta

CMD [ "bash" ]
