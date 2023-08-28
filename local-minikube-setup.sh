# Fail fast.
set -e

# Check that kubectl is installed.
which kubectl > /dev/null || {
    echo 'ERROR: kubectl is not installed';
    exit 1;
}

# Check that minikube is installed.
which minikube > /dev/null || {
    echo 'ERROR: minikube is not installed';
    exit 1;
}

# Start the minikube-multinode with 3 nodes.
minikube start --nodes 3 -p minikube-multinode --kubernetes-version v1.26.3 --driver=docker

# Fix the kubectl context, as it's often stale.
minikube -p minikube-multinode update-context

# Add ingress addon to the minikube cluster.
minikube -p minikube-multinode addons enable ingress

# Display the cluster informations.
echo "Get cluster details to check its running"
kubectl get nodes
kubectl cluster-info

# Deploy artifacts to the kubernetes cluster.
kubectl apply -f kube/