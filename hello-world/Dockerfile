FROM perl:latest

COPY Hello/ /app/

WORKDIR /app

RUN cpanm Catalyst::Devel \
          Catalyst::Plugin::ConfigLoader \
          Catalyst::Plugin::Static::Simple \
          Config::General Catalyst::View::TT \
          Catalyst::Action::RenderView

CMD ["perl","script/hello_server.pl"]

