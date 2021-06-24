FROM quay.imanuel.dev/dockerhub/library---golang:1.16-alpine as build
WORKDIR /app
COPY . .

RUN go build -o /kubernetes-deployment-version-checker

FROM quay.imanuel.dev/dockerhub/library---alpine:latest

COPY --from=build /kubernetes-deployment-version-checker /kubernetes-deployment-version-checker

CMD ["/kubernetes-deployment-version-checker"]