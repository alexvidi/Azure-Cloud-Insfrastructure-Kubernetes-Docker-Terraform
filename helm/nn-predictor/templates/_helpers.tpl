{{- define "nn-predictor.name" -}}
nn-predictor
{{- end -}}

{{- define "nn-predictor.labels" -}}
app.kubernetes.io/name: {{ include "nn-predictor.name" . }}
app.kubernetes.io/component: api
app.kubernetes.io/part-of: aks-fastapi-demo
app.kubernetes.io/managed-by: Helm
{{- end -}}
