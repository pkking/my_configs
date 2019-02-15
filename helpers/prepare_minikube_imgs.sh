#!/usr/bin/bash
kubeimgs=(
    "kube-controller-manager-amd64" 
    "kube-proxy-amd64" 
    "kube-apiserver-amd64" 
    "kube-scheduler-amd64"
)
kubever="v1.10.0"

for img in ${kubeimgs[@]};do
    sudo docker pull gcr.mirrors.ustc.edu.cn/google_containers/$img:$kubever
    sudo docker tag gcr.mirrors.ustc.edu.cn/google_containers/$img:$kubever  k8s.gcr.io/$img:$kubever
done

#etcd
sudo docker pull gcr.mirrors.ustc.edu.cn/google_containers/etcd-amd64:3.1.12
sudo docker tag gcr.mirrors.ustc.edu.cn/google_containers/etcd-amd64:3.1.12 k8s.gcr.io/etcd-amd64:3.1.12

#dnsmasq
sudo docker pull gcr.mirrors.ustc.edu.cn/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.8
sudo docker tag gcr.mirrors.ustc.edu.cn/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.8 k8s.gcr.io/k8s-dns-dnsmasq-nanny-amd64:1.14.8

#kube dns
sudo docker pull gcr.mirrors.ustc.edu.cn/google_containers/k8s-dns-kube-dns-amd64:1.14.8
sudo docker tag gcr.mirrors.ustc.edu.cn/google_containers/k8s-dns-kube-dns-amd64:1.14.8 k8s.gcr.io/k8s-dns-kube-dns-amd64:1.14.8

#dns sidecar
sudo docker pull gcr.mirrors.ustc.edu.cn/google_containers/k8s-dns-sidecar-amd64:1.14.8
sudo docker tag gcr.mirrors.ustc.edu.cn/google_containers/k8s-dns-sidecar-amd64:1.14.8 k8s.gcr.io/k8s-dns-sidecar-amd64:1.14.8

#pause
sudo docker pull gcr.mirrors.ustc.edu.cn/google_containers/pause-amd64:3.1
sudo docker tag gcr.mirrors.ustc.edu.cn/google_containers/pause-amd64:3.1 k8s.gcr.io/pause-amd64:3.1

#flannel
sudo docker pull quay.io/coreos/flannel:v0.9.1-amd64

#addon  manager
sudo docker pull gcr.mirrors.ustc.edu.cn/google_containers/kube-addon-manager:v8.6
sudo docker tag gcr.mirrors.ustc.edu.cn/google_containers/kube-addon-manager:v8.6 k8s.gcr.io/kube-addon-manager:v8.6

#dashboard
sudo docker pull gcr.mirrors.ustc.edu.cn/google_containers/kubernetes-dashboard-amd64:v1.8.1
sudo docker tag gcr.mirrors.ustc.edu.cn/google_containers/kubernetes-dashboard-amd64:v1.8.1 k8s.gcr.io/kubernetes-dashboard-amd64:v1.8.1

#storage provisioner
sudo docker pull gcr.mirrors.ustc.edu.cn/k8s-minikube/storage-provisioner:v1.8.1
sudo docker tag gcr.mirrors.ustc.edu.cn/google_containers/storage-provisioner:v1.8.1 gcr.io/k8s-minikube/storage-provisioner:v1.8.1