.PHONY: scaffold
scaffold:
	kubekutr -c kubekutr.yml scaffold -o .

.PHONY: build-k8s-local
build-k8s-local: scaffold
	export $(cat base/configs/password | xargs)
	envsubst < base/configs/AdGuardHome.tmpl.yml | tee base/configs/AdGuardHome.yml > /dev/null
	kustomize build base --load_restrictor none

.PHONY: deploy-k8s-local
deploy-k8s-local: build-k8s-local
	kustomize build base/ --load_restrictor none | kubectl apply -f -
