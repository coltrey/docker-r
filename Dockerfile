FROM r-base:4.0.3

RUN apt-get update
RUN for pkg in \
    data.table \
    forecast \
    ggExtra \
    ggplot2 \
    ggthemes \
    plotly \
    plyr \
    uuid \
; do echo "install.packages('${pkg}', repos='http://cran.us.r-project.org')" | R --no-save --no-restore ; done
