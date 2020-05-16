#
# We're using Alpine linux by default.
# to use clearlinux, change latest to clearlinux
#
FROM raphielscape/paperplanebase:latest

RUN git clone https://github.com/RaphielGang/Telegram-Paperplane.git -b compose /app

#
# Copies session and config(if it exists)
#
COPY ./client_secrets.json* ./secret.json* /app/

#
# Finalization
#
CMD [ "sh", "init/start.sh" ]