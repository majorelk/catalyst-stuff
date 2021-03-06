# hello world app - catalyst basics
FROM perl:latest

COPY hello-world/Hello/ /app/

WORKDIR /app

RUN cpanm Catalyst::Devel \
          Catalyst::Plugin::ConfigLoader \
          Catalyst::Plugin::Static::Simple \
          Config::General Catalyst::View::TT \
          Catalyst::Action::RenderView

CMD ["perl","script/hello_server.pl"]

# MyApp - more catalyst basics
FROM perl:latest

COPY MyApp/ /app/

RUN cpanm Catalyst::Devel \
          Catalyst::Plugin::ConfigLoader \
          Catalyst::Plugin::Static::Simple \
          Config::General Catalyst::View::TT \
          Catalyst::Action::RenderView

CMD ["perl","script/myapp_server.pl"]



# multi-stage build example:
# FROM golang:1.16
# WORKDIR /go/src/github.com/alexellis/href-counter/
# RUN go get -d -v golang.org/x/net/html  
# COPY app.go ./
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# FROM alpine:latest  
# RUN apk --no-cache add ca-certificates
# WORKDIR /root/
# COPY --from=0 /go/src/github.com/alexellis/href-counter/app ./
# CMD ["./app"]  
