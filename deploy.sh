docker build -t ubosquet/multi-client-k8s:latest -t ubosquet/multi-client-k8s:$SHA -f ./client/Dockerfile ./client
docker build -t ubosquet/multi-server-k8s-pgfix:latest -t ubosquet/multi-server-k8s-pgfix:$SHA -f ./server/Dockerfile ./server
docker build -t ubosquet/multi-worker-k8s:latest -t ubosquet/multi-worker-k8s:$SHA -f ./worker/Dockerfile ./worker

docker push ubosquet/multi-client-k8s:latest
docker push ubosquet/multi-server-k8s-pgfix:latest
docker push ubosquet/multi-worker-k8s:latest

docker push ubosquet/multi-client-k8s:$SHA
docker push ubosquet/multi-server-k8s-pgfix:$SHA
docker push ubosquet/multi-worker-k8s:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ubosquet/multi-server-k8s-pgfix:$SHA
kubectl set image deployments/client-deployment client=ubosquet/multi-client-k8s:$SHA
kubectl set image deployments/worker-deployment worker=ubosquet/multi-worker-k8s:$SHA