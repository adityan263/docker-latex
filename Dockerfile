FROM ubuntu:latest
MAINTAINER Aditya Neralkar <neralkarad15.it@coep.ac.in>

ENV DEBIAN_FRONTEND noninteractive

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	 apt-cache depends texlive-full \
	 | grep -v Suggests \
	 | grep -v texlive-full \
	 | grep -v i386 | cut -d' '  -f 4 | grep -v -- '-doc' \
	 | grep -v lang | \
	 xargs apt-get install --no-install-recommends -y \
		texlive-lang-english \
		latexmk \
		biber \
		dot2tex \
		inkscape \
		gnuplot \
		graphviz \
		plantuml \
		dia \
		&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
