# Fail fast.
set -e

# Check that git is installed.
git remote show origin > /dev/null || {
    echo 'ERROR: make sure you are in the git folder and also git logged in';
    exit 1;
}

# Define some useful variables.
STABLE_TAG=$(git log -n 1 --pretty='format:%cd-%h' --date=format:'%Y%m%d%H%M')
REPORSITORY_URL_WITH_STABLE_TAG="rodrigojbcs/cloud-infrastructure:${STABLE_TAG}"
BUILD_FOLDER=.

# Check that docker is installed and running.
which docker > /dev/null && docker ps > /dev/null || {
    echo 'ERROR: docker is not running';
    exit 1;
}

# Authentication in the docker.
echo "Authenticating and pushing image to Docker Hub"
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

echo "Building ${REPORSITORY_URL_WITH_STABLE_TAG} from ${BUILD_FOLDER}/Dockerfile"

# Build image.
docker build -t ${REPORSITORY_URL_WITH_STABLE_TAG} ${BUILD_FOLDER}

# Publish image.
docker push ${REPORSITORY_URL_WITH_STABLE_TAG}

echo "Image published in ${REPORSITORY_URL_WITH_STABLE_TAG}"