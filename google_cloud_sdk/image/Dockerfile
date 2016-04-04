FROM gcr.io/google_appengine/base

# Prepare the image.
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y -qq --no-install-recommends wget lsb-release unzip python php5-mysql php5-cli php5-cgi openjdk-7-jre-headless openssh-client python-openssl && apt-get clean

# Install instructions from https://cloud.google.com/sdk/downloads#versioned
# Install the Google Cloud SDK.
ENV HOME /
ENV CLOUDSDK_PYTHON_SITEPACKAGES 1

RUN wget "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-103.0.0-linux-x86_64.tar.gz"
RUN tar zxvf "google-cloud-sdk-103.0.0-linux-x86_64.tar.gz"


# Create an environment variable for the correct distribution
# Add the Cloud SDK distribution URI as a package source
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list

# Run gcloud init to get started
#RUN gcloud init

ENV PATH /google-cloud-sdk/bin:$PATH

RUN gcloud components install gcd-emulator alpha beta app-engine-python pubsub-emulator

# Disable updater check for the whole installation.
# Users won't be bugged with notifications to update to the latest version of gcloud.
#RUN /usr/lib/google-cloud-sdk/bin/gcloud config set --installation component_manager/disable_update_check true

# Disable updater completely.
# Running `gcloud components update` doesn't really do anything in a union FS.
# Changes are lost on a subsequent run.
#RUN sed -i -- 's/\"disable_updater\": false/\"disable_updater\": true/g' /usr/lib/google-cloud-sdk/lib/googlecloudsdk/core/config.json

RUN mkdir /.ssh
ENV PATH /usr/lib/google-cloud-sdk/bin:$PATH
VOLUME ["/.config"]
CMD ["/bin/bash"]
