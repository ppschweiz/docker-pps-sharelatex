FROM sharelatex/sharelatex

# Install full environment
RUN tlmgr update --self
RUN tlmgr install scheme-full

# Install PPS styles
RUN git clone https://github.com/ppschweiz/mmd /usr/local/texlive/texmf-local/tex/latex/ppsstyle

RUN mkdir -p /usr/local/texlive/texmf-local/fonts/truetype

RUN curl http://www.fontsquirrel.com/fonts/download/Aller -o /tmp/aller.zip
RUN unzip /tmp/aller.zip -d /usr/share/fonts/truetype
RUN texhash
ADD clsi.conf /etc/nginx/sites-enabled/clsi.conf
EXPOSE 81
