FROM cypress/base:12

LABEL maintainer="Lucas Tinoco"

COPY .  /var/e2e
WORKDIR /var/e2e

RUN npm i -g cypress@5.6.0
RUN sed -i -e 's|api_url:.*$|api_url: "https://sorry-cypress-demo-director.herokuapp.com/"|g' ~/.cache/Cypress/5.6.0/Cypress/resources/app/packages/server/config/app.yml

CMD cypress run --group general --ci-build-id $(date +'%F/%T') --record --key anykey