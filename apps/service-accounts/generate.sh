set -euo pipefail
BASE="apps/service-accounts"
mkdir -p "$BASE"

for i in $(seq -w 001 100); do
  DIR="$BASE/app-$i"
  mkdir -p "$DIR"

  # Minimal resource: just a ServiceAccount
  cat > "$DIR/serviceaccount.yaml" <<'YAML'
apiVersion: v1
kind: ServiceAccount
metadata:
  name: stress-sa
YAML

  # Kustomize to give each SA a unique suffix and target namespace
  cat > "$DIR/kustomization.yaml" <<EOF
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: sa-stress
nameSuffix: "-$i"
resources:
  - serviceaccount.yaml
EOF
done

git add apps/service-accounts
git commit -m "Add 100 stress ServiceAccount apps"
git push
