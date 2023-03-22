FROM r-base:4.2.2
ENV PDQVER=7.0-0
RUN apt-get update
RUN apt-get -y install \
    curl \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libssl-dev

RUN curl -Lo /tmp/pdq_${PDQVER}.tar.gz https://sourceforge.net/projects/pdq-qnm-pkg/files/PDQ-R%20Source/${PDQVER}/pdq_${PDQVER}.tar.gz/download

RUN for pkg in \
    data.table \
    dplyr \
    forecast \
    ggExtra \
    ggforce \
    ggmap \
    ggplot2 \
    ggthemes \
    httr \
    lubridate \
    plotly \
    plyr \
    purrr \
    readxl \
    scales \
    uuid \
    XML \
; do echo "install.packages('${pkg}', repos='http://cran.us.r-project.org')" | R --no-save --no-restore ; done
RUN R CMD INSTALL /tmp/pdq_${PDQVER}.tar.gz
