#!/usr/bin/env bash

if env | grep -q ROOT_CA_; then
  mkdir -p $HOME/.pki/nssdb
  certutil -N --empty-password -d sql:$HOME/.pki/nssdb
  for e in $(env | grep ROOT_CA_ | sed -e 's/=.*$//'); do
    certname=$(echo -n $e | sed -e 's/ROOT_CA_//')
    echo ${!e} | base64 -d >/tmp/cert.pem
    certutil -A -n ${certname} -t "TC,C,T" -i /tmp/cert.pem -d sql:$HOME/.pki/nssdb
    if cat tmp/cert.pem | grep -q "PRIVATE KEY"; then
      PRIVATE_KEY_PASS=${PRIVATE_KEY_PASS:-\'\'}
      openssl pkcs12 -export -in /tmp/cert.pem -clcerts -nodes -out /tmp/key.p12 -passout pass:${PRIVATE_KEY_PASS} -passin pass:${PRIVATE_KEY_PASS}
      pk12util -d sql:$HOME/.pki/nssdb -i /tmp/key.p12 -W ${PRIVATE_KEY_PASS}
      rm /tmp/key.p12
    fi
    rm /tmp/cert.pem
  done
fi

GOOGLE_CHROME_ARGS=${GOOGLE_CHROME_ARGS:-""}

/usr/bin/google-chrome-stable --no-sandbox --start-maximized --no-first-run --enable-automation --disable-notifications ${GOOGLE_CHROME_ARGS}
