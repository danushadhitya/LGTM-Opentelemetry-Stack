#Install jsonnet and jsonnet bundler
go install github.com/google/go-jsonnet/cmd/jsonnet@latest
go install github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest

git clone https://github.com/kubernetes-monitoring/kubernetes-mixin.git
cd kubernetes-mixin
export PATH=$PATH:$HOME/go/bin
jb install https://github.com/kubernetes-monitoring/kubernetes-mixin.git

#Build grafana dashboards
make prometheus_alerts.yaml
make prometheus_rules.yaml
make dashboards_out

mv prometheus_alerts.yaml prometheus_rules.yaml dashboards_out/ ../