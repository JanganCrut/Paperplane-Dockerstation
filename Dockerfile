#
# We're using Alpine linux by default.
# to use clearlinux, change latest to clearlinux
#
FROM raphielscape/paperplanebase:latest

ENV PATH="/app/bin:$PATH"
WORKDIR /app

RUN git clone https://github.com/RaphielGang/Telegram-Paperplane.git -b staging /app

#
# Copies session and config(if it exists)
#
COPY ./userbot.session ./config.env* ./client_secrets.json* ./secret.json* /app/

#
# Finalization
#
CMD ["sh","init/start.sh"]
