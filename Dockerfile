FROM clearlinux:base

#
# Download and install all the core bundles
# for Paperplane
#
RUN swupd bundle-add \
	jq \
	git \
	curl \
	python-extras \
	python3-basic \
	sysadmin-basic \
	redis-native \
	libxml2 \
	devpkg-libxml2 \
	devpkg-libwebp \
	devpkg-libffi \
	devpkg-openssl \
	devpkg-libxslt \
	devpkg-zlib \
	devpkg-libjpeg-turbo \
# Install the required dependencies
	&& pip install --no-cache-dir -r \
	https://raw.githubusercontent.com/RaphielGang/Paperplane-Dockerstation/coredocker/requirements.txt \
# Remove one-time usage bundles
	&& swupd bundle-remove \
	libxml2 \
	devpkg-libwebp \
	devpkg-libffi \
	devpkg-openssl \
	devpkg-libxslt \
	devpkg-libxml2 \
	devpkg-zlib \
	devpkg-libjpeg-turbo

#
# Sandbox used by Paperplane
#

RUN mkdir /app && chmod 777 /app

CMD ["python3"]